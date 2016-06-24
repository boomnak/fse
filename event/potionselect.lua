-- Fade the screen to black to start the game.
fadeout(0)

-- Freeze the player.
local player = getEntity('player')
player.input = false

local potionSelect = false
vars.potion = 1

fadein(0.5)

while potionSelect == false do
  clearMessage()
  addMessage("Select a drink!")
  addMessage("press 'c' key to select your drink!")
	if vars.potion == 1 then  
		addMessage("potion of the warrior")
		addMessage("strength boost")
	elseif vars.potion == 2 then
		addMessage("potion of the knight")
		addMessage("defence boost")
	elseif vars.potion == 3 then
		addMessage("potion of the archer")
		addMessage("multiple hit damage boost")
	elseif vars.potion == 4 then
		addMessage("potion of the mage")
		addMessage("magic boost")
	end
	--displays the potion's power up
	
	if down("right") then
		if vars.potion == 4 then
			vars.potion = 1
		else
			vars.potion = vars.potion + 1
		end
	elseif down("left") then
		if vars.potion == 1 then
			vars.potion = 4
		else
			vars.potion = vars.potion - 1
		end
	elseif down("interact") then
		potionSelect = true
	end
	sleep(0.1)
	--sleep function used to make sure a click doesn't alternate too fast when picking a potion
end
clearMessage()

talk("Player: ...")

vars.SOKevent = 1

teleport("throneroom", 192, 288)
