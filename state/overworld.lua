-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- student nos: 
-- created:     , 2016
-- file:        main.lua
-- teacher:     Mr. Sarros
-- The Intro state is the initial state in the game, that displays the intro
-- screen, and then the main menu.

local bump = require 'lib.bump.bump'
local Camera = require 'lib.hump.camera'
local GS = require 'lib.hump.gamestate'
local Timer = require 'lib.hump.timer'

local Event = require 'event'
local InputMan = require 'inputman'
local Map = require 'map'
local Player = require 'entity.overworld.player'

local Overworld = {}

-- init is called once, when HUMP creates the gamestate the first time.
-- Every following switch only calls enter. As such, it loads up the resources
-- used by the Overworld state and stores them for further use.
function Overworld:init()
end

-- enter is called everytime Overworld is switched to.
function Overworld:enter(prev, game, playerx, playery)
  -- Create a new bump world.
  self.game = game
  self.game.world = bump.newWorld(64)
  
  self.entities = {}
  self.game.entities = self.entities
  
  -- Make a new game camera.
  self.game.camera = Camera()
  
  self.map = Map(game, 'overworld')
  self.game.map = self.map
  
  if playerx or playery then
    -- If a player position was passed.
    self.entities[#self.entities+1] = Player(game,
      {x = playerx, y = playery, width = 32, height = 32})
  else
    -- Set the player default position.
    self.entities[#self.entities+1] = Player(game,
      {x = 384, y = 288, width = 32, height = 32})
  end
  
  -- Initialize the Event handler.
  Event:init(game)
  -- Initialize the Input manager.
  InputMan:init(game)
end

-- update is called once per frame.
function Overworld:update(dt)
  self.map:update(dt)
  
  Event:update(dt)
  InputMan:update(dt)
  
  Timer.update(dt)
end

-- draw is called once per frame, after update, and after the screen
-- has been cleared.
function Overworld:draw()
  self.game.camera:zoomTo(self.game.sx, self.game.sy)
  self.game.camera:attach()
  self.map:draw()
  self.game.camera:detach()
  
  love.graphics.push()
  love.graphics.scale(self.game.sx, self.game.sy)
  Event:draw()
  InputMan:draw()
  love.graphics.pop()
end

return Overworld
