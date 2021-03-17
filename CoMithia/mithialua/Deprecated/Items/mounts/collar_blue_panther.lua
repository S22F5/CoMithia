collar_blue_panther = {

		use=function(player)

			if(player.state~=0) then
				player:sendMinitext("You can't do that now.")
				return
			end
			
			player.registry["summonmountdisguise"]=49
			player.registry["summonmountspeed"]=60
			mount_summon.cast(player,player)

	
		end

}