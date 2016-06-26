
local InputMan = require 'inputman'

local WonGame = {}

function WonGame:enter(prev, game)
  self.game = game
end

function WonGame:update(dt)
  if InputMan:down('interact') then
    love.event.quit()
  end
end

function WonGame:draw()
  love.graphics.print('Congratulations! You won!', 10, 10)
  love.graphics.print(
    'Press ' .. InputMan.keymap.interact .. ' to continue.', 10, 30)
end

return WonGame
