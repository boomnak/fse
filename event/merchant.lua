
talk("There are monsters up ahead!")

if getGold() >= 15 then
  while true do
    addMessage("Do you want to buy a health potion?")
    addMessage("It heals 5 health!")
    addMessage("Only 15 gold!")
    addMessage("(c = yes, x = no)")
    
    sleep(0.1)
    if down('interact') then
      giveItem('hpotion')
      changeGold(-15)
      break
      
    elseif down('item') then
      break
    end
    
    clearMessage()
  end
else
  talk("If you get 15 gold I'll sell you a health potion.")
end

clearMessage()
hideMessage()
