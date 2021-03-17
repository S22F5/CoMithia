cheap_wine = {
use = function(player)
	local magicGiven = 50
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player:hasItem("cheap_wine", 1) == true) then
		player:deductDuraInv(player.invSlot, 1)
		player:sendAction(7,14)
		player.magic = player.magic + magicGiven
		player:sendStatus()
	end
end
}