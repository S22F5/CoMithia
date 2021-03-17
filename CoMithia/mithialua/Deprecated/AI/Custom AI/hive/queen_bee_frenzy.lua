queen_bee_frenzy = {
	uncast=function(player)
		if(player.m==4505 and player.mapRegistry["queenbeedead"]==0)then
			player:removeHealth(100000000)
			player:sendAnimation(153)
			player:sendMinitext("The poison from the queen causes your internal organs to explode")
		else
			player:sendMinitext("The poison seems to have no effect")
		end
	end,
}