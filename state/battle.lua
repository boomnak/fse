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

  self.turn = 'player'
  self.actionPicked = false
  
  self.t = 0.3
  self.dt = self.t
  self.canPress = true
  self.currOption = 1
  self.options = {
    {
      name = 'Attack',
      action = function()
        self.player:startTurn(self.enemies)
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
  if self.turn == 'enemy' then
    if self.enemies[1]:turnDone() then
      self.turn = 'player'
    end
  elseif self.turn == 'player' then
    if self.actionPicked and self.player:turnDone() then
      self.turn = 'enemy'
      self.actionPicked = false
      self.enemies[1]:startTurn(self.player)
    end
  end
  
  self:updateHUD(dt)
  
  self.player:update(dt)
  for i = 1, #self.enemies do
    self.enemies[i]:update(dt)
  end
  
  if self.player.stats.HP <= 0 then
    -- If the player died, then go to gameover.
    GS.switch(Gameover, self.game)
  elseif self.enemies[1].HP <= 0 then
    -- If enemy died, then the player won.
    self:playerWon()
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

function Battle:updateHUD(dt)
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
  
  if InputMan:down('interact') and
      self.turn == 'player' and not self.actionPicked then
    self.actionPicked = true
    self.options[self.currOption].action()
  end
end

function Battle:playerWon()
  local pstats = self.player.stats
  local edrops = self.enemies[1].drops
  
  pstats.exp = pstats.exp + edrops.exp
  if pstats.exp >= pstats.expNeeded then
    -- If the player has the necessecary experience, level them up.
    pstats.level = pstats.level + 1
    pstats.exp = pstats.exp - pstats.expNeeded
    pstats.maxHP = pstats.maxHP + 5
    pstats.HP = pstats.maxHP
    pstats.attack = pstats.attack + 1
    pstats.expNeeded = pstats.expNeeded + 10
  end
  
  -- Loop through the enemies item drops and decide whether or not to give
  -- them to the player.
  local itm = edrops.items
  for i = 1, #itm do
    if love.math.random() < itm[i].chance then
      -- Give the player the item if the chance was passed.
      pstats.items[itm[i].name] = (pstats.items[itm[i].name] or 0) + 1
    end
  end
  
  pstats.gold = pstats.gold + edrops.gold
  
  GS.pop()
end

return Battle
