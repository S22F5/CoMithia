hid210096 = {
	click=function(player,npc)


		if(player.armorColor~=60 and player.armorColor~=61 and player.armorColor~=63 and player.armorColor~=65) then
				player:sendMinitext("You are not properly dyed to fight!")
				player:warp(2100,24,24)
				return
		end
		
		if(player.mapRegistry["carnagearena"]==0) then
				player:sendMinitext("The Arena has not been set.")
				player:warp(2100,24,24)
				return
		end

		
		if(player.mapRegistry["carnagearena"]==1) then
			if(player.armorColor==60) then
				player:warp(2005,math.random(2,7),math.random(6,10))
			elseif(player.armorColor==61) then
				player:warp(2005,math.random(32,37),math.random(6,10))
			elseif(player.armorColor==63) then
				player:warp(2005,math.random(29,33),math.random(32,36))
			elseif(player.armorColor==65) then
				player:warp(2005,math.random(6,10),math.random(32,36))
			end
		elseif(player.mapRegistry["carnagearena"]==2) then
			if(player.armorColor==60) then
				player:warp(2021,math.random(34,38),math.random(34,38))
			elseif(player.armorColor==61) then
				player:warp(2021,math.random(34,38),math.random(6,10))
			elseif(player.armorColor==63) then
				player:warp(2021,math.random(6,10),math.random(6,10))
			elseif(player.armorColor==65) then
				player:warp(2021,math.random(6,10),math.random(34,38))
			end
		end
	end
}

hid2100106 = {
	click=function(player,npc)


		if(player.armorColor~=60 and player.armorColor~=61 and player.armorColor~=63 and player.armorColor~=65) then
				player:sendMinitext("You are not properly dyed to fight!")
				player:warp(2100,24,24)
				return
		end
		
		if(player.mapRegistry["carnagearena"]==0) then
				player:sendMinitext("The Arena has not been set.")
				player:warp(2100,24,24)
				return
		end

		
		if(player.mapRegistry["carnagearena"]==1) then
			if(player.armorColor==60) then
				player:warp(2005,math.random(2,7),math.random(6,10))
			elseif(player.armorColor==61) then
				player:warp(2005,math.random(32,37),math.random(6,10))
			elseif(player.armorColor==63) then
				player:warp(2005,math.random(29,33),math.random(32,36))
			elseif(player.armorColor==65) then
				player:warp(2005,math.random(6,10),math.random(32,36))
			end
		elseif(player.mapRegistry["carnagearena"]==2) then
			if(player.armorColor==60) then
				player:warp(2021,math.random(34,38),math.random(34,38))
			elseif(player.armorColor==61) then
				player:warp(2021,math.random(34,38),math.random(6,10))
			elseif(player.armorColor==63) then
				player:warp(2021,math.random(6,10),math.random(6,10))
			elseif(player.armorColor==65) then
				player:warp(2021,math.random(6,10),math.random(34,38))
			end
		end
	end

}

hid210095 = {
	open=function(player)
		if(player.side==2) then
    	        	if(player.registry["carnagehost"]>0) then		
                		local obj=getObject(2100,9,6)
				if(obj==340) then
					setObject(2100,9,6,360)
					setObject(2100,10,6,361)
					player:sendMinitext("Opened.")
					return
				elseif(obj==360) then
					setObject(2100,9,6,340)
					setObject(2100,10,6,341)
					player:sendMinitext("Closed.")
					return
				end
                	else
                     		player:sendMinitext("You are not a carnage host.")
                	end
		end
	end

}

hid2100105 = {
	open=function(player)
		if(player.side==2) then
    	        	if(player.registry["carnagehost"]>0) then		
                		local obj=getObject(2100,10,6)
				if(obj==341) then
					setObject(2100,9,6,360)
					setObject(2100,10,6,361)
					player:sendMinitext("Opened.")
					return
				elseif(obj==361) then
					setObject(2100,9,6,340)
					setObject(2100,10,6,341)
					player:sendMinitext("Closed.")
					return
				end
                	else
                     		player:sendMinitext("You are not a carnage host.")
                	end
		end
	end

}