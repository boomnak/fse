addMessage('Wanna fight my slug?')
addMessage('(c = yes, x = no)')

local keyPressed = nil
while not keyPressed do
  if down('interact') then
    keyPressed = 'yes'
  elseif down('item') then
    keyPressed = 'no'
  end
end

clearMessage()
hideMessage()

if keyPressed == 'yes' then
  battle({'slug'})
end
