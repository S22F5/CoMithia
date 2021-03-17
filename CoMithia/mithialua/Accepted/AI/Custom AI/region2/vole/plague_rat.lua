plague_rat = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, target)
	mob_ai_basic.on_attacked(mob, target)
end,
	
move = function(mob, target)
	mob_ai_basic.move(mob, target)	
end,

attack = function(mob, target)
	local moved
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if(target) then
		threat.calcHighestThreat(mob)
		local block = mob:getBlock(mob.target)
		if (block ~= nil) then
			target = block
		end
		moved=FindCoords(mob,target)
		if(moved and mob.target ~= mob.owner) then
			--We are right next to them, so attack!
			mob:attack(target.ID)
			if (math.random(0,1000) <= 300) and (target:hasDuration("plague_rat_poison") == false) then
				target:setDuration("plague_rat_poison", 4000)
			end
		else
			mob.state = MOB_ALIVE
		end
	else
		mob.state = MOB_ALIVE
	end
end,

--[[after_death = function(mob, block)
	local mobTargets = mob:getObjectsInArea(BL_MOB)
	local pcTargets = mob:getObjectsInArea(BL_PC)
	local heal = math.random(7, 13)
	
	if (#pcTargets > 0) then
		for i = 1, #pcTargets do
			if (distance(mob, pcTargets[i]) <= 3) then
				plague_rat_explosion.cast(mob, pcTargets[i])
			end
		end
	end
	
	if (#mobTargets > 0) then
		for i = 1, #mobTargets do
			if (distance(mob, mobTargets[i]) <= 3) and (mobTargets[i].mobID >= 23) and (mobTargets[i].mobID <= 30) then
				mobTargets[i]:addHealthExtend(heal, 0, 0, 0, 0, 0)
			end
		end
	end

	for i = (mob.x - 3), (mob.x + 3) do
		for j = (mob.y - 3), (mob.y + 3) do
			if (distanceXY(mob, i, j) <= 3) then
				mob:sendAnimationXY(1, i, j)
			end
		end
	end
end]]--
}
