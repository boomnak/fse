--

local Battle = {}

function Battle:init()
end

function Battle:enter(prev, game, enemies)
  self.game = game
  
  self.enemies = enemies
  self.players = game.players
  
  -- Start with the first player.
  self.currTeam = self.players
  self.opponents = self.enemies
  self.currBattler = 1
  
  InputMan:init(game)
end

function Battle:update(dt)
  if self.currTeam[self.currBattler]:takeTurn() == 'done' then
    -- If the current battlers turn is done, go to the next one.
    self.currBattler = self.currBattler + 1
  end
  if self.currBattler > #self.currTeam then
    -- If everyone on the current team has had a turn, swap the teams.
    self.currBattler = 1
    self.currTeam, self.opponents = self.opponents, self.currTeam
  end
  
  InputMan:update(dt)
end

function Battle:draw()
  love.graphics.push()
  love.graphics.scale(self.game.sx, self.game.sy)
  
  -- Draw players.
  for i = 1, #self.players do
    self.players[i]:draw(10 + 96*(i-1), 240)
  end
  -- Draw enemies.
  for i = 1, #self.enemies do
    self.enemies[i]:draw(240 + 96*(i-1), 10)
  end
  
  InputMan:draw()
  
  love.graphics.pop()
end

return Battle
