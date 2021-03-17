mithian_frenzy = {
	uncast=function(player)
		if(player.m==101 and player.mapRegistry["mithiandead"]==0)then
			player:removeHealth(100000000)
			player:sendAnimation(40)
		end
	end,
	while_cast=function(player)
		if(player.m==101 and player.mapRegistry["mithiandead"]==0)then
			player:removeHealth(player.maxHealth*.005)
			player:talk(0,""..player.threat)
			player:sendStatus()
		end
	end,
}