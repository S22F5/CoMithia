mithian_debuff = {
	cast=function(player)
		player.ac=player.ac+10
		player:setDuration("mithian_debuff",30000)
		player:sendStatus()
	end,
	uncast=function(player)
		player.ac=player.ac-10
		player:sendStatus()
	end,
}

mithian_debuff2 = {
	cast=function(player)
		player.ac=player.ac+20
		player:setDuration("mithian_debuff2",30000)
		player:sendStatus()
	end,
	uncast=function(player)
		player.ac=player.ac-20
		player:sendStatus()
	end,
}

mithian_debuff3 = {
	cast=function(player)
		player.ac=player.ac+30
		player:setDuration("mithian_debuff3",30000)
		player:sendStatus()
	end,
	while_cast=function(player)
		player:sendAnimation(248)
	end,
	uncast=function(player)
		player.ac=player.ac-30
		player:sendStatus()
	end,
}

mithian_debuff4 = {
	cast=function(player)
		player.ac=player.ac+40
		player:setDuration("mithian_debuff4",30000)
		player:sendStatus()
	end,
	while_cast=function(player)
		player:sendAnimation(248)
	end,
	uncast=function(player)
		player.ac=player.ac-40
		player:sendStatus()
	end,
}

mithian_debuff5 = {
	cast=function(player)
		player.ac=player.ac+50
		player:setDuration("mithian_debuff5",30000)
		player:sendStatus()
	end,
	while_cast=function(player)
		player:sendAnimation(248)
	end,
	uncast=function(player)
		player.ac=player.ac-50
		player:sendStatus()
	end,
}