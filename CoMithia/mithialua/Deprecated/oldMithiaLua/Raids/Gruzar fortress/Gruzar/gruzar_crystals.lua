power_crystal_blue = {
	click = function(player,npc)

		local x=math.abs(player.x-npc.x)
		local y=math.abs(player.y-npc.y)

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		local check=player:getObjectsInCell(player.m,npc.x+5,npc.y,BL_MOB)
			if(#check>0) then
				if(check[1].name~="Gruzar, Lord of Darkness") then
					player:sendMinitext("The Power Crystal isn't active at the moment")
					return
				end
			else
				player:sendMinitext("The Power Crystal isn't active at the moment")
				return
			end
				
		if((x+y)>1) then
			player:sendMinitext("You are too far to activate this Power Crystal!")
			return
		end

		if(player.registry["gruzarpowercrystal"]>=os.time()) then
				player:sendMinitext("You may not activate any power Crystal for another "..player.registry["gruzarpowercrystal"]-os.time().." seconds!")
				return
		end

		player:broadcast(player.m,""..player.name.." starts focusing the power of the Blue Crystal!")
		player.paralyzed=true
		player.registry["gruzarpowercrystal"]=os.time()+45
		player:setDuration("blue_power_crystal",8000)
		
        end

}
power_crystal_red = {
	click = function(player,npc)

		local x=math.abs(player.x-npc.x)
		local y=math.abs(player.y-npc.y)

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		local check=player:getObjectsInCell(player.m,npc.x-5,npc.y,BL_MOB)
			if(#check>0) then
				if(check[1].name~="Gruzar, Lord of Darkness") then
					player:sendMinitext("The Power Crystal isn't active at the moment")
					return
				end
			else
				player:sendMinitext("The Power Crystal isn't active at the moment")
				return
			end

		if((x+y)>1) then
			player:sendMinitext("You are too far to activate this Power Crystal!")
			return
		end

		if(player.registry["gruzarpowercrystal"]>=os.time()) then
				player:sendMinitext("You may not activate any power Crystal for another "..player.registry["gruzarpowercrystal"]-os.time().." seconds!")
				return
		end

		player:broadcast(player.m,""..player.name.." starts focusing the power of the Red Crystal!")
		player.paralyzed=true
		player.registry["gruzarpowercrystal"]=os.time()+45
		player:setDuration("red_power_crystal",8000)
		
        end

}
power_crystal_green = {
	click = function(player,npc)

		local x=math.abs(player.x-npc.x)
		local y=math.abs(player.y-npc.y)

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		local check=player:getObjectsInCell(player.m,npc.x,npc.y+5,BL_MOB)
			if(#check>0) then
				if(check[1].name~="Gruzar, Lord of Darkness") then
					player:sendMinitext("The Power Crystal isn't active at the moment")
					return
				end
			else
				player:sendMinitext("The Power Crystal isn't active at the moment")
				return
			end

		if((x+y)>1) then
			player:sendMinitext("You are too far to activate this Power Crystal!")
			return
		end

		if(player.registry["gruzarpowercrystal"]>=os.time()) then
				player:sendMinitext("You may not activate any power Crystal for another "..player.registry["gruzarpowercrystal"]-os.time().." seconds!")
				return
		end

		player:broadcast(player.m,""..player.name.." starts focusing the power of the Green Crystal!")
		player.paralyzed=true
		player.registry["gruzarpowercrystal"]=os.time()+45
		player:setDuration("green_power_crystal",8000)
		
        end

}
power_crystal_yellow = {
	click = function(player,npc)

		local x=math.abs(player.x-npc.x)
		local y=math.abs(player.y-npc.y)

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end


		local check=player:getObjectsInCell(player.m,npc.x,npc.y-5,BL_MOB)
			if(#check>0) then
				if(check[1].name~="Gruzar, Lord of Darkness") then
					player:sendMinitext("The Power Crystal isn't active at the moment")
					return
				end
			else
				player:sendMinitext("The Power Crystal isn't active at the moment")
				return
			end

		if((x+y)>1) then
			player:sendMinitext("You are too far to activate this Power Crystal!")
			return
		end

		if(player.registry["gruzarpowercrystal"]>=os.time()) then
				player:sendMinitext("You may not activate any power Crystal for another "..player.registry["gruzarpowercrystal"]-os.time().." seconds!")
				return
		end

		player:broadcast(player.m,""..player.name.." starts focusing the power of the Yellow Crystal!")
		player.paralyzed=true
		player.registry["gruzarpowercrystal"]=os.time()+45
		player:setDuration("yellow_power_crystal",8000)
		
        end

}