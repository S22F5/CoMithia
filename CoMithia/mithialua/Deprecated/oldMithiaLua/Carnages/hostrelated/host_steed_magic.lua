host_steed_magic = {
	cast=function(player,target)

	if((player.m~=2005) and (player.m~=2001) and (player.m~=2003) and (player.m<2010 or player.m>2100)) then
		player:sendMinitext("You may only use this ability on Carnage maps.")
		return
	end
	if(player.armorColor~=15) then
		player:sendMinitext("Host dye is required.")
		return
	end
	if(player:hasDuration("host_steed_magic")) then
		player:sendMinitext("Host Steed is already in effect.")
		return
	end
	if(player.state~=0) then
		player:sendMinitext("Something went wrong")
		return
	end
		player:lock()
		player.speed=10
		player.state=3
		player.disguise=357
		player:updateState()
		player:sendStatus()
		player:sendAction(6,35)
		player:sendAnimation(15)
		player:sendMinitext("You jump on your steed!")
		player:setDuration("host_steed_magic",5000000)
		player:unlock()

	end,
	while_cast=function(player)
		if((player.m~=2005) and (player.m~=2001) and (player.m~=2003) and (player.m<2010 or player.m>2100)) then
			player:sendMinitext("You may only use this ability on Carnage maps.")
			player:setDuration("host_steed_magic",0)
			return
		end
		if(player.armorColor~=15) then
			player:sendMinitext("Host dye is required.")
			player:setDuration("host_steed_magic",0)
			return
		end
		if(player.state~=3) then
			player:setDuration("host_steed_magic",0)
			return
		end		
	end,
	recast=function(player)
		player:lock()
		player.state=3
		player.disguise=6
		player.speed=10
		player:updateState()
		player:sendStatus()
		player:unlock()
	end,
	uncast=function(player)
		player:lock()
		player.speed=80
		if(player.state~=1) then
			player.state=0
		end
		player.disguise=0
		player:updateState()
		player:sendStatus()
		player:unlock()
	end
}