
-- Freeze the player.
local player = getEntity('player')
player.input = false

local x,y = getMapDimensions()

vars.SOKevent = 1
--warp("potionSelect", x/4, y/4)

local potionSelect = false
vars.potion = 1

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
	sleep(0.25)
	--sleep function used to make sure a click doesn't alternate too fast when picking a potion
end
clearMessage()

talk("Player: ...")

--teleport("throneRoom", x/2, y/2)

talk("Player: Where am I?")
talk("King: You are at the palace of Adoom,\n for a trial of your actions!")
talk("Player: What did I do?")
talk("King: You have consumed the Kings potion!")
talk("Player: Kings potion?")
talk("King: The potion brewed when a new king\n shall be crowned.")
talk("King: The potion requires decades worth\n of effort to create and you have just consumed it!")
talk("Player: But, I was at a bar drinking\n whiskey, how did I end up with such a potion?")
talk("King: Fool, do not lie in front of the\n king!")
talk("King: That potion was kept in a specialized\n location to avoid it from being stolen.")
talk("King: There is no possible way it would be at\n a bar.")
talk("Player: So what now?")
talk("King: By law, you shall face the ultimate\n punishment of death for your crime.")
talk("Player: There must be some sort of mistake...")
talk("King: We'll make this quick.")
talk("King: Guards! proceed to the execution.")

--local mage = getEntity('mage')
--local player = getEntity('player') 

--mage:setFrame(2)
--mages raise their staffs
--mage: setFrame(3)
--mages shoot magic power at player
--player:setFrame(2)
--player radiates light

--teleport("oldLibrary", x/6, y/6)

--player:setFrame(3)
--player is down on ground
--player:setFrame(1)
--player gets back up

talk("I wonder what happened back there?")

vars.SOKevent = 2

player.input = true
