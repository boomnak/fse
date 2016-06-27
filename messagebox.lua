-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- created:     June 13, 2016
-- file:        messagebox.lua
-- teacher:     Mr. Sarros
-- MessageBox class, used to create and draw the messagebox.

local Class = require 'lib.hump.class'

local MessageBox = Class({})

function MessageBox:init(game)
  self.game = game
  self.textLines = {}
  self.maxLines = 5
  self.dt = 0
  self.paused = false
  self.visible = true
  self.lineLength = 62
end

function MessageBox:update(dt)
  self.dt = self.dt + dt
end

function MessageBox:draw()
  if not self.visible then
    -- Don't draw if the MB is not visible.
    return
  end
  
  local prevColor = { love.graphics.getColor() }
  -- Draw a black rectangle.
  love.graphics.setColor(0, 0, 0, 127)
  love.graphics.rectangle(
    'fill', 0, 0, self.game.width, self.game.height/4)
  -- Write the text.
  love.graphics.setColor(255, 255, 255, 255)
  
  for i = 1, #self.textLines do
    -- Draw each line of text.
    love.graphics.print(self.textLines[i], 10, 10 + 30*(i-1))
  end
  
  if self.paused then
    love.graphics.print('Press c to continue...', self.game.width/2, self.game.height/4 - 20)
  end
  
  -- Reset the color.
  love.graphics.setColor(prevColor)
end

function MessageBox:addText(text)
  -- If there is too much text in one line, split it up.
  if text:len() > self.lineLength then
    while text:len() > self.lineLength do
      newLine = text:sub(1, self.lineLength)
      text = text:sub(self.lineLength + 1)
      
      self.textLines[#self.textLines + 1] = newLine
    end
  end
  
  self.textLines[#self.textLines + 1] = text
end

function MessageBox:clear()
  self.textLines = {}
end

function MessageBox:pause()
  self.paused = true
end

function MessageBox:unpause()
  self.paused = false
end

return MessageBox
