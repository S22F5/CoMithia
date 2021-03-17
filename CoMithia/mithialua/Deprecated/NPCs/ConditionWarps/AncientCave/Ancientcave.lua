hid381605 = {
	click=function(player)
		if(player.level>=57) then
			player:warp(1501,6,18)
		else 
                        player:warp(38,16,7)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid381705 = {
	click=function(player)
		if(player.level>=57) then
			player:warp(1501,7,18)
		else 
                        player:warp(38,17,7)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}