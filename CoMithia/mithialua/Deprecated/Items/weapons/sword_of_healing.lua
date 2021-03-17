sword_of_healing = {
	on_hit = function(player,target)
		if(player:hasDuration(127)) then
			return
		end
		local damage = player.damage
		local healing = damage*.1


		local absx=0
		local absy=0
		local dist=0
		local ta=player:getObjectsInArea(BL_PC)
		if(#ta>0) then
			for z=1,#ta do
				absx=math.abs(player.x-ta[z].x)
				absy=math.abs(player.y-ta[z].y)
				dist=absx+absy

				if(dist<=8) then
					if(ta[z].state~=1) then
						for g=1,#player.group do
							if(ta[z].ID==player.group[g]) then
								ta[z]:addHealth(healing)
							end
						end
					end
				end
			end
		end	
		

	end
}