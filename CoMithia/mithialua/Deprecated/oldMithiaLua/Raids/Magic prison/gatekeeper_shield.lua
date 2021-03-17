gatekeeper_shield = {
	while_cast=function(player)
		player:sendAnimation(12)		
		player:removeHealth(player.maxHealth*.03)
	end,
}