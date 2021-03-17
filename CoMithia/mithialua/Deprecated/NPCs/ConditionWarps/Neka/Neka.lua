hid121103 = {
	click=function(player)
		if(player.level>=3) then
			player:warp(20,11,3)
		else 
                        player:warp(12,11,5)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}