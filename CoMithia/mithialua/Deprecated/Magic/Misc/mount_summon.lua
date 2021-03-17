mount_summon = {
		cast=function(player,target)

			if(player.state~=0) then
				player:sendMinitext("You can't do that in that form.")
				return
			end

			player:lock()
			player:setDuration("mount_summon",2000)

		end,

		recast=function(player,target)

		
		player:lock()
		
		end,

		uncast=function(player,target)

			player.disguise=player.registry["summonmountdisguise"]
			player.speed=player.registry["summonmountspeed"]
			player:unlock()
				if(player.state~=1) then
					player.state=3
				end
			player:updateState()
			player:sendStatus()

		end

     
}



