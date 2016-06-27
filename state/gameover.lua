-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- created:     June 16, 2016
-- file:        gameover.lua
-- teacher:     Mr. Sarros
-- Implements the Gameover state.

local InputMan = require 'inputman'

local Gameover = {}

function Gameover:enter(prev, game)
  self.game = game
end

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
