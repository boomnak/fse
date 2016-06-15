--

local Class = require 'lib.hump.class'

local MessageBox = Class({})

function MessageBox:init(game)
  self.game = game
  self.textLines = {}
  self.dt = 0
end

function MessageBox:update(dt)
  self.dt = self.dt + dt

  
end

function MessageBox:draw()
  local prevColor = { love.graphics.getColor() }
  -- Draw a black rectangle.
  love.graphics.setColor(0, 0, 0, 127)
  love.graphics.rectangle(
    'fill', 0, 0, self.game.width, self.game.height/4)
  -- Write the text.
  love.graphics.setColor(255, 255, 255, 255)
  
  for i = 1, #self.textLines do
    -- Draw each line of text.
    love.graphics.draw(self.textLines[i], 10, 10 + 30*i)
  end
  
  -- Reset the color.
  love.graphics.setColor(prevColor)
end

function MessageBox:addText(text)

function MessageBox:addLine()

return MessageBox
