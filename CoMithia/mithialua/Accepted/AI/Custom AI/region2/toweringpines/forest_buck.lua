forest_buck = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (target == nil and #mobBlocks > 0) then
		for i = 1, #mobBlocks do
			if ((mobBlocks[i].mobID == 74 or mobBlocks[i].mobID == 75) and mobBlocks[i].attacker > 0 and distance(mob, mobBlocks[i]) <= 8) then
				mob.target = mobBlocks[i].attacker
				target = mob:getBlock(mob.target)
				forest_buck_buff.cast(mob)
				break
			end
		end
	end
	
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	local chance = math.random(100000)
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (chance <= 20000 or mob:hasDuration("forest_buck_buff")) then
		forest_buck.push(mob, target)
	else
		mob_ai_basic.attack(mob, target)
	end
end,

push = function(mob, target)
	local moved
	
	if (target ~= nil) then
		moved = FindCoords(mob, target)
		
		if (moved and mob.target ~= mob.owner) then
			mob:attack(target.ID)
			mob:playSound(30)
			canPush(mob, target)
			mob:flushDuration(7012)
		end
	end
end
}

forest_buck_buff = {
cast = function(mob)
	mob:setDuration("forest_buck_buff", 60000)
	mob:changeMove(-500)
end,

uncast = function(mob)
	mob:changeMove(500)
end
}