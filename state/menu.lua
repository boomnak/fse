-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- created:     June 13, 2016
-- file:        menu.lua
-- teacher:     Mr. Sarros
-- Implements the Menu state.

local GS = require 'lib.hump.gamestate'

local InputMan = require 'inputman'
local ItemSelect = require 'state.itemselect'
local SaveLoad = require 'saveload'

local Menu = {}

function Menu:init()
end

function Menu:enter(prev, game)
  self.prev = prev
  self.game = game
  
  self.keyDelay = 0.3
  self.time = 0.3
  
  self.options = {
    {
      name = 'Resume',
      action = function()
        GS.pop()
      end
    },
    {
      name = 'Quit',
      action = function()
        love.event.quit()
      end
    },
    {
      name = 'Items',
      action = function()
        GS.push(ItemSelect, self.game, self.game.player)
      end
    }
  }
  self.currOption = 1
  
  -- If on the overworld, add the save option.
  if game.mapName == 'overworld' then
    self.options[#self.options + 1] = {
      name = 'Save',
      action = function()
        SaveLoad.save(game, 'save1.save')
        GS.pop()
      end
    }
  end
end

function Menu:update(dt)
  self.time = self.time + dt
  if self.time >= self.keyDelay then
    self.time = 0
    
    -- If the player presses the up/down keys, cycle through the menu options.
    if InputMan:down('down') then
      self.currOption = self.currOption + 1
      if self.currOption > #self.options then
        self.currOption = 1
      end
    elseif InputMan:down('up') then
      self.currOption = self.currOption - 1
      if self.currOption < 1 then
        self.currOption = #self.options
      end
    end
    
    -- If the player presses the interact key, run the current option.
    if InputMan:down('interact') then
      self.options[self.currOption].action()
    end
  end
end

function Menu:draw()
  -- Draw the previous state; should be a map.
  self.prev:draw()
  
  love.graphics.push()
  love.graphics.scale(self.game.sx, self.game.sy)
  
  -- Draw a blue rectangle as the menu background.
  love.graphics.setColor(127, 127, 255)
  love.graphics.rectangle('fill', self.game.width/4, 0,
                                  self.game.width/2, self.game.height)
  
  -- Loop through and print out the menu options.
  love.graphics.setColor(255, 255, 255)
  for i = 1, #self.options do
    if self.currOption == i then
      love.graphics.print('> ' .. self.options[i].name,
        self.game.width/4, 20*(i-1))
    else
      love.graphics.print(self.options[i].name,
        self.game.width/4, 20*(i-1))
    end
  end
  
  -- Loop through the player's stats and print them out.
  local line = 0
  for k,v in pairs(self.game.player) do
    if k ~= 'items' then
      love.graphics.print(k .. ': ' .. v,
        self.game.width/2, 20*line)
      
      line = line + 1
    elseif next(v) then
      -- Only print items if the player has any.
      love.graphics.print('Items:',
        self.game.width/2, 20*line)
      line = line + 1
      
      for kk,vv in pairs(v) do
        -- Loop through the items and print them out.
        love.graphics.print(kk .. ': ' .. vv,
          self.game.width/2 + 30, 20*line)
        line = line + 1
      end
    end
  end
  
  love.graphics.pop()
end

return Menu
