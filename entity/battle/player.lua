--

local Class = require 'lib.hump.class'

local BattlePlayer = Class({})

function BattlePlayer:init(game, battle, stats)
  self.game = game
  self.battle = battle
  self.stats = stats
  self.image = love.graphics.newImage('img/spr/player.png')
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
  if self.turn then
    love.graphics.draw(self.image, 320, 160)
  else
    love.graphics.draw(self.image, 240, 160)
  end
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
