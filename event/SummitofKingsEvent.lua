function talk(msg)
	addMessage(msg)
	waitFor("c")
	clearMessage() 
end
function teleport(location, xpos, ypos)
	fadeout(0.25)
	sleep(0.5)
	warp(location, xpos, ypos)
	fadein(0.25)
	sleep(0.5)
end

local x,y = love.graphics.getDimensions()

vars.SOKevent = 1
vars.recruitAvaido = false
warp("potionSelect", x/4, y/4)

local potionSelect = false
vars.potion = 1

while potionSelect == false do 
	if vars.potion == 1 then
		addMessage("Select a drink! \ n")
		addMessage("press 'c' key to select your drink! \n")
		addMessage("potion of the warrior \n")
		addMessage("strength boost")
	elseif vars.potion == 2 then
		addMessage("Select a drink! \ n")
		addMessage("press 'c' key to select your drink! \n")
		addMessage("potion of the knight \n")
		addMessage("defence boost")
	elseif vars.potion == 3 then
		addMessage("Select a drink! \ n")
		addMessage("press 'c' key to select your drink! \n")
		addMessage("potion of the archer \n")
		addMessage("multiple hit damage boost")
	elseif vars.potion == 4 then
		addMessage("Select a drink! \ n")
		addMessage("press 'c' key to select your drink! \n")
		addMessage("potion of the mage \n")
		addMessage("magic boost")
	end
	--displays the potion's power up
	
	if down("right") == true then
		if vars.potion == 4 then
			vars.potion = 1
		else
			vars.potion = vars.potion + 1
		end
	elseif down("left") == true then
		if vars.potion == 1 then
			vars.potion = 4
		else
			vars.potion = vars.potion - 1
		end
	elseif down("c") == true then
		potionSelect = true
	end
	sleep(0.25)
	--sleep function used to make sure a click doesn't alternate too fast when picking a potion
end

talk("Player: ...")

teleport("throneRoom", x/2, y/2)

talk("Player: Where am I?")
talk("King: You are at the palace of Adoom, for a trial of your actions!")
talk("Player: What did I do?")
talk("King: You have consumed the Kings potion!")
talk("Player: Kings potion?")
talk("King: The potion brewed when a new king shall be crowned.")
talk("King: The potion requires decades worth of effort to create and you have just consumed it!")
talk("Player: But, I was at a bar drinking whiskey, how did I end up with such a potion?")
talk("King: Fool, do not lie in front of the king!")
talk("King: That potion was kept in a specialized location to avoid it from being stolen.")
talk("King: There is no possible way it would be at a bar.")
talk("Player: So what now?")
talk("King: By law, you shall face the ultimate punishment of death for your crime.")
talk("Player: There must be some sort of mistake...")
talk("King: We'll make this quick.")
talk("King: Guards! proceed to the execution.")

local mage = getEntity('mage')
local player = getEntity('player') 

mage:setFrame(2)
--mages raise their staffs
mage: setFrame(3)
--mages shoot magic power at player
player:setFrame(2)
--player radiates light

teleport("oldLibrary", x/6, y/6)

player:setFrame(3)
--player is down on ground
player:setFrame(1)
--player gets back up

talk("I wonder what happened back there?")

vars.SOKevent = 2

