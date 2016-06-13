local player = getEntity('player')

freezeEntity(player)
move(player, 32, 32, 1)
unfreezeEntity(player)

message('Event running')
