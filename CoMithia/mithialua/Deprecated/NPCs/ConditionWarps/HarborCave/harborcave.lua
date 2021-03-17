hid4393186 = {
	click=function(player)
		if(player.level>=24) then
			player:warp(1101,16,18)
		else 
                        player:warp(43,93,188)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid4394186 = {
	click=function(player)
		if(player.level>=24) then
			player:warp(1101,17,18)
		else 
                        player:warp(43,94,188)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}