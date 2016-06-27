-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- created:     June 13, 2016
-- file:        isptincircle.lua
-- teacher:     Mr. Sarros
-- Calculates whether or not a point is in a circle.

local function isPtInCircle(cx, cy, cr, x, y)
  -- Use the pythagorean theorem to determine the squared distance
  -- between the point and the center of the circle.
  local distSq = (cx-x)^2 + (cy-y)^2
  if distSq > cr^2 then
    -- If the distance is greater than the radius, the point is
    -- not in the circle.
    return false
  end
  return true
end

return isPtInCircle
