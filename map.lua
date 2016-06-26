--

local sti = require 'lib.sti'
local Class = require 'lib.hump.class'

local EventRunner = require 'entity.eventrunner'

local Map = Class({})

function Map:init(game, path)
  -- Load the map using the Simple Tiled Implementation library.
  self.map = sti.new('map/' .. path .. '.lua', { 'bump' })
  self.map:bump_init(game.world)
  
  -- Load the entities from the map.
  for key, object in pairs(self.map.objects) do
    if object.properties.entity then
      -- Get the class of the entity from the map file.
      local entityClass = love.filesystem.load(
        'entity/' .. object.properties.file)()
      -- Create a new instance of the entity class.
      game.entities[#game.entities+1] = entityClass(game, object)
      
    elseif object.properties.event then
      -- If the object has an event property, create an eventRunner
      -- entity at that spot.
      game.entities[#game.entities+1] = EventRunner(game, object)
    end
  end
  
  -- Find the object layer in self.map.layers.
  local objectLayerIndex 
  for i = 1,#self.map.layers do
    if self.map.layers[i] == self.map.layers.object then
      objectLayerIndex = i
      break
    end
  end
  
  -- Add the entity layer to the map, right above the map's object layer.
  self.entityLayer = self.map:addCustomLayer('entity', objectLayerIndex)
  self.entityLayer.entities = game.entities
  
  -- Add the update and draw functions to the entity layer.
  self.entityLayer.update = function(self, dt)
    -- Iterate through each entity, and call their update method with
    -- dt as the parameter.
    for i = 1,#self.entities do
      self.entities[i]:update(dt)
    end
  end
  self.entityLayer.draw = function(self)
    -- Iterate through each entity, and call their draw method.
    for i = 1,#self.entities do
      self.entities[i]:draw()
    end
  end  
end

function Map:update(dt)
  self.map:update(dt)
end

function Map:draw()
  self.map:draw()
end

function Map:getWidth()
  return self.map.layers[1].width * self.map.tilewidth
end

function Map:getHeight()
  return self.map.layers[1].height * self.map.tileheight
end

return Map
