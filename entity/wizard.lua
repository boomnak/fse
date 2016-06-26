

local Class = require 'lib.hump.class'
local Vector = require 'lib.hump.vector'

local Event = require 'event'
local InputMan = require 'inputman'

local Wizard = Class({})

Wizard.filterType = 'cross'
Wizard.name = 'wizard'

function Wizard:init(game, entity)
  self.image = love.graphics.newImage('img/spr/wizard.png')
  -- Position.
  self.pos = Vector(entity.x, entity.y)
  -- Dimensions
  self.dim = Vector(self.image:getWidth(), self.image:getHeight())
  self.hitbox = { pos = self.pos:clone(), dim = self.dim:clone() }
  self.speed = 100 -- running speed, in m/s
  self.ySpeed = 0
  
  -- If the wizard has already been defeated and the player already has the
  -- crown, then hide the wizard when the map loads.
  if Event.sandbox.vars.gotCrown then
    self:eventDone()
  end
  
  self.game = game
  self.game.world:add(self, self.pos.x, self.pos.y, self.dim.x, self.dim.y)
end

function Wizard:update(dt)
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

function Wizard:draw()
  love.graphics.draw(self.image, math.floor(self.pos.x), math.floor(self.pos.y))
end

function Wizard:onPlayer(player)
  if self.collidedWithPlayer then return end
  -- Run the wizard event.
  Event:addFromCaller(self, 'wizard.lua')
  
  self.collidedWithPlayer = true
end

function Wizard:eventDone()
  -- If the player defeated the wizard, hide it.
  self.onPlayer = function() end
  self.update = function() end
  self.draw = function() end
end

return Wizard
