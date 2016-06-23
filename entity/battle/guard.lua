--

local Class = require 'lib.hump.class'

local Guard = Class({
  -- Set up default stats that apply to all Guards.
  attack = 2,
  defence = 1,
  maxHP = 20,
  -- Drops is a table of the items an enemy could drop when it dies.
  drops = {
    -- Items consists of tables with both an item name and percent
    -- chance of it being dropped.
    items = {
      {name = 'hpotion', chance = 0.5},
      {name = 'shield', chance = 0.5}
    },
    gold = 10, -- Drops 10 gold.
    exp = 5, -- Gives the player 3 experience.
  },
})

function Guard:init(game, battle)
  self.game = game
  self.battle = battle
  
  self.turnTime = 1
  self.time = 0
  self.HP = self.maxHP
end

function Guard:update(dt)
  -- Update is where any events will be run, and animations will
  -- be updated.
  if self.turn then
    self.time = self.time + dt
    if self.time >= self.turnTime then
      self.turn = false
      self.time = 0
    end
  end
end

function Guard:draw()
  if self.turn then
    love.graphics.setColor(200, 200, 200)
  else
    love.graphics.setColor(100, 100, 100)
  end
  love.graphics.circle('fill', 480, 20, 20)
end

function Guard:startTurn(player)
  self.turn = true
  
  -- AI for the Guard during it's turn to fight.
  player.stats.HP = player.stats.HP -
    (self.attack - player.stats.defence - player.stats.armorDefence)
end

function Guard:turnDone()
  return not self.turn
end

function Guard:onDeath()
  -- Return what the player gets when the Guard dies.
  return self.drops
end

return Guard
