
local InputMan = require 'inputman'

local Gameover = {}

function Gameover:update(dt)
  if InputMan:down('interact') then
    love.event.quit()
  end
end

function Gameover:draw()
  love.graphics.print('Game over!', 10, 10)
  love.graphics.print(
    'Press ' .. InputMan.keymap.interact .. ' to continue.', 10, 30)
end

return Gameover
