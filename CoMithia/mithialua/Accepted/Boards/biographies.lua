biographies = {
check = function(player)
	if (player.gmLevel >= 50 or player.registry["librarian"] == 1) then
		player.boardDel = 1
		player.boardWrite = 1
	end
end
}