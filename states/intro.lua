-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- student nos: 
-- created:     , 2016
-- file:        main.lua
-- teacher:     Mr. Sarros
-- The Intro state is the initial state in the game, that displays the intro
-- screen, and then the main menu.

local Timer = require 'lib.hump.timer'
local GS = require 'lib.hump.gamestate'

local Intro = {}

-- init is called once, when HUMP creates the gamestate the first time.
-- Every following switch only calls enter. As such, it loads up the resources
-- used by the Intro state and stores them for further use.
function Intro:init()
  self.i = 0
end

-- enter
function Intro:enter(prev)
  self.i = self.i + 1
  
  Timer.after(1, love.restart)
end

function Intro:update(dt)
  Timer.update(dt)
end

function Intro:draw()
  love.graphics.print('Iteration: ' .. self.i, 10, 10)
end

return Intro
