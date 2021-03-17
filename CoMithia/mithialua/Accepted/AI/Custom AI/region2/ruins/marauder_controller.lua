marauder_controller = {	
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob)
	local mobBlocks = mob:getObjectsInSameMap(BL_MOB)
	local ownedMobs = 0
	local maxOwnedMobs = 5
	
	if (#mobBlocks > 0) then
		for i = 1, #mobBlocks do
			if (mobBlocks[i].owner == mob.ID) then
				ownedMobs = ownedMobs + 1
			end
		end
	end
	
	if (ownedMobs < maxOwnedMobs) then
		for i = 1, 3 do
			local spawnMob = 123 + math.random(0, 3)
			local spawnedMob
			local x
			local y
			
			repeat
				x = mob.x + math.random(0, 5)
				y = mob.y + math.random(0, 5)
			until ((x > 0 or y > 0) and getPass(mob.m, x, y) == 0)
			
			spawnedMob = mob:spawn(spawnMob, x, y, 1)[1]
			spawnedMob.owner = mob.ID
		end
	end
end
}