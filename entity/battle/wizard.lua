--

local Class = require 'lib.hump.class'

local Wizard = Class({
  attack = 5,
  defence = 1,
  maxHP = 40,
  -- Drops is a table of the items an enemy could drop when it dies.
  drops = {
    -- Items consists of tables with both an item name and percent
    -- chance of it being dropped.
    items = {
    },
    gold = 30, -- Drops 10 gold.
    exp = 20,
  },
})

function Wizard:init(game, battle)
  self.game = game
  self.battle = battle
  
  self.image = love.graphics.newImage('img/spr/wizard.png')
  
  self.turnTime = 1
  self.time = 0
  self.HP = self.maxHP
end

function Wizard:update(dt)
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

function Wizard:draw()
  if self.turn then
    love.graphics.draw(self.image, 400, 160)
  else
    love.graphics.draw(self.image, 480, 160)
  end
end

function Wizard:startTurn(player)
  self.turn = true
  
  -- AI for the Wizard during it's turn to fight.
  player.stats.HP = player.stats.HP -
    (self.attack - player.stats.defence - player.stats.armorDefence)
end

function Wizard:turnDone()
  return not self.turn
end

function Wizard:onDeath()
  -- Return what the player gets when the Wizard dies.
  return self.drops
end

return Wizard
