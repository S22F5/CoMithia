hid174480 = {
	click=function(player)
		if(player.level>=38) then
			player:warp(1201,22,38)
		else 
                        player:warp(17,44,82)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid174580 = {
	click=function(player)
		if(player.level>=38) then
			player:warp(1201,23,38)
		else 
                        player:warp(17,45,82)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}