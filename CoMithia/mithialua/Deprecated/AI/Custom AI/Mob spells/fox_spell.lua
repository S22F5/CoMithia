fox_spell = {
	while_cast=function(player)
		player:sendAnimation(281)
		player:talk(2,"[one stack]")
		player:removeHealth(player.maxHealth*.05)
	end,
}