wolf_pack = {
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
	
	if (target ~= nil and target.blType == BL_PC and target.state == 1) then
		target:setThreat(mob.ID, 0)
		mob.target = 0
		target = nil
	end
	
	if (target == nil and #mobBlocks > 0) then
		for i = 1, #mobBlocks do
			local mobBlockTarget = mob:getBlock(mobBlocks[i].target)
			
			if ((mobBlocks[i].mobID == 81 or mobBlocks[i].mobID == 82 or mobBlocks[i].mobID == 84) and distance(mob, mobBlocks[i]) <= 12
			and (mobBlockTarget == nil or (mobBlockTarget.blType == BL_PC and mobBlockTarget.state ~= 1) or (mobBlockTarget.blType == BL_MOB and mobBlockTarget.state ~= 1 and mobBlockTarget.mobID ~= 73))) then
				mob.target = mobBlocks[i].target
				target = mob:getBlock(mob.target)
			end
		end
	end
	
	if (target == nil and #mobBlocks > 0) then
		for i = 1, #mobBlocks do
			if (mobBlocks[i].mobID == 73 and mobBlocks[i].target == 0 and distance(mob, mobBlocks[i]) <= 4) then
				mob.target = mobBlocks[i].ID
				target = mob:getBlock(mob.target)
			end
		end
	end
	
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (target and target.blType == BL_MOB and target.mobID == 73) then
		mob:sendAction(1, 80)
		mob:playSound(95)
		target:removeHealth(target.health - 1)
		target:removeHealth(target.health)
	else
		mob_ai_basic.attack(mob, target)
	end
end
}