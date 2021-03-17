lore = {
check = function(player)
	if (player.gmLevel >= 50 or player:staff("lore") == 5) then
		player.boardDel = 1
		player.boardWrite = 1
	end
end
}