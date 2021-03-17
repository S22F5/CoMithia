hid5598147 = {
	click=function(player)
		if(player.level>=99) then
			player:warp(4201,12,22)
		else 
                        player:warp(55,96,149)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}