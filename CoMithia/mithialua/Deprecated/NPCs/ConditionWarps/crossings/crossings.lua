hid459071 = {
	click=function(player)
		if(player.level>=77) then
			player:warp(1800,1,28)
		else 
                        player:warp(45,90,73)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid459171 = {
	click=function(player)
		if(player.level>=77) then
			player:warp(1800,2,28)
		else 
                        player:warp(45,91,73)
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}