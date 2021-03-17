travelers_guide = {
check = function(player)
	if (player.gmLevel >= 50 or player.registry["guide"] == 250) then
		player.boardDel = 1
		player.boardWrite = 1
	end
end
}