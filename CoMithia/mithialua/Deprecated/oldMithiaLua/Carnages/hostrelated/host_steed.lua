collar_host_steed = {

		use=function(player)
		player:sendMinitext("Disabled")
		return

--[[		if((player.m~=2005) and (player.m~=2003) and (player.m<2010 or player.m>2100)) then
			player:sendMinitext("You may only use this ability on Carnage maps.")
			return
		end
		if(player.armorColor~=15) then
			player:sendMinitext("Host dye is required.")
			return
		end

		if(player.state~=0) then
			player:sendMinitext("You can't do that now.")
			return
		end
			
			player:removeItem("white_horse_saddle",1)
			player.registry["summonmountdisguise"]=6
			player.registry["summonmountspeed"]=10
			mount_summon.cast(player,player)

]]--	
		end


}