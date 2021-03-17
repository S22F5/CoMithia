island_wine = {
use = function(player)
    player:talk(0,"I am in here in state = "..player.state)
	
	if (player.state == 1) then
		player:talk(0,"I am in state == 1")
		player:sendMinitext("You imagine tipping back the wine, and drinking it.  But nothing happens, because you are dead.")
		return
	elseif (player.state == 3) then
		player:sendMinitext("Drink and ride? Bad idea.")
		return
	end
	
	if (player:hasItem("island_wine",1) == true) then
		player:deductDuraInv(player.invSlot, 1)
		player:sendAction(7,40)
	end
end
}