queen_bee_stun = {
	while_cast=function(player)		
		if(player.registry["pollinatecounter"]==0) then
			player:sendAnimation(317)
		end
		player.registry["pollinatecounter"]=player.registry["pollinatecounter"]+1
		player.sleep=1.6		
	end,
	uncast=function(player)
		player.registry["pollinatecounter"]=0
		player.sleep=0
	end,
}