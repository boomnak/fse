local player = getEntity('player')

freezeEntity(player)
move(player, 32, 32, 1)
unfreezeEntity(player)

fadeout(1)
sleep(1)
fadein(1)

addMessage('Event running')
waitFor()
clearMessage()
hideMessage()
