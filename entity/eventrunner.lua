--

local Class = require 'lib.hump.class'
local Vector = require 'lib.hump.vector'

local Event = require 'event'

local EventRunner = Class({})

function EventRunner:init(game, object)
  self.game = game
  
  self.isRunning = false
  self.file = object.properties.file
  self.warp = object.properties.warp
  self.name = object.properties.name
  
  if object.properties.runOnce then
    self.runOnce = true
  end
  
  -- Position
  self.pos = Vector(object.x, object.y)
  -- Dimensions
  self.dim = Vector(object.width, object.height)
  -- Add it to the bump collision world.
  game.world:add(self, self.pos.x, self.pos.y, self.dim.x, self.dim.y)
end

function EventRunner:update(dt)
  -- If the event is no longer running, set it to not running.
end

function EventRunner:draw()
  -- There is nothing to draw.
end

function EventRunner:onPlayer()
  if not self.isRunning and self.file then
    -- If the player hits the event, and the event is not currently
    -- running, run the event.
    Event:addFromCaller(self, self.file)
    self.isRunning = true
    
  elseif self.warp then
    -- Return the values stored in self.warp
    local map, x, y = loadstring('return ' .. self.warp)()
    -- Switch maps.
    self.game:switchMap(map, x, y)
  end
end

function EventRunner:eventDone()
  -- If the event is set to only run once, then don't set isRunning to
  -- false; this makes the entity never start the event again.
  if not self.runOnce then
    self.isRunning = false
  end
end

return EventRunner
