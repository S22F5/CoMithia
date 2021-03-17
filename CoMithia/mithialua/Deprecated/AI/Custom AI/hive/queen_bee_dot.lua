queen_bee_dot = {
	while_cast=function(player)
		player:sendAnimation(1)		
		player:removeHealth(player.maxHealth*.05)
	end,
}