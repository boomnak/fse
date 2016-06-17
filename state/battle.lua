--

local GS = require 'lib.hump.gamestate'

local BattlePlayer = require 'entity.battle.player'
local InputMan = require 'inputman'
local Gameover = require 'state.gameover'

local Battle = {}

function Battle:init()
end

function Battle:enter(prev, game, enemies)
  self.game = game
  
  self.enemies = {}
  for i = 1, #enemies do
    -- Load up each enemy.
    self.enemies[i] = require('entity.battle.' .. enemies[i])(game, self)
  end
  -- Initialize the player's AI with their current stats.
  self.player = BattlePlayer(game, self, game.player)

  self.currEnemy = 1
  self.playersTurn = true
  
  self.t = 0.3
  self.dt = self.t
  self.canPress = true
  self.currOption = 1
  self.options = {
    {
      name = 'Attack',
      action = function()
        self.player:takeTurn(self.enemies)
        self.playersTurn = false
      end,
    },
    {
      name = 'Flee',
      action = function()
        -- Flee, go back to the previous game state.
        GS.pop()
      end,
    },
  }
  
  InputMan:init(game)
end

function Battle:update(dt)
  if not self.playersTurn then
    if self.enemies[self.currEnemy]:takeTurn(self.player) == 'done' then
      -- If the current enemies turn is done, go to the next one.
      self.currEnemy = self.currEnemy + 1
    end
    if self.currEnemy > #self.enemies then
      self.currEnemy = 1
      self.playersTurn = true
    end
  end
  
  self.player:update(dt)
  for i = 1, #self.enemies do
    self.enemies[i]:update(dt)
  end
  
  self.dt = self.dt + dt
  if self.dt >= self.t then
    self.canPress = true
  else
    self.canPress = false
  end
  
  if InputMan:down('down') and self.canPress then
    self.currOption = self.currOption + 1
    if self.currOption > #self.options then
      self.currOption = 1
    end
    self.dt = 0
  elseif InputMan:down('up') and self.canPress then
    self.currOption = self.currOption - 1
    if self.currOption < 1 then
      self.currOption = #self.options
    end
    self.dt = 0
  end
  
  if InputMan:down('interact') then
    self.options[self.currOption].action()
  end
  
  if self.player.stats.HP <= 0 then
    -- If the player died, then go to gameover.
    GS.switch(Gameover)
  elseif self.enemies[self.currEnemy].HP <= 0 then
    GS.pop()
  end
  
  InputMan:update(dt)
end

function Battle:draw()
  love.graphics.push()
  love.graphics.scale(self.game.sx, self.game.sy)
  
  -- Draw player.
  self.player:draw()
  -- Draw enemies.
  for i = 1, #self.enemies do
    self.enemies[i]:draw(i)
  end
  
  -- Draw the HUD.
  love.graphics.setColor(0, 0, 255)
  love.graphics.rectangle('fill', 0, 360, 640, 120)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print(
    'HP: ' .. self.player.stats.HP .. '/' .. self.player.stats.maxHP, 10, 370)
  
  -- Print enemy hp.
  love.graphics.print(
    'Enemy HP:' .. self.enemies[1].HP .. '/' .. self.enemies[1].maxHP, 360, 370)
  
  for i = 1, #self.options do
    if self.currOption == i then
      love.graphics.print('> ' .. self.options[i].name, 10, 400 + 20*(i-1))
    else
      love.graphics.print(self.options[i].name, 10, 400 + 20*(i-1))
    end
  end
  
  InputMan:draw()
  
  love.graphics.pop()
end

function Battle:startTurn(entity)
  --self.
end

return Battle
