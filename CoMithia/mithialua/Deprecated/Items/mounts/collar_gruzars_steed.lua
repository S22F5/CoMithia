collar_gruzars_steed = {

		use=function(player)

			if(player.state~=0) then
				player:sendMinitext("You can't do that now.")
				return
			end
			
			player.registry["summonmountdisguise"]=11
			player.registry["summonmountspeed"]=55
			mount_summon.cast(player,player)

	
		end

}