--

local GS = require 'lib.hump.gamestate'

local Battle = require 'state.battle'
local InputMan = require 'inputman'
local MessageBox = require 'messagebox'
local WonGame = require 'state.wongame'

local Event = {}

function Event:init(game)
  -- Set up the event module.
  
  -- Initialize the events table, which holds every event that is
  -- currently running.
  if self.events == nil then
    self.events = {}
  end
  
  self.game = game
  
  -- Create a new messagebox object, if there is none.
  if not self.game.mb then
    self.game.mb = MessageBox(self.game)
    self.mb = self.game.mb
    self.mb.visible = false
  end
end

function Event:addNew(file, runOnLoad)
  -- Create a new thread with it's own environment, allowing sandboxed
  -- execution of an event that can be paused and resumed.
  local event = love.filesystem.load('event/' .. file)
  setfenv(event, self.sandbox)
  
  -- Append the new event to the end of the current events table.
  self.events[#self.events+1] = {
    event = coroutine.create(event),
    runOnLoad = runOnLoad
  }
end

function Event:addFromCaller(caller, file, runOnLoad)
  local event = love.filesystem.load('event/' .. file)
  setfenv(event, self.sandbox)
  
  self.events[#self.events+1] = {
    event = coroutine.create(event),
    runOnLoad = runOnLoad,
    caller = caller,
  }
end

function Event:addString(string, runOnLoad)
  -- Create a new thread with it's own environment, allowing sandboxed
  -- execution of an event that can be paused and resumed.
  local event = loadstring(string)
  setfenv(event, self.sandbox)
  
  -- Append the new event to the end of the current events table.
  self.events[#self.events+1] = {
    event = coroutine.create(event),
    runOnLoad = runOnLoad
  }
end

function Event:addStringFromCaller(caller, string, runOnLoad)
  local event = loadstring(string)
  setfenv(event, self.sandbox)
  
  self.events[#self.events+1] = {
    event = coroutine.create(event),
    runOnLoad = runOnLoad,
    caller = caller,
  }
end

function Event:update(dt)
  -- Update every currently running event.
  for i = #self.events,1,-1 do
    local success, removeEvent = coroutine.resume(self.events[i].event, i, dt, self.events[i].runOnLoad)
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
  
  -- Update the messagebox.
  self.mb:update(dt)
end

function Event:draw()
  -- Draw the messagebox.
  self.mb:draw()
  
  -- If screen is faded, draw black rectangle to cover it.
  if self.fade then
    love.graphics.setColor(0, 0, 0, self.fadeAlpha)
    love.graphics.rectangle('fill', 0, 0, 640, 480)
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
  -- Get an entity based on it's name.
  local e = Event.game.entities
  for i = 1,#e do
    if e[i].name == name then
      return e[i], i
    end
  end
  return nil
end
function SB.freezeEntity(entity)
  -- Freezing disables the entities update function.
  entity.prevUpdate = entity.update
  entity.update = function() end
end
function SB.unfreezeEntity(entity)
  -- Reenable the entities update function.
  if entity.prevUpdate then
    entity.update = entity.prevUpdate
    entity.prevUpdate = nil
  end
end
function SB.removeEntity(entNum)
  table.remove(Event.game.entities, entNum)
end

-- Functions that apply to multiple entities.
function SB.getEntities()
  return Event.game.entities
end
function SB.freezeEntities()
  local e = Event.game.entities
  for i = 1,#e do
    SB.freezeEntity(e[i])
  end
end
function SB.unfreezeEntities()
  local e = Event.game.entities
  for i = 1,#e do
    SB.unfreezeEntity(e[i])
  end
end

-- Functions that apply to the messagebox.
function SB.addMessage(text)
  -- Add a message to the messagebox.
  SB.showMessage()
  Event.mb:addText(text)
end

function SB.clearMessage()
  -- Clear the messagebox of text.
  Event.mb:clear()
end

function SB.showMessage()
  Event.mb.visible = true
end

function SB.hideMessage()
  -- Hide the messagebox.
  Event.mb.visible = false
end

function SB.talk(text)
  -- Simplified method of displaying text.
  SB.addMessage(text)
	SB.waitFor("interact")
	SB.clearMessage()
  SB.hideMessage()
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

function SB.sleep(time)
  -- Pause the event for the given time.
  local t, dt = 0, 0
  
  while t < time do
    _, dt = coroutine.yield()
    t = t + dt
  end
