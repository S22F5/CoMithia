hid2100396 = {
	click=function(player,npc)


		if(player.armorColor~=63 and player.armorColor~=65) then
				player:sendMinitext("You are not properly dyed to fight!")
				player:warp(2100,24,24)
				return
		end
		
		if(player.mapRegistry["elixirwararena"]==0) then
				player:sendMinitext("The Arena has not been set.")
				player:warp(2100,24,24)
				return
		end

		
		if(player.mapRegistry["elixirwararena"]==1) then
			if(player.armorColor==63) then
				player.registry["elixircolor"]=63
				player:warp(2081,math.random(3,35),math.random(2,5))
			elseif(player.armorColor==65) then
				player.registry["elixircolor"]=65
				player:warp(2081,math.random(3,35),math.random(49,52))
			end
		end
	end
}

hid2100406 = {
	click=function(player,npc)


		if(player.armorColor~=63 and player.armorColor~=65) then
				player:sendMinitext("You are not properly dyed to fight!")
				player:warp(2100,24,24)
				return
		end
		
		if(player.mapRegistry["elixirwararena"]==0) then
				player:sendMinitext("The Arena has not been set.")
				player:warp(2100,24,24)
				return
		end

		
		if(player.mapRegistry["elixirwararena"]==1) then
			if(player.armorColor==63) then
				player.registry["elixircolor"]=63
				player:warp(2081,math.random(3,35),math.random(2,5))
			elseif(player.armorColor==65) then
				player.registry["elixircolor"]=65
				player:warp(2081,math.random(3,35),math.random(49,52))
			end
		end
	end

}

hid2100395 = {
	open=function(player)
		if(player.side==2) then
    	        	if(player.registry["carnagehost"]>0) then		
                		local obj=getObject(2100,39,6)
				if(obj==340) then
					setObject(2100,39,6,360)
					setObject(2100,40,6,361)
					player:sendMinitext("Opened.")
					return
				elseif(obj==360) then
					setObject(2100,39,6,340)
					setObject(2100,40,6,341)
					player:sendMinitext("Closed.")
					return
				end
                	else
                     		player:sendMinitext("You are not a carnage host.")
                	end
		end
	end

}

hid2100405 = {
	open=function(player)
		if(player.side==2) then
    	        	if(player.registry["carnagehost"]>0) then		
                		local obj=getObject(2100,40,6)
				if(obj==341) then
					setObject(2100,39,6,360)
					setObject(2100,40,6,361)
					player:sendMinitext("Opened.")
					return
				elseif(obj==361) then
					setObject(2100,39,6,340)
					setObject(2100,40,6,341)
					player:sendMinitext("Closed.")
					return
				end
                	else
                     		player:sendMinitext("You are not a carnage host.")
                	end
		end
	end

}