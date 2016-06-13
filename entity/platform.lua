local Class = require 'lib.hump.class'
local Vec = require 'lib.hump.vector'

local Platform = Class({})

Platform.filterType = 'slide'

function Platform:init(game, x, y, w, h)
  --self.image = love.graphics.newImage()
  self.pos = Vec(x, y)
  self.dim = Vec(w, h)
  self.hitbox = { pos = Vec(x, y), dim = Vec(w, h) }
  
  self.game = game
  self.game.world:add(self, x, y, w, h)
end

function Platform:update(dt)
end

function Platform:draw()
  --love.graphics.draw(self.image, self.pos.x, self.pos.y)
  love.graphics.push()
  
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle('fill',
    math.floor(self.pos.x), math.floor(self.pos.y), self.dim.x, self.dim.y)
  
  love.graphics.pop()
end

return Platform