function talkKingAthens()
	if vars.SOKevent == 0 then
		getEntity("KingAthens").disable() --Make a similar function to disable the character from the game
	elseif vars.SOKevent == 2 then
		talk("King: What!")
		talk("King: ...")
		talk("King: So, you survived after all I see.")
		talk("King: We were unsure of what happened after the burst of light.")
		talk("King: You just seemed to vanish into thin air.")
		talk("Player: I don't know what happened either.")
		talk("King: Interesting, so there is more to you than I thought.")
		talk("King: Tell you what, I'll excuse you of your crime.")
		talk("Player: Did you finally realize that I did not steal this potion?")
		talk("King: In return for me excusing you, you must become one of my guards.")
		
		addMessage("What will you do? \n")
		addMessage("join (c) or decline (x)")
		
		local options = false
		while options == false do 
			if down("interact") == true then
				clearMessage()
				vars.teamAdoom = true
				talk("King: Good, now then go and see commander Alexander for your first task")
				talk("Quest Received: Talk to Alexander!")
				vars.eventSOK = 3
				options = true
			elseif down("item") == true then
				clearMessage()
				talk("King: Well then, you are still considered a prisoner after all.")
				talk("King: I guess I'll have to take things into my own hands then!")
				battle("KingAthens")
				talk("The king has been slain... Mission Failed (Summit of Kings)")
				
				vars.SOKevent = 0 --if any event is at 0, it means that the event is a failure
				getEntity("KingAthens").disable()
			end
		end
	elseif vars.SOKevent == 3 then
		talk("King: Alexander is the head of the guards here at our castle.")
	elseif vars.SOKevent > 3 and vars.SOKevent < 8 then
		talk("King: How are you doing?")
	elseif vars.SOKevent == 8 then
		talk("King: Lets get going shall we!")
		teleport("H'atahaCastle", x/4, y/4)
		talk("Announcer: King Taha of H'ataha")
		talk("Announcer: King Vad of Deves") 
		talk("Announcer: King Fowlin of Irsil" 
		talk("Announcer: and King Athens of Adoom have all arrived")
		talk("Announcer: And so begins the 34th Summit of Kings!")
		talk("King Taha: Gentlemen! I shall start this evening with my opening remarks.")
		talk("King Taha: As you all know, our great kingdoms have now been at peace for a long time.")
		talk("King Taha: With this peace, we have managed to grow as kingdoms and now we sit here today as comrads.")
		fadeout(0.1)
		sleep(0.1)
		fadein(0.1)
		--Masked figure appears on round table
		talk("King Taha: We....") --Taha falls down and is persumed dead alongside his royal guards
		fadeout(0.1)
		sleep(0.1)
		fadein(0.1)
		--Masked figure disappears
		--H'ataha Castle guards run in
		talk("H'ataha Guard: What is the meaning of this?")
		talk("King Fowlin: A masked figure appeared out of no where and assassinated King Taha!")
		talk("H'ataha Guard: You expect us to believe that!")
		talk("H'ataha Guard: That a man appeared out of no where in the worlds most secured meeting and murdered our king.")
		talk("H'ataha Guard: I see now, this was a organized attack by all of your kingdoms against ours!")
		talk("H'ataha Guard: By the honour of king Taha, you are all uder arrest!")
		talk("King Vad: How disrespectful, you should all know your place.")
		talk("King Vad: This meeting was a bore anyway.")
		getEntity("King Vad").disable()
		talk("King Fowlin: Athens! you and your men should leave while you can, this situation is about to get messy.")
		getEntity("King Fowlin").disable()
		talk("King: Show me what you can do and get us out of here.")
		--player escorts king athens back to Adoom
		talk("King: Good work, I knew I could count on you.")
		talk("King: Now go and try and find out more about this masked figure while we start defensive preparations.")
		talk("King: Report your finding back to Alexander.")
		talk("Quest Received: Find out more about masked man.")
		SOKevent = 9
	elseif vars.SOKevent == 9 then
		talk("King: How goes your findings?")
		--during this event you get ambushed by the masked figure at any time and the screen fades out and when it fades back in your at the cemetery.
		--where you find Fatal.
	elseif vars.SOKevent == 12 then
		getEntity("KingAthens").disable()
	end
end

function talkAlexander()
	if vars.SOKevent == 0 then
		getEntity("Alexander").disable()
	elseif vars.SOKevent == 2 then
		talk("Alexander: Who are you, and what are you doing here?")
	elseif vars.SOKevent == 3 then
		talk("Alexander: The King eh?")
		talk("Alexander: I see then, but first you will be tested to see if your ready.")
		talk("Alexander: Since you have been appointed by the king, you must face the special test.")
		talk("Player: Special test?")
		talk("Alexander: A mighty test that is meant to test out only the best of our trainees.")
		talk("Alexander: You must clear out the dungeon south to this kingdom, and retrieve the special item.")
		talk("Quest Received: Clear Dungeon!")
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
		battle("Alexander")
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
	elseif vars.SOKevent = 15 then
		talk("What is it my king?")
	end
end

function talkMaskedMan()
	if vars.SOKevent == 10 then
		battle("Masked Man")
		getEntity("MaskedMan").disable()
		vars.SOKevent = 11
	elseif SOKevent == 13 then
		getEntity("MaskedMan").enable()
		battle("MaskedMan")
		getEntity("MaskedMan").disable()
		vars.DarkMask = true
		talk("Player Received the Dark Mask!")
		vars.SOKevent = 14
	end
end

function talkFatal()
	if vars.SOKevent == 6 then
		talk("Fatal: ...")
		talk("Player: I've been ordered to eliminate you.")
		talk("Fatal: ...")
		battle("Fatal")
		getEntity("Fatal").disable()
		vars.SOKevent = 7
	elseif vars.SOKevent == 9 then
		getEntity("Fatal").enable()
		talk("Fatal: That masked figure that brought you here, he was the one who was controlling me.")
		talk("Fatal: He manipulated our village and made me kill all of my comrades, for which he will pay.")
		talk("Player: What do you know about him? and how are you alive?")
		talk("Fatal: He has the ability to manipulate a person as a puppet and he was able to save me in order to further use me, but I escaped.")
		talk("Player: So do you know about his whereabouts?")
		talk("Fatal: Yes, he should be somewhere near the kingdom of Irsil.")
		talk("Fatal: I assume you have your reasons for pursuing him and so I'' leave him to you.")
		talk("Quest Received: Find Masked Man")
		vars.SOKevent = 10
	elseif vars.SOKevent = 11 then
		talk("Fatal: What are you doing!")
		talk("Fatal: He can regenerate, you should have double checked his body!")
		talk("Fatal: I guess I couldn't trust a newbie after all.")
		getEntity("Fatal").disable()
		vars.SOKevent = 12
		talk("Quest Received: Consult Alexander")
	end
end

function talkAdoomGuard()
  if vars.SOKevent == 0 or vars.SOKevent == 2 then
    talk("Hey! you you're a wanted man!")
    battle("Guard")
  else
    talk("Guard: How goes your journey traveller?")
  end 
end
function talkIrsilGuard()
  talk("Guard: Lovely day isn't it traveller!")
end
function talkDevesGuard()
  talk("Guard: Our king is said to be the strongest in all of Oras.")
end
function talkH'atahaGuard()
  if vars.SOKevent <= 8 then
    talk("Guard: Have a great day traveller!")
  elseif vars.SOKevent > 8 then
    talk("Guard: We will avenge the King!")
    battle("Guard")
end
function talkNPC()
  --assign these dialogues to different npcs, I just put it into 1 function for now
  talk("The Summit of Kings is a truly remarkable event!")
  talk("You can buy various items at the shop such as weapons and potions.")
  talk("The four kingdoms of Oras all have a specific mastery of skill.")
  talk("That mischief wizard Fatal has been causing a lot of trouble as of late.")
  talk("I've heard that King Vad makes his guards fight one another for entertainment.")
  talk("That King Fowlin is an interesting guy, he is said to have a rare power with in him.")
  talk("King Taha is said to be the nicest amonst all kings.")
  talk("the King of Adoom, Athens is the oldest king alive.")
  talk("Many strange tales come from adventurers who brave the Dark woods.")
  talk("What are you looking at?")
  talk("Hello traveller, how goes your day?")
  talk("There have been rumours that a mysterious masked figure lurks these streets.")
  talk("I once went to the Dark woods , but I cannot recall what happened.")
  talk("My son is traveller such as you, be sure to say hi to him if you two meet.")
  talk("Oras is an island south of the main land of Zerrock where the World Authorities are.")
  talk("The World Authorities are said to be immortal beings that came from beyond space and time.")
  talk("It is said that fairies used to live in the H'ataha kingdom.")
  talk("My dream is to see the world!")
  talk("The Summit of Kings is an ancient tradition in Oras, it began with the end of the Blood Wars.")
  talk("King Vad is said to be part vampire, because he drinks the blood of the people he defeats.")
  talk("Oras was once an island with nothing but the Dark Woods.")
  talk("The Infinity King is the ruler of the World Authorities and the entire world.")
  talk("King Fowlin's father was assassinated by his own head commander.")
  talk("Better stock up for the Winter, Winter's here are usually deadly.")
  talk("Our native animal is the Grass Elk, they are very tough, but very tasty as well.")
  talk("Have a wonderful day traveller!")
end