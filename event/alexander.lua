local _, alexNum = getEntity("alexander")

if vars.SOKevent == 0 then
  removeEntity(alexNum)
elseif vars.SOKevent == 2 then
  talk("???: Who are you, and what are you doing here?")
elseif vars.SOKevent == 3 then
  talk("Alexander: The King eh?")
  talk("Alexander: I see then, but first you will be tested to see if your ready.")
  talk("Alexander: Since you have been appointed by the king, you must face the special test.")
  talk("Player: Special test?")
  talk("Alexander: A mighty test that is meant to test out only the best of our trainees.")
  talk("Alexander: You must clear out the dungeon south to this kingdom, and retrieve the special item.")
  talk("Alexander: Take this shield and this sword, they will help.")
  talk("Quest Received: Clear Dungeon!")
  giveItem('sword')
  giveItem('shield')
  vars.SOKevent = 4
  --for this event the player has to go and retrieve the treasure at the end of the dungeon and bring it back to alexander
  --picking up the weapon activates SOKevent 5
elseif vars.SOKevent == 4 then
  talk("Alexander: How is that dungeon?")
elseif vars.SOKevent == 5 then
  talk("Alexander: So you have completed the given task I see.")
  --player gives treasure to Alexander
  talk("Player gave Alexander the treasure!")
  talk("Player: So what now?")
  talk("Alexander: Before I put you under my command I wish to fight you as a last test.")
  talk("Alexander: Here you may use this in our fight.")
  talk("Player received weapon!") --(bow-if archer, sword-if warrior, staff-if mage, mace-if knight)
  battle({"alexander"})
  talk("Alexander: You are excellent in your technique, but have a lot to learn.")
  talk("You have become a Royal Guard!")
  talk("Alexander: I Welcome you under my command")
  talk("Alexander: Now then, as your first task, you must pursue a corrupt wizard by the name of Fatal and kill him.")
  talk("Player: A wizard you say, why? what has he done?")
  talk("Alexander: He has been attacking our guards as of late and wishes to assassinate the king.")
  talk("Player: So where do I find this wizard guy then?")
  talk("Alexander: You can find him somewhere near the kingdom of Irsil, He has been spotted there as of late.")
  talk("Quest Received: Kill Fatal")
  vars.SOKevent = 6
elseif vars.SOKevent == 6 then
  talk("Alexander: Have you done your given task?")
elseif vars.SOKevent == 7 then
  talk("Alexander: Good job, now you are ready for an important special task.")
  talk("Player: Another special task?")
  talk("Alexander: This time it is not a test, you will be guarding the king in the up coming Summit of Kings.")
  talk("Player: What is this Summit of the Kings?")
  talk("Alexander: It is a big event held every century to celebrate the peace among kingdoms.")
  talk("Alexander: During the event the four kings gather at a select kingdom and discuss the peace negotiations.")
  talk("Alexander: This time it will be held in the kingdom of H'ataha.")
  talk("Alexander: Go speak to the king when your ready.")
  talk("Quest Received: Summit of Kings")
  vars.SOKevent = 8
elseif vars.SOKevent == 9 then
  talk("Alexander: This masked figure will pay for what he has done.")
elseif vars.SOKevent == 12 then
  talk("Alexander: The King has been murdered...")
  talk("Alexander: It was him again, the masked figure, he appeared out of no where again and killed him.")
  talk("Player: I fought him, but he managed to escape.")
  talk("Alexander: I see...")
  talk("Alexander: This time don't let him get away.")
  talk("Player: This time? But I don't know about his whereabouts.")
  talk("Alexander: He was spotted heading towards the forest.")
  talk("Quest Received: Kill The Masked Man")
  SOKevent = 13
elseif vars.SOKevent == 13 then
  talk("Alexander: You must hurry!")
elseif vars.SOKevent == 14 then
  talk("Alexander: You've done well, I'm sure the king would be proud!")
  talk("Player: So who will take the throne as the new king?")
  talk("Alexander: That will be you.")
  talk("Player: Me?")
  talk("Alexander: Yes, you have consumed the kings potion after all and you possess the qualities of a king.")
  talk("Alexander: Here you may have this.")
  talk("Player Received the Adoom Crown!")
  talk("Alexander: Now it is up to you to lead our kingdom.")
  vars.SOKevent = 15
  --Summit of Kings event ends here
elseif vars.SOKevent == 15 then
  talk("What is it my king?")
end
