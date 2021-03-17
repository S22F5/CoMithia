meat_scrap = {
use = function(player)
	local heal = 25
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	player.attacker = player.ID
	player:addHealthExtend(heal, 0, 0, 0, 0, 0)
	player:sendAction(7, 14)
end
}