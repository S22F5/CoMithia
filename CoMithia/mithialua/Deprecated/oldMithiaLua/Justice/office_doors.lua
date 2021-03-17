hid30020706 = {
	click=function(player,npc)	

	if(player.registry["constable"]>0) then
			player:warp(3005,7,13)
			player:sendMinitext("Welcome, Constable.")
	else
			player:warp(3002,7,8)
			player:sendMinitext("This room is limited to Mithia's Constables.")
	end

	end
}

hid30020806 = {
	click=function(player,npc)	

	if(player.registry["constable"]>0) then
			player:warp(3005,8,13)
			player:sendMinitext("Welcome, Constable.")
	else
			player:warp(3002,8,8)
			player:sendMinitext("This room is limited to Mithia's Constables.")
	end

	end
}