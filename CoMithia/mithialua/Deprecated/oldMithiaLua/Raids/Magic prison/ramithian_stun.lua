mithian_stun = {
	while_cast=function(player)
		player.paralyzed = true
	end,
	uncast=function(player)
		player.paralyzed = false
	end,
}