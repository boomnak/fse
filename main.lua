-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- student nos: 
-- created:     , 2016
-- file:        main.lua
-- teacher:     Mr. Sarros
-- This is the entry file that Love2D loads in order to start the program.
-- It runs the Intro gamestate.

local GS = require 'lib.hump.gamestate'

local Intro = require 'state.intro'
local Overworld = require 'state.overworld'
local Sidescroller = require 'state.sidescroller'

-- love.load is the function called by Love2D to start the program.
function love.load(arg)
  -- Enable debugging in Zerobrane Studio.
  if arg[#arg] == '-debug' then require('mobdebug').start() end
  
  -- Create the game table, which will contain important game information
  -- and be used as the basis for save files.
  local game = {
    -- Set up the scale values for the game.
    width = 640,
    height = 480,
    sx = love.graphics.getWidth() / 640,
    sy = love.graphics.getHeight() / 480,
  }
  
  -- Set up some utility functions.
  function game:switchMap(map, x, y)
    if map == 'overworld' then
      GS.switch(Overworld, self, x, y)
    else
      GS.switch(Sidescroller, self, map, x, y)
    end
  end
  function game:reset()
    GS.switch(Intro, self)
  end
  
  -- Initialize the gamestate library to handle the Love2D event callbacks.
  GS.registerEvents()
  GS.switch(Intro, game)
end
