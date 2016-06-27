-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- created:     June 13, 2016
-- file:        inputman.lua
-- teacher:     Mr. Sarros
-- Input Manager, handles player input.

-- TODO: Saving/loading keymaps to/from files.

local Vector = require 'lib.hump.vector'

local isPtInCircle = require 'isptincircle'

local InputMan = {}

-- Set up the default keymap for the game.
-- It maps actions to keys.
InputMan.keymap = {
  attack = 'z',
  item = 'x',
  interact = 'c',
  jump = 'space',
  up = 'up',
  down = 'down',
  left = 'left',
  right = 'right',
  menu = 'escape',
}

function InputMan:init(game)
  self.game = game
  
  -- Set up the Love2D input callbacks.
  love.keypressed = self.keypressed
  love.keyreleased = self.keyreleased
  love.touchpressed = self.touchpressed
  love.touchmoved = self.touchmoved
  love.touchreleased = self.touchreleased
  
  self.keysDown = {}
  self.touches = {}
  self.mv = Vector(0, 0)
  self.interactButton = {x = 360, y = 240, r = 30, key = 'interact'}
  
  self.initialized = true
end

function InputMan:update(dt)
  self.mv = Vector(0, 0)
  if love.system.getOS() == 'Android' then
    self.keysDown.interact = false
    
    for i,t in pairs(self.touches) do
      local b = {self.interactButton}
      
      if t.ox <= (self.game.width/2)*self.game.sx then
        -- If touch in move area, generate movement vector.
        self.mv = Vector(t.ox-t.x, t.oy-t.y):normalizeInplace()
      else
        for i = 1, #b do
          if isPtInCircle(b[i].x * self.game.sx,
              b[i].y * self.game.sy, b[i].r, t.x, t.y) then
            -- If one of the buttons is pressed, set the corresponding key to
            -- 'down'.
            self.keysDown[b[i].key] = true
          else
            self.keysDown[b[i].key] = false
          end
        end
      end
    end
    
    -- Set the movement keys based on the movement vector.
    -- Allows for sidescroller to use 'up' for ladders/doors.
    local mv, hc = self.mv, 1 / math.sqrt(2)
    if mv.y > hc then self.keysDown['up'] = true
    else self.keysDown['up'] = false end
    if mv.y < -hc then self.keysDown['down'] = true
    else self.keysDown['down'] = false end
    if mv.x > hc then self.keysDown['left'] = true
    else self.keysDown['left'] = false end
    if mv.x < -hc then self.keysDown['right'] = true
    else self.keysDown['right'] = false end
  end
end

function InputMan:draw()
  if love.system.getOS() == 'Android' then
  	-- draw movement region on Android
	  for i,t in pairs(self.touches) do
  	  -- touches is indexed by ids, which are not numbers, thus
    	-- requiring the use of the pairs function.
	    if t.ox <= (self.game.width/2)*self.game.sx then
        -- Touch in move screen region.
	      local x, y = t.ox / self.game.sx, t.oy / self.game.sy
	      local prevColor = { love.graphics.getColor() }
  	    love.graphics.setColor(255,255,255,127)
    	  love.graphics.circle('line', x, y, 20)
 	      love.graphics.circle('fill', 
 	        x - self.mv.x*10, y - self.mv.y*10, 15)
  	    love.graphics.setColor(prevColor)
  	  end
 	  end
 	  
 	  local ib = self.interactButton
 	  local prevColor = { love.graphics.getColor() }
 	  love.graphics.setColor(64, 255, 64, 127)
 	  love.graphics.circle('fill', ib.x, ib.y, ib.r)
 	  love.graphics.setColor(prevColor)
 	end
end

-- Functions for interacting with the InputMan.

function InputMan:down(action)
  return self.keysDown[action]
end

function InputMan:moveAxis()
  -- Returns a vector containing movement amount from 1 to -1,
  -- in both x and y axis.
  
  if love.system.getOS() == 'Android' and
   	  not (self.mv.x == 0 and self.mv.y == 0) then
   	return self.mv
  end
  
  local axis = Vector(0, 0)
  
  if self:down('up') then axis.y = -1 end
  if self:down('down') then axis.y = 1 end
  if self:down('left') then axis.x = -1 end
  if self:down('right') then axis.x = 1 end
  axis:normalizeInplace()
  
  return axis
end

function InputMan:moveHorz()
  -- Returns a vector containing movement amount from 1 to -1,
  -- in the x axis.
  
  if love.system.getOS() == 'Android' and self.mv.x ~= 0 then
   	if self.mv.x < 0 then
   	  return Vector(-1, 0)
   	elseif self.mv.x > 0 then
   	  return Vector(1, 0)
   	end
  end

  if self:down('left') then return Vector(-1, 0) end
  if self:down('right') then return Vector(1, 0) end
  return Vector(0, 0)
end

-- Love2D input callbacks.

function InputMan.keypressed(key, scancode, isrepeat)
  -- Check if it's one of the keymapped keys.
  for action,keyname in pairs(InputMan.keymap) do
    if key == keyname then
      InputMan.keysDown[action] = true
      break
    end
  end
end

function InputMan.keyreleased(key)
  -- Check if it's one of the keymapped keys.
  for action,keyname in pairs(InputMan.keymap) do
    if key == keyname then
      InputMan.keysDown[action] = false
      break
    end
  end
end

function InputMan.touchpressed(id, x, y, dx, dy, pressure)
  -- Love2D callback function triggered when the screen is pressed.
  InputMan.touches[id] = {
    x = x, ox = x,
    y = y, oy = y,
    dx = 0,
    dy = 0,
  }
end

function InputMan.touchmoved(id, x, y, dx, dy, pressure)
  InputMan.touches[id].x = x
  InputMan.touches[id].y = y
  InputMan.touches[id].dx = dx
  InputMan.touches[id].dy = dy
end

function InputMan.touchreleased(id, x, y, dx, dy, pressure)
  InputMan.touches[id] = nil
end

return InputMan
