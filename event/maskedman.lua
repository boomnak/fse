local maskedMan, maskedManNum = getEntity("MaskedMan")

if vars.SOKevent == 10 then
  battle("Masked Man")
  removeEntity(maskedManNum)
  vars.SOKevent = 11
elseif SOKevent == 13 then
  getEntity("MaskedMan").enable() -- what does this mean?
  battle("MaskedMan")
  removeEntity(maskedManNum)
  vars.DarkMask = true
  talk("Player Received the Dark Mask!")
  vars.SOKevent = 14
end
