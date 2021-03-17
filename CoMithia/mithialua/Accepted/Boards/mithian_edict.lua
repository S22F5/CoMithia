mithian_edict = {
check = function(player)
	player.boardWrite = 1
	
	if (player.gmLevel >= 50 or player.registry["warden"] >= 50) then
		player.boardDel = 1
	end
end
}