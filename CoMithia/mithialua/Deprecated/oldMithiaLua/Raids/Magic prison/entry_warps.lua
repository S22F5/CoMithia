hid17122131 = {
	click=function(player)
		if(player.baseHealth>=100000 or player.baseMagic>=50000) then			
			player:warp(20101,15,28)			
			player:sendMinitext("Magic Prison Raid")
		else 
            player:warp(17,121,134)
            player:sendMinitext("You're not ready to enter yet")
        end
	end
}

hid17121131 = {
	click=function(player)
		if(player.baseHealth>=100000 or player.baseMagic>=50000) then			
			player:warp(20101,14,28)			
			player:sendMinitext("Magic Prison Raid")
		else 
            player:warp(17,121,134)
            player:sendMinitext("You're not ready to enter yet")
        end
	end
}

hid17120131 = {
	click=function(player)
		if(player.baseHealth>=100000 or player.baseMagic>=50000) then			
			player:warp(20101,14,28)			
			player:sendMinitext("Magic Prison Raid")
		else 
            player:warp(17,121,134)
            player:sendMinitext("You're not ready to enter yet")
        end
	end
}

hid201011504 = {
	click=function(player)
		local checkmobalive= {}
		checkmobalive=mob:getObjectsInArea(BL_MOB)
		if(#checkmobalive>0) then
			for i=1,#checkmobalive do
				if(checkmobalive[i].name=="The Gatekeeper" ) then
					player:sendMinitext("You must kill The Gatekeeper before you may pass")
				else
					if(player.state==1) then
						player:sendMinitext("You must be alive to pass through here")
					else
						player:warp(20102,20,12)
					end
				end
			end
		end
	end
}
hid201011504 = {
	click=function(player)
		local checkmobalive= {}
		checkmobalive=mob:getObjectsInArea(BL_MOB)
		if(#checkmobalive>0) then
			for i=1,#checkmobalive do
				if(checkmobalive[i].name=="The Gatekeeper" ) then
					player:sendMinitext("You must kill The Gatekeeper before you may pass")
				else
					if(player.state==1) then
						player:sendMinitext("You must be alive to pass through here")
					else
						player:warp(20102,20,12)
					end
				end
			end
		end
	end
}