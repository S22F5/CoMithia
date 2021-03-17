hid283500 = {
	click=function(player)
		if(player.level>=50) then
			player:warp(1401,12,28)
		else 
                        player:warp(28,35,2)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid283600 = {
	click=function(player)
		if(player.level>=50) then
			player:warp(1401,13,28)
		else 
                        player:warp(28,36,2)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}