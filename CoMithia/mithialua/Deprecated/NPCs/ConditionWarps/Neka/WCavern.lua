hid170189 = {
	click=function(player)
	--change to  "level 9"
		if(player.level>=9) then
			player:warp(4301,17,43)
		else 
                        player:warp(17,1,90)
						--change to  "you're not ready to enter yet"
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}

hid170289 = {
	click=function(player)
	--change to  "level 9"
		if(player.level>=9) then
			player:warp(4301,17,43)
		else 
                        player:warp(17,1,90)
						--change to  "you're not ready to enter yet"
                        player:sendMinitext("You're not ready to enter yet")
                end
	end
}