lake_carp = {

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

	on_spawn = function(mob)
		local fishSize = 0
		fishSize = lake_carp.normalize(33,7)
		mob.registry["size"] = fishSize		
	end,
	
	normalize = function(average, std)
		local a = math.random()
		local b = math.random()
		return average + (math.sqrt(-2*math.log(a)*math.cos(2*3.14159*b)) * std)
	end,
	
	click = function(player, mob)
		mob:talk(2,""..mob.registry["size"])
	end
}