hid300010901 = {
	click=function(player,npc)	

		if(player.registry["subpathlevel"]>=2 and player.class==6) then
			player:warp(30002,9,18)
			player:sendMinitext("Welcome, Guide.")
		else
			player:warp(30001,9,4)
			player:sendMinitext("This room is limited to Templar Guides.")
		end

	end
}

hid300011001 = {
	click=function(player,npc)	

		if(player.registry["subpathlevel"]>=2 and player.class==6) then
			player:warp(30002,10,18)
			player:sendMinitext("Welcome, Guide.")
		else
			player:warp(30001,10,4)
			player:sendMinitext("This room is limited to Templar Guides.")
		end

	end
}