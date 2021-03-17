hid559131 = {
	click=function(player)
		if(player.baseHealth>=15000 or player.baseMagic>=7500) then			
				player:warp(4404,17,18)			
				player:sendMinitext("Fox cave")
		else 
                        player:warp(55,91,33)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid559231 = {
	click=function(player)
		if(player.baseHealth>=15000 or player.baseMagic>=7500) then			
				player:warp(4404,18,18)	
				player:sendMinitext("Fox cave")				
		else 
                        player:warp(55,91,33)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}
