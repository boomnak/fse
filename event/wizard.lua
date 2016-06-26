local player = getEntity('player')
player.input = false

talk('Wizard: So, the king has sent yet another fool for me to kill?')
talk("Wizard: I don't know how you made it past my minions, but it will have been your undoing!")

battle({"wizard"}, true)

talk("Wizard: No... this isn't possible...")
talk("Gained stolen crown!")

vars.gotCrown = true
player.input = true
