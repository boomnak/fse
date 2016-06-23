-- Conversation or fight occurs when colliding with an Addom guard.

if vars.SOKevent == 0 or vars.SOKevent == 2 then
  talk("Hey! you you're a wanted man!")
  battle({"guard"})
else
  talk("Guard: How goes your journey traveller?")
end
