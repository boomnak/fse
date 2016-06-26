
talk("There are monsters up ahead!")

while true do
  addMessage("Do you want to buy a health potion?")
  addMessage("It heals 5 health!")
  addMessage("Only 15 gold!")
  addMessage("(c = yes, x = no)")
  
  if down('interact') then
    giveItem('hpotion')
    changeGold(-15)
    break
    
  elseif down('item') then
    break
  end
end

clearMessage()
hideMessage()
