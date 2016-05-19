-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- student nos: 
-- created:     , 2016
-- file:        main.lua
-- teacher:     Mr. Sarros
-- This is the entry file that Love2D loads in order to start the program.
-- It runs the Intro gamestate.

local GS = require 'lib.hump.gamestate'

local Intro = require 'states.intro'

-- love.load is the function called by Love2D to start the program.
function love.load(arg)
  -- Enable debugging in Zerobrane Studio.
  if arg[#arg] == '-debug' then require('mobdebug').begin() end
  
  -- Initialize the gamestate library to handle the Love2D event callbacks.
  GS.registerEvents()
  GS.switch(Intro)
end

-- love.restart will be used to return to the Intro state, and thus restart
-- the game.
function love.restart()
  GS.switch(Intro)
end
