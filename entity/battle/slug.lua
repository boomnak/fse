--

local Class = require 'lib.hump.class'

local Slug = Class({
  -- Set up default stats that apply to all slugs.
  attack = 1,
  defence = 0,
  maxHP = 10,
  -- Drops is a table of the items an enemy could drop when it dies.
  drops = {
    -- Items consists of tables with both an item name and percent
    -- chance of it being dropped.
    items = {
      {name = 'hpotion', chance = 0.25}
    },
    gold = 10, -- Drops 10 gold.
    exp = 3, -- Gives the player 3 experience.
  },
})

function Slug:init(game, battle)
  self.game = game
  self.battle = battle
  
  self.image = love.graphics.newImage('img/slug.png')
  
  self.turnTime = 1
  self.time = 0
  self.HP = self.maxHP
end

function Slug:update(dt)
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

function Slug:draw()
  if self.turn then
    love.graphics.draw(self.image, 400, 192)
  else
    love.graphics.draw(self.image, 480, 192)
  end
end

function Slug:startTurn(player)
  self.turn = true
  
  -- AI for the slug during it's turn to fight.
  player.stats.HP = player.stats.HP -
    (self.attack - player.stats.defence - player.stats.armorDefence)
end

function Slug:turnDone()
  return not self.turn
end

function Slug:onDeath()
  -- Return what the player gets when the slug dies.
  return self.drops
end

return Slug
