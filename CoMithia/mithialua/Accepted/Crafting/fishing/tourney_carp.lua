tourney_carp = {

	move = function(mob, target)
		local itemsUnderMe = { }
		if (math.random(0,5) == 0) then
			if(math.random(0,1) == 0) then
				if(mob.side == 0) then
					mob.side = 3
				else
					mob.side = mob.side - 1
				end
			else
				if(mob.side == 3) then
					mob.side = 0
				else
					mob.side = mob.side + 1
				end
			end
		end
	
		mob:sendSide()
		
		if (math.random(0,2) == 0) then
			mob:move()
		end
		
	end,
	
	click = function(player, mob)
		mob:talk(2,""..mob.registry["size"])
	end,
	
	on_spawn = function(mob)
		local fishSize = 0
		fishSize = lake_carp.normalize(350,100)
		mob.registry["size"] = fishSize		
		
		if (mob.m == 7104) then
		repeat
			local newX = math.random(0,24)
			local newY = math.random(0,24)
			local passCheck = getPass(mob.m, newX, newY)
			local tileCheck = getTile(mob.m, newX, newY)
			local npcCheck = mob:getObjectsInCell(mob.m, newX, newY, BL_MOB)		
			
			if(passCheck == 0 and #npcCheck == 0 and (tileCheck == 30565 or tileCheck == 30566)) then
				mob:warp(mob.m, newX, newY)
				hasMoved = true
			end
		until hasMoved
	end	
	end,
	
	normalize = function(average, std)
		local a = math.random()
		local b = math.random()
		local c = math.sqrt(math.abs(-2*math.log(a)*math.cos(2*3.14159*b)))
		if(math.random(0,1) == 1) then
			return average + c * std
		else
			return average - c * std
		end
	end,
	
	click = function(player, mob)
		mob:talk(2,""..mob.registry["size"])
	end
}