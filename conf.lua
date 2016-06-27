-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- created:     June 13, 2016
-- file:        conf.lua
-- teacher:     Mr. Sarros
-- Configure the Love2D environment before our program is run.

-- love.conf configures Love2D by setting values in the 't' table.
function love.conf(t)
  t.console = true
  t.identity = 'fsegame'
  t.window.title = 'FSE Game'
  t.window.width = 640
  t.window.height = 480
end
