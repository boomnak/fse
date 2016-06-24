
local player = getEntity('player')
player.input = false

-- Conversation between King Adoom and the player.
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
clearMessage()
hideMessage()

--local mage = getEntity('mage')

--mage:setFrame(2)
--mages raise their staffs
--mage: setFrame(3)
--mages shoot magic power at player
--player:setFrame(2)
--player radiates light

teleport("oldLibrary", 512, 160)

local player = getEntity('player')
player.input = false

--player:setFrame(3)
--player is down on ground
--sleep(0.2)
--player:setFrame(1)
--player gets back up
--sleep(0.2)

talk("I wonder what happened back there?")
player.input = true

vars.SOKevent = 2
