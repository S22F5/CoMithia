law = {
check = function(player)
	if (player.gmLevel >= 50 or player.registry["lawWriter"] == 1) then
		player.boardWrite = 1
	end
end
}