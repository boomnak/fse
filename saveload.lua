-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- created:     June 18, 2016
-- file:        saveload.lua
-- teacher:     Mr. Sarros
-- Contains functions for saving and loading of saved games.

local Serpent = require 'lib.serpent.src.serpent'

local Event = require 'event'

local SaveLoad = {}

function SaveLoad.save(game, saveFile)
  local data = {}
  
  -- Retreive the data necessecary for the save file.
  data.vars = Event.sandbox.vars
  data.player = game.player
  
  local player
  -- Find the player in the current entities.
  for i = 1, #game.entities do
    if game.entities[i].name == 'player' then
      player = game.entities[i]
      break
    end
  end
  data.player.x, data.player.y = player.pos.x, player.pos.y
  
  -- Serialize the data.
  local sdata = 'return ' .. Serpent.block(data)
  
  game.player.x, game.player.y = nil, nil
  
  -- Write the serialized data to the save file.
  love.filesystem.write(saveFile, sdata, sdata:len())
end

function SaveLoad.load(game, saveFile)
  local data = {}
  
  -- Retreive the data from the savefile and load it.
  data = love.filesystem.load(saveFile)()
  
  Event.sandbox.vars = data.vars
  game.player = data.player
  
  local x, y = data.player.x, data.player.y
  game.player.x, game.player.y = nil, nil
  
  game:switchMap('overworld', x, y)
end

return SaveLoad
