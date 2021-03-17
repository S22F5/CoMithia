fox_spell3 = {
	while_cast=function(player)
		player:sendAnimation(281)
		player:talk(2,"[three stacks]")
		player:removeHealth(player.maxHealth*.30)
	end,
}