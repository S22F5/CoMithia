burnt_horse_saddle = {

		use=function(player)

			if(player.state~=0) then
				player:sendMinitext("You can't do that now.")
				return
			end
			
			player:removeItem("burnt_horse_saddle",1)
			player.registry["summonmountdisguise"]=27
			player.registry["summonmountspeed"]=65
			mount_summon.cast(player,player)

	
		end

}