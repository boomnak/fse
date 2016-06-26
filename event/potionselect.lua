-- Fade the screen to black to start the game.
fadeout(0)

-- Freeze the player.
local player = getEntity('player')
player.input = false

-- Get the player's statistics.
local pstats = getPlayerStats()

local potionSelect = false
vars.potion = 1

fadein(0.5)

talk("Welcome to Oras! What'll you be having?")
sleep(0.1)

while potionSelect == false do
  clearMessage()
  addMessage("Pick your poison!")
  addMessage("(press c to confirm, left and right to choose)")
	if vars.potion == 1 then  
		addMessage("Potion of the Warrior (+1 attack).")
	elseif vars.potion == 2 then
		addMessage("Potion of the Knight (+1 defence).")
	elseif vars.potion == 3 then
		addMessage("Potion of the Healer (+5 health).")
	end
	--displays the potion's power up
	
	if down("right") then
		if vars.potion == 3 then
			vars.potion = 1
		else
			vars.potion = vars.potion + 1
		end
	elseif down("left") then
		if vars.potion == 1 then
			vars.potion = 3
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

if vars.potion == 1 then
  pstats.attack = pstats.attack + 1
elseif vars.potion == 2 then
  pstats.defence = pstats.defence + 1
elseif vars.potion == 3 then
  pstats.HP = pstats.HP + 5
  pstats.maxHP = pstats.maxHP + 5
end

talk("Player: ...")

vars.SOKevent = 1

teleport("throneroom", 192, 288)
