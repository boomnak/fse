-- Controls for the player in the sidescrolling stages.

local Class = require 'lib.hump.class'
local GS = require 'lib.hump.gamestate'
local Vector = require 'lib.hump.vector'

local InputMan = require 'inputman'
local Menu = require 'state.menu'

local Player = Class({})

Player.filterType = 'cross'
Player.name = 'player'

function Player:init(game, entity)
  --self.image = love.graphics.newImage()
  -- Position.
  self.pos = Vector(entity.x, entity.y)
  -- Dimensions
  self.dim = Vector(entity.width, entity.height)
  self.hitbox = { pos = self.pos:clone(), dim = self.dim:clone() }
  self.speed = 100 -- running speed, in m/s
  self.ySpeed = 0
  self.onLadder = false -- Not on a ladder.
  
  self.game = game
  self.game.world:add(self, self.pos.x, self.pos.y, self.dim.x, self.dim.y)
end

function Player:update(dt)
  -- If the menu key is down, go to the menu.
  if InputMan:down('menu') then
    GS.push(Menu, self.game)
  end
  
  local goal = self.pos:clone()
  if InputMan:down('left') then goal.x = goal.x - self.speed*dt end
  if InputMan:down('right') then goal.x = goal.x + self.speed*dt end
  
  if self.canJump and love.keyboard.isDown('space') then
    self.ySpeed = -320
  end
  self.canJump = false
  
  if self.onLadder then
    goal.y = goal.y - self.speed*dt
  else
    -- apply gravity
    self.ySpeed = self.ySpeed + 400*dt
    goal.y = goal.y + self.ySpeed*dt
  end
  
  local actualx, actualy, cols, len =
    self.game.world:move(self, goal.x, goal.y, self.filter)
  self.pos = Vector(actualx, actualy)
  
  self.onLadder = false
  for i = 1,len do
    self:handleCollison(cols[i])
  end
  
  -- Set the camera to follow the player, on the x-axis.
  self.game.camera:lookAt(math.floor(self.pos.x), self.game.height/2)
end

function Player:draw()
  --love.graphics.draw(self.image, self.pos.x, self.pos.y)
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle('fill',
    math.floor(self.pos.x), math.floor(self.pos.y), self.dim.x, self.dim.y)
end

-- filter - Returns the correct collision response type based on the given object.
function Player:filter(other)
  if other.properties then
    -- colliding with a 'collidable' tile
    local prop = other.properties
    if prop.solid then
      return 'slide'
    elseif prop.ladder then
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
    if prop.solid and col.normal.y == -1 then
      -- If standing on a platform, let the player jump.
      self.canJump = true
    end
    if prop.ladder and InputMan:down('up') then
      self.onLadder = true
    end

  elseif col.other.onPlayer then
    col.other:onPlayer(self)
    
  elseif col.other.filterType == 'slide' and
      col.normal.y == -1 then
    -- If standing on a platform, let the player jump.
    self.canJump = true
  end
end

return Player
