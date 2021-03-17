hid2100196 = {
	click=function(player,npc)


		if(player.armorColor~=60 and player.armorColor~=61 and player.armorColor~=63 and player.armorColor~=65) then
				player:sendMinitext("You are not properly dyed to fight!")
				player:warp(2100,24,24)
				return
		end
		
		if(player.mapRegistry["assaultarena"]==0) then
				player:sendMinitext("The Arena has not been set.")
				player:warp(2100,24,24)
				return
		end

		
		if(player.mapRegistry["assaultarena"]==1) then
			if(player.armorColor==60) then
				player:warp(2041,math.random(46,50),math.random(2,4))
			elseif(player.armorColor==63) then
				player:warp(2041,math.random(2,10),math.random(92,96))
			else
				player:warp(2100,24,24)
				player:sendMinitext("The Assault Games require Red and Black as the only colors.")
				return
			end
		end
	end
}

hid2100206 = {
	click=function(player,npc)


		if(player.armorColor~=60 and player.armorColor~=61 and player.armorColor~=63 and player.armorColor~=65) then
				player:sendMinitext("You are not properly dyed to fight!")
				player:warp(2100,24,24)
				return
		end
		
		if(player.mapRegistry["assaultarena"]==0) then
				player:sendMinitext("The Arena has not been set.")
				player:warp(2100,24,24)
				return
		end

		
		if(player.mapRegistry["assaultarena"]==1) then
			if(player.armorColor==60) then
				player:warp(2041,math.random(46,50),math.random(2,4))
			elseif(player.armorColor==63) then
				player:warp(2041,math.random(2,10),math.random(92,96))
			else
				player:warp(2100,24,24)
				player:sendMinitext("The Assault Games require Red and Black as the only colors.")
				return
			end
		end
	end

}

hid2100195 = {
	open=function(player)
		if(player.side==2) then
    	        	if(player.registry["carnagehost"]>0) then		
                		local obj=getObject(2100,19,6)
				if(obj==340) then
					setObject(2100,19,6,360)
					setObject(2100,20,6,361)
					player:sendMinitext("Opened.")
					return
				elseif(obj==360) then
					setObject(2100,19,6,340)
					setObject(2100,20,6,341)
					player:sendMinitext("Closed.")
					return
				end
                	else
                     		player:sendMinitext("You are not a carnage host.")
                	end
		end
	end

}

hid2100205 = {
	open=function(player)
		if(player.side==2) then
    	        	if(player.registry["carnagehost"]>0) then		
                		local obj=getObject(2100,20,6)
				if(obj==341) then
					setObject(2100,19,6,360)
					setObject(2100,20,6,361)
					player:sendMinitext("Opened.")
					return
				elseif(obj==361) then
					setObject(2100,19,6,340)
					setObject(2100,20,6,341)
					player:sendMinitext("Closed.")
					return
				end
                	else
                     		player:sendMinitext("You are not a carnage host.")
                	end
		end
	end

}