jar_of_souls = {
use = function(player)
	if ((player.m >= 7000 and player.m < 8000) or player.m == 134 or player.m == 135 or player.m == 73) then
		return--Carnage maps
	end
	
	local souls = {2, 6, 7, 8, 11, 12, 21, 22, 64, 65, 66, 67, 68, 69, 74, 75, 76, 77, 78, 79, 80,
	81, 82, 83, 84, 86, 92, 111, 112, 113, 114, 117, 118, 119, 120, 121, 123, 124, 125, 126, 130, 131, 135}
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	local soul = souls[math.random(#souls)]
	
	if (player:hasItem("jar_of_souls", 1) == true) then
		player:removeItem("jar_of_souls", 1)
		player:sendAction(6, 80)
		player:spawn(soul, player.x, player.y, 1, player.m)
	end
end
}