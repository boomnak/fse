--

local Class = require 'lib.hump.class'

local KingAthens = Class({
  -- Set up default stats that apply to all KingAthenss.
  attack = 3,
  defence = 1,
  maxHP = 30,
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

function KingAthens:init(game, battle)
  self.game = game
  self.battle = battle
  
  self.turnTime = 1
  self.time = 0
  self.HP = self.maxHP
end

function KingAthens:update(dt)
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

function KingAthens:draw()
  if self.turn then
    love.graphics.setColor(200, 200, 200)
  else
    love.graphics.setColor(100, 100, 100)
  end
  love.graphics.circle('fill', 480, 20, 20)
end

function KingAthens:startTurn(player)
  self.turn = true
  
  -- AI for the KingAthens during it's turn to fight.
  player.stats.HP = player.stats.HP -
    (self.attack - player.stats.defence - player.stats.armorDefence)
end

function KingAthens:turnDone()
  return not self.turn
end

function KingAthens:onDeath()
  -- Return what the player gets when the KingAthens dies.
  return self.drops
end

return KingAthens
