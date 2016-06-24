-- Occurs when colliding with a Hataha guard.
if vars.SOKevent <= 8 then
  talk("Guard: Have a great day traveller!")
elseif vars.SOKevent > 8 then
  talk("Guard: We will avenge the King!")
  battle({"guard"})
end
