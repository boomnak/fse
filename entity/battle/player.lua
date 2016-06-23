--

local Class = require 'lib.hump.class'

local BattlePlayer = Class({})

function BattlePlayer:init(game, battle, stats)
  self.game = game
  self.battle = battle
  self.stats = stats
  
  self.turnTime = 1
  self.time = 0
end

function BattlePlayer:update(dt)
  -- Update animations.
  if self.turn then
    self.time = self.time + dt
    
    if self.time >= self.turnTime then
      self.turn = false
      self.time = 0
    end
  end
end

function BattlePlayer:draw()
  -- Draw animations.
  if self.turn then
    love.graphics.setColor(255, 255, 255)
  else
    love.graphics.setColor(127, 127, 127)
  end
  love.graphics.rectangle('fill', 240, 240, 32, 32)
end

function BattlePlayer:startTurn(enemies, action)
  -- 
  self.turn = true
  
  if action == 'attack' then
    self.damageDone = self.stats.attack + self.stats.weaponAttack - enemies[1].defence
    enemies[1].HP = enemies[1].HP - self.damageDone
  end
end

function BattlePlayer:turnDone()
  return not self.turn
end

return BattlePlayer
