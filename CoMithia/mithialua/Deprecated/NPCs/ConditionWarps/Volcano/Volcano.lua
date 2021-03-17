hid403004 = {
	click=function(player)
		if(player.level>=45) then
			player:warp(1301,8,16)
		else 
                        player:warp(40,30,6)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid403104 = {
	click=function(player)
		if(player.level>=45) then
			player:warp(1301,9,16)
		else 
                        player:warp(40,31,6)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}