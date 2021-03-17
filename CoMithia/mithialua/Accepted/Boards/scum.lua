scum = {
check = function(player)
	if (player.gmLevel >= 50 or player.registry["warden"] >= 50) then
		player.boardDel = 1
		player.boardWrite = 1
	end
end
}