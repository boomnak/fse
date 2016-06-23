local _, fatalNum = getEntity("Fatal")

if vars.SOKevent == 6 then
  talk("Fatal: ...")
  talk("Player: I've been ordered to eliminate you.")
  talk("Fatal: ...")
  battle({"fatal"})
  removeEntity(fatalNum)
  vars.SOKevent = 7
elseif vars.SOKevent == 9 then
  getEntity("Fatal").enable() -- what does this mean?
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
  removeEntity(fatalNum)
  vars.SOKevent = 12
  talk("Quest Received: Consult Alexander")
end
