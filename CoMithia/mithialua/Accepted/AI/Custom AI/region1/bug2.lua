bug2 = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

-- Default Mob template, Refers to mob_ai_basic main functions

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,
	
	
move = function(mob, target)
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	mob_ai_basic.attack(mob, target)
end,

-- 5% Chance to spawn a 8 on death if less than two 7s and no 8s are still alive
	
after_death = function(mob, block)

	local rand1 = math.random(5)
	
	if (rand1 == 1) then
		local mobCount = 0
		local mobCheck = {}
		
		mobCheck = mob:getObjectsInSameMap(BL_MOB)
		
		-- Checks alive mobs on the map. Kills the script if 8 is alive.
		
		for i = 1, #mobCheck do
		
			if (mobCheck[i].mobID == 7) then
				mobCount = mobCount + 1
			elseif (mobCheck[i].mobID == 8) then
				return
			end
			
		end
		
		-- Spawn trigger
		
		if (mobCount < 2) then
			if (block.blType == BL_PC) then
				block:sendMinitext("You hear something digging out of the ground.")
			end
			local rand2 = math.random(4) 
			
			if (rand2 == 1) then
				mob:sendAnimation(40)
				mob:spawn(8, mob.x, mob.y, 1)
			end
		end
	end
end

}
