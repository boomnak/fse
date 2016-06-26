-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- student nos: 
-- created:     , 2016
-- file:        main.lua
-- teacher:     Mr. Sarros
-- The Intro state is the initial state in the game, that displays the intro
-- screen, and then the main menu.

local GS = require 'lib.hump.gamestate'
local suit = require 'lib.suit'

local Event = require 'event'
local Overworld = require 'state.overworld'
local SaveLoad = require 'saveload'

local Intro = {}

-- init is called once, when HUMP creates the gamestate the first time.
-- Every following switch only calls enter. As such, it loads up the resources
-- used by the Intro state and stores them for further use.
function Intro:init()
end

-- enter
function Intro:enter(prev, game)
  self.game = game
  
  -- Set up the player.
  self.game.player = {
    gold = 0,
    level = 1,
    exp = 0,
    expNeeded = 10,
    maxHP = 10,
    HP = 10,
    attack = 2,
    defence = 0,
    items = {},
    weaponAttack = 0,
    armorDefence = 0,
  }
end

function Intro:update(dt)
  suit.layout:reset()
  
  suit.Label('Boomnack FSE Project', suit.layout:row(300, 30))
  
  if suit.Button('Play Game', suit.layout:row(300, 30)).hit then
    -- Go to the game's starting map.
    self.game:switchMap('potionselect', 192, 288)
  elseif suit.Button('Load', suit.layout:row(300, 30)).hit then
    SaveLoad.load(self.game, 'save1.save')
  end
end

function Intro:draw()
  suit.draw()
end

return Intro
