beautiful_fish = {
	use = function(player)
		local e={}
		local m=player.m
		local x=player.x
		local y=player.y
		if(player.side==0) then y=y-1 end
		if(player.side==1) then x=x+1 end
		if(player.side==2) then y=y+1 end
		if(player.side==3) then x=x-1 end
		e=player:getObjectsInCell(m,x,y,BL_PC)
		if(#e>0) then
			if(player.side==0) then
				if(e[1].side~=2) then
				player:sendMinitext("You must be facing your target.")
				return
				end
			end
			if(player.side==1) then
				if(e[1].side~=3) then
				player:sendMinitext("You must be facing your target.")
				return
				end
			end
			if(player.side==2) then
				if(e[1].side~=0) then
				player:sendMinitext("You must be facing your target.")
				return
				end
			end
			if(player.side==3) then
				if(e[1].side~=1) then
				player:sendMinitext("You must be facing your target.")
				return
				end
			end
			player:sendAction(24,2000)
			e[1]:sendAction(24,2000)
		end
	end
}