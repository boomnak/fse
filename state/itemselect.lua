
local GS = require 'lib.hump.gamestate'

local InputMan = require 'inputman'

local ItemSelect = {}

function ItemSelect:init()
end

function ItemSelect:enter(prev, game, player, isBattle)
  self.prev = prev
  self.game = game
  
  self.player = player
  self.items = player.items
  
  self.keyDelay = 0.3
  self.time = 0
  
  self.currItem = 0
  
  if isBattle then
    -- In a battle, only let the player use 1 item.
    self.isBattle = true
  end
end

function ItemSelect:update(dt)
  -- Only accept keypresses if the delay has been passed.
  self.time = self.time + dt
  if self.time >= self.keyDelay then
    self.time = 0
  else
    return
  end
  
  -- If the player presses the up/down keys, cycle through the ItemSelect options.
  if InputMan:down('down') then
    self.currItem = self.currItem + 1
    if self.currItem > #self.items then
      self.currItem = 0
    end
  elseif InputMan:down('up') then
    self.currItem = self.currItem - 1
    if self.currItem < 0 then
      self.currItem = #self.items
    end
  end
  
    -- If the player presses the interact key, use the current item.
  if InputMan:down('interact') then
    if self.currItem == 0 then
      -- Resume the previous state.
      GS.pop(false)
      return
    end
  
    self:useItem()
  
    if self.isBattle then
      -- If in a battle, exit menu after player used 1 item.
      GS.pop(true)
    end
  end
  
  -- If the player presses the escape key, return them to the menu.
  if InputMan:down('menu') then
    GS.pop(false)
  end
end

function ItemSelect:draw()
  -- Draw the previous state; should be the menu.
  self.prev:draw()
  
  love.graphics.push()
  love.graphics.scale(self.game.sx, self.game.sy)
  
  -- Draw a blue rectangle as the ItemSelect background.
  love.graphics.setColor(100, 100, 150)
  love.graphics.rectangle('fill', self.game.width/4, self.game.height/4,
                                  self.game.width/2, self.game.height/2)
  
  -- Loop through and print out the ItemSelect options.
  love.graphics.setColor(255, 255, 255)
  for i = 0, #self.items do
    if i == 0 then
      -- Print out the 'Resume' option.
      if self.currItem == 0 then
        love.graphics.print('> Resume', self.game.width/4, self.game.height/4)
      else
        love.graphics.print('Resume', self.game.width/4, self.game.height/4)
      end
    elseif self.currItem == i then
      love.graphics.print('> ' .. self.items[i],
        self.game.width/4, self.game.height/4 + 20*i)
    else
      love.graphics.print(self.items[i],
        self.game.width/4, self.game.height/4 + 20*i)
    end
  end
  
  love.graphics.pop()
end

function ItemSelect:useItem()
  if self.items[self.currItem] == 'hpotion' then
    -- Increase the players health by 5.
    self.player.HP = self.player.HP + 5
    if self.player.HP > self.player.maxHP then
      self.player.HP = self.player.maxHP
    end
    
    -- Remove the item from the list of items.
    table.remove(self.items, self.currItem)
  
  elseif self.items[self.currItem] == 'sword' then
    self.player.weaponAttack = 2
    
    if self.player.weapon then
      -- If the player already has a weapon equipped, add it their inventory.
      self.player.items[#self.player.items+1] = self.player.weapon
    end
    self.player.weapon = 'sword'
    -- Remove the sword from the player inventory.
    table.remove(self.items, self.currItem)
    
  elseif self.items[self.currItem] == 'shield' then
    self.player.armorDefence = 1
    
    if self.player.armor then
      -- If the player already has armor equipped, add it their inventory.
      self.player.items[#self.player.items+1] = self.player.armor
    end
    self.player.armor = 'shield'
    -- Remove the sword from the player inventory.
    table.remove(self.items, self.currItem)
  end
end

return ItemSelect
