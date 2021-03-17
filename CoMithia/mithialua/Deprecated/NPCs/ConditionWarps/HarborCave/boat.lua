hid11062745 = {
	click=function(player)
		if(player.level>=32) then
			player:warp(1106,23,38)
		else 
                        player:warp(1106,27,47)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}