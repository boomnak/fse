

local Class = require 'lib.hump.class'
local Vector = require 'lib.hump.vector'

local Event = require 'event'
local InputMan = require 'inputman'

local EvilGuard = Class({})

EvilGuard.filterType = 'cross'
EvilGuard.name = 'evilguard'

function EvilGuard:init(game, entity)
  self.image = love.graphics.newImage('img/evilguard.png')
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

function EvilGuard:update(dt)
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

function EvilGuard:draw()
  love.graphics.draw(self.image, math.floor(self.pos.x), math.floor(self.pos.y))
end

function EvilGuard:onPlayer(player)
  if self.collidedWithPlayer then return end
  
  Event:addStringFromCaller(self, 'battle({"evilguard"})')
  
  self.collidedWithPlayer = true
end

function EvilGuard:eventDone()
  -- If the EvilGuard fought the player, destroy it.
  self.onPlayer = function() end
  self.update = function() end
  self.draw = function() end
end

return EvilGuard
