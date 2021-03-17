pack_leader = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	local chance = math.random(100000)
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (chance <= 5000 and #mobBlocks > 0) then
		mob:sendAction(1, 80)
		mob:playSound(360)
		mob:playSound(360)
		target:sendAnimation(248, 1)
		
		for i = 1, #mobBlocks do
			if ((mobBlocks[i].mobID == 81 or mobBlocks[i].mobID == 82 or mobBlocks[i].mobID == 83 or mobBlocks[i].mobID == 84)
			and mobBlocks[i].target == 0 and distance(mob, mobBlocks[i]) <= 12) then
				target:addThreat(mobBlocks[i].ID, 50)
			end
		end
	else
		mob_ai_basic.attack(mob, target)
	end
end
}