-- Conversation or fight occurs when colliding with an Addom guard.

local player = getEntity('player')

if vars.SOKevent == 0 or vars.SOKevent == 2 then
  player.input = false
  talk("Hey! You're a wanted man!")
  battle({"guard"})
  player.input = true
else
  talk("Guard: How goes your journey traveller?")
end
