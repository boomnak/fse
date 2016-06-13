--

local Class = require 'lib.hump.class'

local Slug = Class({
  -- Set up default stats that apply to all slugs.
  attack = 2,
  defense = 0,
  maxHP = 10,
  -- Drops is a table of the items an enemy could drop when it dies.
  drops = {
    -- Items consists of tables with both an item name and percent
    -- chance of it being dropped.
    items = {
      {'healthpotion', 0.2}
    },
    gold = 10, -- Drops 10 gold.
    exp = 3, -- Gives the player 3 experience.
  },
})

function Slug:init(game, battle)
  self.game = game
  self.battle = battle
  
  self.HP = self.maxHP
end

function Slug:update(dt)
  -- Update is where any events will be run, and animations will
  -- be updated.
end

function Slug:draw(x, y)
end

-- AI for the slug during it's turn to fight.
function Slug:takeTurn()
  -- Find the opponent with the most health and attack them.
  local opponentToAttack, highestHP = 0, 0
  local opponents = self.battle.opponents
  for i = 1, #opponents do
    if opponents[i].HP > highestHP or lowestHP == 0 then
      highestHP = opponents[i].HP
      opponentToAttack = opponents[i]
    end
  end
  
  opponentToAttack.hp = opponentToAttack.hp - self.attack
  
  -- Tell the battle system that the slugs turn is over.
  return 'done'
end

return Slug
