local player = getEntity('player')

if vars.metKing then
  addMessage('We have already met.')
else
  addMessage('Hello, I am the king.')
  vars.metKing = true
end

sleep(1)
clearMessage()
hideMessage()
