-- Controls for player during overworld stage.

local Class = require 'lib.hump.class'
local GS = require 'lib.hump.gamestate'
local Vec = require 'lib.hump.vector'

local InputMan = require 'inputman'
local Menu = require 'state.menu'

local Player = Class({})

Player.filterType = 'cross'
Player.name = 'player'

function Player:init(game, entity)
  --self.image = love.graphics.newImage()
  self.pos = Vec(entity.x, entity.y)
  -- Dimensions
  self.dim = Vec(entity.width, entity.height)
  self.hitbox = { pos = self.pos:clone(), dim = self.dim:clone() }
  self.speed = 100 -- running speed, in m/s
  
  self.game = game
  self.game.world:add(self, self.pos.x, self.pos.y, self.dim.x, self.dim.y)
end

function Player:update(dt)
  -- If the menu key is down, go to the menu.
  if InputMan:down('menu') then
    GS.push(Menu, self.game)
  end
  
  local goal = self.pos:clone()
  
  local mv = InputMan:moveAxis()
  goal.x = goal.x + mv.x*self.speed*dt
  goal.y = goal.y + mv.y*self.speed*dt
  
  local actualx, actualy, cols, len =
    self.game.world:move(self, goal.x, goal.y, self.filter)
  self.pos = Vec(actualx, actualy)
  
  for i = 1,len do
    self:handleCollison(cols[i])
  end
  
  -- Set the camera to follow the player.
  self.game.camera:lookAt(math.floor(self.pos.x), math.floor(self.pos.y))
end

function Player:draw()
  --love.graphics.draw(self.image, self.pos.x, self.pos.y)
  love.graphics.rectangle('fill',
    math.floor(self.pos.x), math.floor(self.pos.y), self.dim.x, self.dim.y)
end

-- filter - Returns the correct collision response type based on a given object.
function Player:filter(other)
  if other.properties then
    -- colliding with a 'collidable' tile
    local prop = other.properties
    if prop.solid then
      return 'slide'
    elseif prop.warp then
      return 'cross'
    end
  else
    return other.filterType or 'cross'
  end
end

function Player:handleCollison(col)
  if col.other.properties then
    -- colliding with a 'collidable' tile
    local prop = col.other.properties

  elseif col.other.onPlayer then
    col.other:onPlayer(self)
  end
end

return Player
