trapped_soul = {
use = function(player)
	if (player.m ~= 226) then
		player:sendMinitext("The soul has a strong binding to one of the rooms in the basement.")
		return--Not boss room
	end
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	local soul = 130
	
	if (player:hasItem("trapped_soul", 1) == true) then
		player:removeItem("trapped_soul", 1)
		player:sendAction(6, 80)
		player:spawn(soul, player.x, player.y, 1, player.m)
	end
end
}