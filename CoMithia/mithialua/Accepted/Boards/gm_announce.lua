gm_announce = {
check = function(player)
	if (player.gmLevel >= 50) then
		player.boardDel = 1
		player.boardWrite = 1
	end
end
}