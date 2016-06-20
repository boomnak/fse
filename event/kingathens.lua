local kingAthens, kingAthensNum = getEntity("KingAthens")

if vars.SOKevent == 0 then
  removeEntity(kingAthensNum) --Make a similar function to disable the character from the game
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
      removeEntity(kingAthensNum)
      
      -- end the game here? Otherwise it's an endless loop.
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
  local _, kingVadNum = getEntity("KingVad")
  local _, kingFowlin = getEntity("KingFowlin")
  
  talk("H'ataha Guard: What is the meaning of this?")
  talk("King Fowlin: A masked figure appeared out of no where and assassinated King Taha!")
  talk("H'ataha Guard: You expect us to believe that!")
  talk("H'ataha Guard: That a man appeared out of no where in the worlds most secured meeting and murdered our king.")
  talk("H'ataha Guard: I see now, this was a organized attack by all of your kingdoms against ours!")
  talk("H'ataha Guard: By the honour of king Taha, you are all uder arrest!")
  talk("King Vad: How disrespectful, you should all know your place.")
  talk("King Vad: This meeting was a bore anyway.")
  removeEntity(kingVadNum)
  talk("King Fowlin: Athens! you and your men should leave while you can, this situation is about to get messy.")
  removeEntity(kingFowlinNum)
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
  removeEntity(kingAthensNum)
end
