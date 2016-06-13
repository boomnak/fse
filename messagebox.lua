--

local Class = require 'lib.hump.class'

local MessageBox = Class({})

function MessageBox:init(text)
  self.text = text
end

function MessageBox:update(dt)
  self.dt = self.dt + dt
  if self.dt > 5 then
    self.donePrinting = true
  end
end

function MessageBox:draw()
  love.graphics.print(self.text, 10, 10)
end

return MessageBox
