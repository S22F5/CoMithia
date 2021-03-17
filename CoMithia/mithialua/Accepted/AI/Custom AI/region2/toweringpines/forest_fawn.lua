forest_fawn = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	local moved = false
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (target ~= nil and #mobBlocks > 0) then
		for i = 1, #mobBlocks do
			if ((mobBlocks[i].mobID == 76 or mobBlocks[i].mobID == 77) and distance(mob, mobBlocks[i]) <= 12 and distance(mob, mobBlocks[i]) > 4) then
				FindCoords(mob, mobBlocks[i])
				moved = true
				break
			end
		end
	end
	
	if (moved == false) then
		mob_ai_basic.move(mob, target)
	end
end,

attack = function(mob, target)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	local moved = false
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (target ~= nil and #mobBlocks > 0) then
		for i = 1, #mobBlocks do
			if ((mobBlocks[i].mobID == 76 or mobBlocks[i].mobID == 77) and distance(mob, mobBlocks[i]) <= 12 and distance(mob, mobBlocks[i]) > 4) then
				FindCoords(mob, mobBlocks[i])
				moved = true
				break
			end
		end
	end
	
	if (moved == false) then
		mob_ai_basic.attack(mob, target)
	end
end
}