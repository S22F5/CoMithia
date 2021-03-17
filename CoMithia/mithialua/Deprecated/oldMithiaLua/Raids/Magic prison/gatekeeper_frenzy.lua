gatekeeper_frenzy = {
	uncast=function(player)
		if(player.m==20101 and player.mapRegistry["gatekeeperdead"]==0)then
			player:removeHealth(100000000)
			player:sendAnimation(111)
		end
	end,
}