

local Class = require 'lib.hump.class'
local Vector = require 'lib.hump.vector'

local Event = require 'event'
local InputMan = require 'inputman'

local Alexander = Class({})

Alexander.filterType = 'cross'
Alexander.name = 'alexander'

function Alexander:init(game, entity)
  self.image = love.graphics.newImage('img/spr/alexander_spr.png')
  -- Position.
  self.pos = Vector(entity.x, entity.y)
  -- Dimensions
  self.dim = Vector(self.image:getWidth(), self.image:getHeight())
  self.hitbox = { pos = self.pos:clone(), dim = self.dim:clone() }
  self.speed = 100 -- running speed, in m/s
  self.ySpeed = 0
  
  self.game = game
  self.game.world:add(self, self.pos.x, self.pos.y, self.dim.x, self.dim.y)
end

function Alexander:update(dt)
  -- Update the entity, and check for collisions with the player.
  local _, _, cols, len = self.game.world:move(
    self, self.pos.x, self.pos.y, function() return 'cross' end)
  
  -- Check if any collisions were with the player.
  local hitPlayer = false
  for i = 1,len do
    if cols[i].other.name == 'player' then
      hitPlayer = true
    end
  end
  if not hitPlayer then
    -- If not, then set the entity to be able to run again.
    self.collidedWithPlayer = false
  end
end

function Alexander:draw()
  love.graphics.draw(self.image, math.floor(self.pos.x), math.floor(self.pos.y))
end

function Alexander:onPlayer(player)
  if self.collidedWithPlayer then return end
  
  Event:addFromCaller(self, 'alexander.lua')
  
  self.collidedWithPlayer = true
end

function Alexander:eventDone()
  
end

return Alexander