end

function SB.warp(map, x, y)
  -- Warp the player to a different map.
  Event.game:switchMap(map, x, y)
end

function SB.teleport(location, xpos, ypos)
  SB.freezeEntities()
	SB.fadeout(0.25)
	SB.sleep(0.5)
	SB.warp(location, xpos, ypos)
	SB.fadein(0.25)
	SB.sleep(0.5)
  SB.unfreezeEntities()
end

function SB.move(entity, x, y, time)
  -- Move an entity x and y amount over a given time.
  local ox, oy = entity.pos:unpack()
  local t, dt = 0, 0
  
  while t < time do
    _, dt = coroutine.yield()
    t = t + dt
    
    entity.pos.x = ox + x * (t / time)
    entity.pos.y = oy + y * (t / time)
  end
end

function SB.moveTo(entity, x, y, time)
  -- Move an entity to a position over a given time.
  local ox, oy = entity.pos:unpack()
  local dx, dy = x - entity.pos.x, y - entity.pos.y
  local t, dt = 0, 0
  
  while t < time do
    _, dt = coroutine.yield()
    t = t + dt
    
    entity.pos.x = ox + dx * (t / time)
    entity.pos.y = oy + dy * (t / time)
  end
end

function SB.waitFor(key)
  -- Wait until the player hits 'key.'
  key = key or 'interact' -- key defaults to interact.
  -- Set the messagebox to show a 'press key...' message.
  Event.mb:pause()
  
  -- If the player is holding down the key, make them click
  -- it again before they can continue.
  local keyHeld = false
  if InputMan:down(key) then keyHeld = true end
  
  repeat
    coroutine.yield()
    if keyHeld and not InputMan:down(key) then
      -- If the user lets go of the interact key, let them continue.
      keyHeld = false
    end
  until InputMan:down(key) and not keyHeld
  
  -- Disable the messagebox pause message.
  Event.mb:unpause()
end

function SB.down(key)
  -- Return whether or not a key is held down.
  coroutine.yield()
  if InputMan:down(key) then
    return true
  else
    return false
  end
end

function SB.battle(enemies, cantFlee)
  -- Start a battle with enemies.
  GS.push(Battle, Event.game, enemies, cantFlee)
  coroutine.yield()
end

function SB.fadeout(time)
  -- Fade the screen to black, taking 'time' amount to get there.
  local t, dt = 0, 0
  Event.fade = true
  
  if time == nil or time == 0 then
    -- If no time is given or time is 0, set the screen to black right away.
    Event.fadeAlpha = 255
    return
  end
  
  while t < time do
    t = t + dt
    
    Event.fadeAlpha = 255*(t/time)
    
    _, dt = coroutine.yield()
  end
  
  Event.fadeAlpha = 255
end

function SB.fadein(time)
  -- Fade screen from balck to non-black.
  local t, dt = 0, 0
  
  if time == nil or time == 0 then
    -- If no time is given or time is 0, get rid of any fade right away.
    Event.fadeAlpha = 0
    Event.fade = false
    return
  end
  
  while t < time do
    t = t + dt
    
    Event.fadeAlpha = 255 - 255*(t/time)
    
    _, dt = coroutine.yield()
  end
  
  Event.fadeAlpha = 0
  Event.fade = false
end

function SB.getMapDimensions()
  -- Return the dimensions of the current map.
  return Event.game.map:getWidth(), Event.game.map:getHeight()
end

function SB.giveItem(item)
  local pitems = Event.game.player.items
  -- Add 'item' to the player's inventory.
  pitems[#pitems + 1] = item
end

function SB.getGold()
  -- Return the amount of gold the player has.
  return Event.game.player.gold
end

function SB.changeGold(gold)
  -- Change the amount of gold the player has. Used for shops.
  Event.game.player.gold = Event.game.player.gold + gold
end

function SB.addEventFromFile(file, runOnLoad)
  -- Add a new event from a file.
  Event:addNew(file, runOnLoad)
end

function SB.addEventFromString(str, runOnLoad)
  -- Add a new event from a string.
  Event:addFromString(str, runOnLoad)
end

function SB.getPlayerStats()
  -- Return the player statistics.
  return Event.game.player
end

function SB.wonGame()
  -- When the player wins the game, flip to the won game state.
  GS.switch(WonGame)
end

return Event
