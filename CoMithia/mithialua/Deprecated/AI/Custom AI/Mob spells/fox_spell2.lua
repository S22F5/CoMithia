fox_spell2 = {
	while_cast=function(player)
		player:sendAnimation(281)
		player:talk(2,"[two stacks]")
		player:removeHealth(player.maxHealth*.15)
	end,
}