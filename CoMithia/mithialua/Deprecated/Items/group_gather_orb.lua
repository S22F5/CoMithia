group_gather_orb = {
	use=function(player)
		if(player.group == nil) then
			player:sendMinitext("You are not in a group")
			return
		end
		--player:sendMinitext("OMG!")
		for _x=1,#player.group do
			Player(player.group[_x]):warp(player.m,player.x,player.y)
		end
		
	end
}