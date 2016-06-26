--

local GS = require 'lib.hump.gamestate'

local BattlePlayer = require 'entity.battle.player'
local InputMan = require 'inputman'
local ItemSelect = require 'state.itemselect'
local Gameover = require 'state.gameover'

local Battle = {}

function Battle:init()
end

function Battle:enter(prev, game, enemies, cantFlee)
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
  
  self.gained = nil
  self.leveledUp = nil
  
  self.t = 0.3
  self.dt = self.t
  self.canPress = true
  self.currOption = 1
  self.options = {
    {
      name = 'Attack',
      action = function()
        self.player:startTurn(self.enemies, 'attack')
      end,
    },
    {
      name = 'Items',
      action = function()
        GS.push(ItemSelect, self.game, self.game.player, true)
      end,
    },
  }
  
  if not cantFlee then
    -- If cantFlee wasn't set, then allow the player to flee the battle.
    self.options[#self.options + 1] = {
      name = 'Flee',
      action = function()
        -- Flee, go back to the previous game state.
        GS.pop()
      end,
    }
  end
  
  InputMan:init(game)
end

function Battle:resume(itemUsed)
  -- resume is called when the state is popped back to from the item menu.
  if itemUsed then
    self.player:startTurn(self.enemies, 'item')
  else
    self.actionPicked = false
  end
end

function Battle:update(dt)
  -- If the battle is over, go back to the map when 'c' is pressed.
  if self.gained then
    self.dt = self.dt + dt
    
    if InputMan:down('interact') and self.dt > self.t then
      GS.pop()
    end
    return
  end
  
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
  
  -- If the battle is over, show what the player gained.
  if self.gained then
    love.graphics.setColor(0, 0, 255)
    love.graphics.rectangle('fill', 0, 0, 640, 480)
    love.graphics.setColor(255, 255, 255)
    
    love.graphics.print('You won!', 10, 10)
    love.graphics.print("Here's what you got:", 10, 30)
    
    -- Loop through gained and print out the values.
    local line = 0
    for k,v in pairs(self.gained) do
      if k ~= 'items' then
        love.graphics.print(k .. ': ' .. v, 30, 50 + 20*line)
        
        line = line + 1
      elseif #v > 0 then
        love.graphics.print('You gained these items:', 10, 50 + 20*line)
        line = line + 1
        
        for i = 1,#v do
          -- Loop through the items and print them out.
          love.graphics.print(v[i], 50, 50 + 20*line)
          line = line + 1
        end
      end
    end
    
    love.graphics.pop()
    return
  end
  
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
  
  -- Draw the messagebox, in case a player/enemy writes to it.
  self.game.mb:draw()
  
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
  
  self.gained = {}
  self.dt = 0
  
  pstats.exp = pstats.exp + edrops.exp
  self.gained.exp = edrops.exp
  if pstats.exp >= pstats.expNeeded then
    -- If the player has the necessecary experience, level them up.
    pstats.level = pstats.level + 1
    self.gained.level = 1
    pstats.exp = pstats.exp - pstats.expNeeded
    pstats.maxHP = pstats.maxHP + 5
    self.gained.maxHP = 5
    pstats.HP = pstats.maxHP
    pstats.attack = pstats.attack + 1
    self.gained.attack = 1
    pstats.expNeeded = pstats.expNeeded + 10
    self.gained.expNeeded = 10
    
    self.leveledUp = true
  end
  
  -- Loop through the enemies item drops and decide whether or not to give
  -- them to the player.
  local itm = edrops.items
  self.gained.items = {}
  for i = 1, #itm do
    if love.math.random() < itm[i].chance then
      -- Give the player the item if the chance was passed.
      pstats.items[#pstats.items + 1] = itm[i].name
      self.gained.items[#self.gained.items + 1] = itm[i].name
    end
  end
  
  pstats.gold = pstats.gold + edrops.gold
  self.gained.gold = edrops.gold
end

return Battle
