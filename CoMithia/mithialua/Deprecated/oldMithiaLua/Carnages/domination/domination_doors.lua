hid2100296 = {
	click=function(player,npc)


		if(player.armorColor~=60 and player.armorColor~=61 and player.armorColor~=63 and player.armorColor~=65) then
				player:sendMinitext("You are not properly dyed to fight!")
				player:warp(2100,24,24)
				return
		end
		
		if(player.mapRegistry["dominationarena"]==0) then
				player:sendMinitext("The Arena has not been set.")
				player:warp(2100,24,24)
				return
		end

		
		if(player.mapRegistry["dominationarena"]==1) then
			if(player.armorColor==60) then
				player:warp(2061,math.random(0,9),math.random(0,9))
			elseif(player.armorColor==61) then
				player:warp(2061,math.random(35,44),math.random(35,44))
			elseif(player.armorColor==63) then
				player:warp(2061,math.random(35,44),math.random(0,9))
			elseif(player.armorColor==65) then
				player:warp(2061,math.random(0,9),math.random(35,44))
			end
		end
	end
}

hid2100306 = {
	click=function(player,npc)


		if(player.armorColor~=60 and player.armorColor~=61 and player.armorColor~=63 and player.armorColor~=65) then
				player:sendMinitext("You are not properly dyed to fight!")
				player:warp(2100,24,24)
				return
		end
		
		if(player.mapRegistry["dominationarena"]==0) then
				player:sendMinitext("The Arena has not been set.")
				player:warp(2100,24,24)
				return
		end

		
		if(player.mapRegistry["dominationarena"]==1) then
			if(player.armorColor==60) then
				player:warp(2061,math.random(0,9),math.random(0,9))
			elseif(player.armorColor==61) then
				player:warp(2061,math.random(35,44),math.random(35,44))
			elseif(player.armorColor==63) then
				player:warp(2061,math.random(35,44),math.random(0,9))
			elseif(player.armorColor==65) then
				player:warp(2061,math.random(0,9),math.random(35,44))
			end
		end
	end

}

hid2100295 = {
	open=function(player)
		if(player.side==2) then
    	        	if(player.registry["carnagehost"]>0) then		
                		local obj=getObject(2100,29,6)
				if(obj==340) then
					setObject(2100,29,6,360)
					setObject(2100,30,6,361)
					player:sendMinitext("Opened.")
					return
				elseif(obj==360) then
					setObject(2100,29,6,340)
					setObject(2100,30,6,341)
					player:sendMinitext("Closed.")
					return
				end
                	else
                     		player:sendMinitext("You are not a carnage host.")
                	end
		end
	end

}

hid2100305 = {
	open=function(player)
		if(player.side==2) then
    	        	if(player.registry["carnagehost"]>0) then		
                		local obj=getObject(2100,30,6)
				if(obj==341) then
					setObject(2100,29,6,360)
					setObject(2100,30,6,361)
					player:sendMinitext("Opened.")
					return
				elseif(obj==361) then
					setObject(2100,29,6,340)
					setObject(2100,30,6,341)
					player:sendMinitext("Closed.")
					return
				end
                	else
                     		player:sendMinitext("You are not a carnage host.")
                	end
		end
	end

}