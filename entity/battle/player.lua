--

local Class = require 'lib.hump.class'

local BattlePlayer = Class({})

function BattlePlayer:init(game, battle, stats)
  self.game = game
  self.battle = battle
  self.stats = stats
end

function BattlePlayer:update(dt)
  -- Update animations.
end

function BattlePlayer:draw()
  -- Draw animations.
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle('fill', 240, 240, 32, 32)
end

function BattlePlayer:takeTurn(enemies)
  -- 
  self.damageDone = self.stats.attack - enemies[1].defence
  enemies[1].HP = enemies[1].HP - self.damageDone
end

return BattlePlayer
