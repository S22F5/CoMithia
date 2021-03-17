eye_gouge = {
	while_cast=function(player)
		player:sendAnimation(132)
		player.blind=1
		player:talk(2,"I'm blind")
	end,
	uncast=function(player)
		player.blind=0
	end
}