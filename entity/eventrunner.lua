--

local Class = require 'lib.hump.class'
local Vector = require 'lib.hump.vector'

local Event = require 'event'
local InputMan = require 'inputman'

local EventRunner = Class({})

function EventRunner:init(game, object)
  self.game = game
  
  -- Get some attributes from the map object.
  self.isRunning = false
  self.file = object.properties.file
  self.warp = object.properties.warp
  self.name = object.properties.name
  -- runOnce makes the event only run once on the current map.
  self.runOnce = object.properties.runOnce
  -- Run on key makes it so the event only runs when a certain key
  -- is pressed.
  self.runOnKey = object.properties.runOnKey
  -- oncePerCollison makes it so the event runs once when the player
  -- enters it, rather than repeating.
  if object.properties.oncePerCollision then
    self.oncePerCollision = true
    self.collidingWithPlayer = 0
  end
  
  -- Position
  self.pos = Vector(object.x, object.y)
  -- Dimensions
  self.dim = Vector(object.width, object.height)
  -- Add it to the bump collision world.
  game.world:add(self, self.pos.x, self.pos.y, self.dim.x, self.dim.y)
end

function EventRunner:update(dt)
  -- Update the entity, and check for collisions with the player.
  local _, _, cols, len = self.game.world:move(self, self.pos.x, self.pos.y)
  
  if self.oncePerCollision == true then
    local hitPlayer = false
    for i = 1,len do
      if cols[i].other.name == 'player' then
        hitPlayer = true
      end
    end
    if not hitPlayer then
      self.collidingWithPlayer = 0
    else
      self.collidingWithPlayer = self.collidingWithPlayer + 1
    end
  end
end

function EventRunner:draw()
  -- There is nothing to draw.
end

function EventRunner:onPlayer()
  if self.runOnKey and not InputMan:down(self.runOnKey) then
    -- If the event is set to only run when a certain key is held down,
    -- don't run it if the key isn't down.
    return
  end
  
  if self.oncePerCollision == true and self.collidingWithPlayer > 1 then
    return
  end
  
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
