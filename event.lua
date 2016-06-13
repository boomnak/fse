--

local InputMan = require 'inputman'
local MessageBox = require 'messagebox'

local Event = {}

function Event:init(game)
  -- Set up the event module.
  
  -- Initialize the events table, which holds every event that is
  -- currently running.
  self.events = {}
  -- The drawables table holds all objects that need drawn.
  self.drawFuncs = {}
  
  self.game = game
end

function Event:addNew(file)
  -- Create a new thread with it's own environment, allowing sandboxed
  -- execution of an event that can be paused and resumed.
  local event = love.filesystem.load('event/' .. file)
  setfenv(event, self.sandbox)
  
  -- Append the new event to the end of the current events table.
  self.events[#self.events+1] = {event = coroutine.create(event)}
end

function Event:addFromCaller(caller, file)
  local event = love.filesystem.load('event/' .. file)
  setfenv(event, self.sandbox)
  
  self.events[#self.events+1] = {
    event = coroutine.create(event),
    caller = caller,
  }
end

function Event:update(dt)
  -- Update every currently running event.
  for i = #self.events,1,-1 do
    local success, removeEvent = coroutine.resume(self.events[i].event, i, dt)
    if removeEvent or coroutine.status(self.events[i].event) == 'dead' then
      if self.events[i].caller then
        -- If the event was run by an event runner, tell it the event
        -- is over.
        self.events[i].caller:eventDone()
      end
      
      -- If the coroutine returns true, delete it.
      table.remove(self.events, i)
    end
  end
end

function Event:draw()
  -- Draw every draw function that has been set.
  for i = 1,#self.drawFuncs do
    self.drawFuncs[i]()
  end
end

-- Create the sandbox table, which holds the environment of the events.
Event.sandbox = {}
local SB = Event.sandbox
-- The vars table is used to allow events to have variables that
-- last longer than the event itself, as well as allowing events
-- to communicate.
SB.vars = {}

-- Functions that apply to only 1 entity.
function SB.getEntity(name)
  local e = Event.game.entities
  for i = 1,#e do
    if e[i].name == name then
      return e[i]
    end
  end
end
function SB.freezeEntity(name)
  -- Freezing disables the entities update function.
  
end

-- Functions that apply to multiple entities.
function SB.getEntities(name)
  return Event.game.entities
end
function SB.freezeEntities(name)
  local e = Event.game.entities
  for i = 1,#e do
    Event.sandbox.freeze(e[i])
  end
end

-- Functions that apply to the whole game.
function SB.message(text)
  -- Append its draw function to the drawFuncs table.
  local newDrawFunc = #Event.drawFuncs + 1
  Event.drawFuncs[newDrawFunc] = function()
    love.graphics.print(text, 10, 10)
  end
  
  repeat 
    coroutine.yield()
  until InputMan:down('interact')
  
  table.remove(Event.drawFuncs, newDrawFunc)
end

function SB.endEvent(eventNumber)
  if eventNumber then
    -- Remove event at index eventNumber.
    table.remove(Event.events, eventNumber)
  else
    -- If eventNumber was not passed, end the current event.
    coroutine.yield(true)
  end
end

return Event
