santas_disguise = {
		cast=function(player,target)

			if(player.state==1) then
				player:sendMinitext("Spirits can't do that.")
				return
			end

			player.state=4
			player.disguise=191
			player.disguiseColor=0
			player:updateState()
			player:setDuration("santas_disguise",100000)

		end,

		recast=function(player,target)

			player.state=4
			player.disguise=191
			player.disguiseColor=0
			player:updateState()
		
		end,

		uncast=function(player,target)

			if(player.state~=1) then
				player.state=0
			end
			player.disguise=0
			player.disguiseColor=0
			player:updateState()

		end

     
}



