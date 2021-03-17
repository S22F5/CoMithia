hid556188 = {
	click=function(player)
		if(player.baseHealth>=20000 or player.baseMagic>=10000) then			
				player:warp(4508,02,11)			
				player:sendMinitext("Hive cave")
		else 
                        player:warp(55,61,91)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid556288 = {
	click=function(player)
		if(player.baseHealth>=20000 or player.baseMagic>=10000) then			
				player:warp(4508,02,11)			
				player:sendMinitext("Hive cave")
		else 
                        player:warp(55,61,91)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}