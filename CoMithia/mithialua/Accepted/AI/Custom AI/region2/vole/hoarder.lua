hoarder = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	local pcMapBlocks = mob:getObjectsInSameMap(BL_PC)
	local moved = false
	local oldside = mob.side
	local checkmove = math.random(0,10)

	if (mob.paralyzed or mob.sleep ~= 1 or mob.snare) then
		mob.paralyzed = false
		mob.sleep = 1
		mob.snare = false
	end
	
	if (#pcMapBlocks == 0) then
		mob.health = mob.maxHealth
		mob.registry["trapped"] = 0
		mob.registry["moves"] = 0
		return
	end
	
	if (mob.health / mob.maxHealth <= .25) then
		if (mob.target > 0 and mob.owner == 0 or mob.owner > 1073741823) then
			threat.calcHighestThreat(mob)
			
			local block = mob:getBlock(mob.target)
			
			if (block ~= nil) then
				target = block
			end
		end
	
		if (target ~= nil) then
			if(checkmove >= 4) then
				mob.side = math.random(0, 3)
				mob:sendSide()
				
				if (mob.side == oldside) then
					moved = RunAway(mob, target)
				end
				
				if (not moved) then
					mob.moveTime = 0
					mob.registry["trapped"] = 1
					mob.state = MOB_HIT
					hoarder.attack(mob, target)
				end
			else
				moved = RunAway(mob, target)
				
				if (not moved) then
					mob.moveTime = 0
					mob.registry["trapped"] = 1
					mob.state = MOB_HIT
					hoarder.attack(mob, target)
				end
			end
		end
	else
		if (target ~= nil) then
			if (mob.registry["moves"] >= 4 and target.m == mob.m) then
				mob:warp(target.m, target.x, target.y)
			end
		end
		
		mob_ai_basic.move(mob, target)
		mob.registry["moves"] = mob.registry["moves"] + 1
	end
end,

attack = function(mob, target)
	if (mob.moveTime ~= mob.baseMove) then
		mob.state = MOB_ALIVE
		hoarder.move(mob, target)
	end
	
	if (mob.paralyzed or mob.sleep ~= 1 or mob.snare) then
		mob.paralyzed = false
		mob.sleep = 1
		mob.snare = false
	end
	
	if (mob.health / mob.maxHealth > .25 or mob.registry["trapped"] == 1) then
		mob_ai_basic.attack(mob, target)
	else
		mob:changeMove(-1500)
		mob.state = MOB_ALIVE
		hoarder.move(mob, target)
	end
end,

after_death = function(mob, target)
	mob.registry["moves"] = 0
	mob.registry["trapped"] = 0
end
}