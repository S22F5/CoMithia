taverns_favor = {
use = function(player)
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.m ~= 134 and player.m ~= 135) then
		player:warp(46, 11, 11)
	end
end
}