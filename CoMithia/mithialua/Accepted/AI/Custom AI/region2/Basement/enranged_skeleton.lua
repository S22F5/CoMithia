enraged_skeleton = {

on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

after_death = function(mob, block)

end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	mob_ai_basic.attack(mob, target)
	
	if(math.random(0,4) == 0) then
		--mob:sendAnimation(134) Received Complaints
		local pcBlocks = mob:getObjectsInArea(BL_PC)
		
		if (#pcBlocks > 0) then
			for i = 1, #pcBlocks do
				if (pcBlocks[i].state ~= 1) then
					if(math.random(0, 2) == 0) then
						pcBlocks[i]:sendAnimation(148)
						pcBlocks[i]:removeHealth(math.random(150, 200))
						player:playSound(44)
					end
				end
			end
		end
	end
end
}