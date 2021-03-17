gollum = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

on_spawn = function(mob)
	for i = 69, 71 do
		broadcast(i, "You feel the ground quake in a nearby passage.")
	end
	
	for i = 81, 83 do
		broadcast(i, "You feel the ground quake in a nearby passage.")
	end
end,

move = function(mob, target)
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	local moved = false
	
	if (not canMove(mob)) then
		gollum.earth_wave(mob)
	else
		if (distance(mob, target) < 3) then
			RunAway(mob, target)
		elseif (distance(mob, target) > 6) then
			FindCoords(mob, target)
		else
			if (#pcBlocks > 0) then
				for i = 1, #pcBlocks do
					if (distance(mob, pcBlocks[i]) < 3) then
						RunAway(mob, pcBlocks[i])
						moved = true
						break
					end
				end
			end
			
			if (#mobBlocks > 0 and not moved) then
				for i = 1, #mobBlocks do
					if (distance(mob, mobBlocks[i]) < 3 and mobBlocks[i].owner > 0 and mobBlocks[i].owner < 1073741823) then
						RunAway(mob, mobBlocks[i])
						break
					end
				end
			end
		end
	end
	
	if (distance(mob, target) <= 10 and mob.m == target.m) then
		gollum.earth_stomp(mob, target)
	end
	
	if (distance(mob, target) <= 6 and mob.registry["gollum_throw_stone_aether"] < os.time() and checkProtection(target, 50, 75, 100) and mob.m == target.m) then
		gollum.throw_stone(mob, target)
	end
	
	if (distance(mob, target) <= 10 and mob.registry["gollum_stone_connection_aether"] < os.time() and checkProtection(target, 35, 60, 100) and target.state ~= 1 and mob.m == target.m) then
		gollum_stone_connection.cast(mob, target)
	end
end,

attack = function(mob, target)
	mob.state = MOB_ALIVE
	gollum.move(mob, target)
end,

after_death = function(mob)
	mob.registry["gollum_throw_stone_aether"] = 0
	mob.registry["gollum_stone_connection_aether"] = 0
end,

earth_wave = function(mob)
	local pcTargetsAround = getTargetsAround(mob, BL_PC)
	local mobTargetsAround = getTargetsAround(mob, BL_MOB)
	local damage = 750
	local heal = 1250
	
	mob:sendAction(2, 80)
	mob:sendAnimation(418, 0)
	fourPush(mob, BL_PC)
	fourPush(mob, BL_MOB)
	
	if (mob.health ~= mob.maxHealth) then
		mob:addHealth(heal)
	end
	
	if (#pcTargetsAround > 0) then
		for i = 1, #pcTargetsAround do
			if (pcTargetsAround[i].state ~= 1) then
				pcTargetsAround[i].attacker = mob.ID
				pcTargetsAround[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			end
		end
	end
	
	if (#mobTargetsAround > 0) then
		for i = 1, #mobTargetsAround do
			mobTargetsAround[i].attacker = mob.ID
			mobTargetsAround[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		end
	end
	
	if (not mob:hasDuration("gollum_buff")) then
		gollum_buff.cast(mob)
	end	
end,

earth_stomp = function(mob, target)
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	local damage = 150
	
	target:sendAnimation(138, 0)
	target.attacker = mob.ID
	target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	
	if (#pcBlocks > 0) then
		for i = 1, #pcBlocks do
			if (distance(mob, pcBlocks[i]) <= 10 and checkProtection(pcBlocks[i], 5, 30, 100) > math.random(100000) and pcBlocks[i].state ~= 1 and pcBlocks[i].m == mob.m) then
				pcBlocks[i]:sendAnimation(138, 0)
				pcBlocks[i].attacker = mob.ID
				pcBlocks[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			end
		end
	end
end,

throw_stone = function(mob, target)
	local pcBlocks = target:getObjectsInArea(BL_PC)
	local damage = 1500
	
	target:sendAnimation(202, 0)
	target.attacker = mob.ID
	target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	mob.registry["gollum_throw_stone_aether"] = os.time() + 24
	
	if (#pcBlocks > 0) then
		for i = 1, #pcBlocks do
			if ((pcBlocks[i].x == mob.x and (pcBlocks[i].y == mob.y - 1 or pcBlocks[i].y == mob.y + 1))
			or (pcBlocks[i].y == mob.y and (pcBlocks[i].x == mob.x - 1 or pcBlocks[i].x == mob.x + 1))
			or ((pcBlocks[i].x == mob.x - 1 or pcBlocks[i].x == mob.x + 1) and (pcBlocks[i].y == mob.y - 1 or pcBlocks[i].y == mob.y + 1))
			and pcBlocks[i].state ~= 1) then
				table.insert(stoneTargets, pcBlocks[i])
			end
		end
					
		if (#stoneTargets > 0) then
			for i = 1, #stoneTargets do
				stoneTargets[i].attacker = mob.ID
				stoneTargets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			end
		end
	end
end
}

gollum_buff = {
cast = function(mob)
	mob:setDuration("gollum_buff", 6000)
	mob.ac = mob.ac - 25
end,

uncast = function(mob)
	mob.ac = mob.ac + 25
end
}

gollum_stone_connection = {
cast = function(mob, target)
	local damage = 450
	local heal = target:removeHealthExtend(damage, 1, 1, 1, 1, 2)
	
	mob.registry["gollum_stone_connection_aether"] = os.time() + 16
	mob:sendAnimation(380, 0)
	target:sendAnimation(380, 0)
	target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	
	if (mob.health ~= mob.maxHealth) then
		mob:addHealth(heal)
	end
	
	if (not target:hasDuration("gollum_stone_connection")) then
		target:setDuration("gollum_stone_connection", 3000)
		target.snare = true
	end
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block.snare = false
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end
}