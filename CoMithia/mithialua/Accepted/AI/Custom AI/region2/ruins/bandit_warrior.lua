bandit_warrior = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

after_death = function(mob, block)
	mob:sendAnimationXY(103,mob.x,mob.y,1)
	mob:playSound(7)
	
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	if(#mobBlocks == 0) then
		if(mob.m == 200) then
			if(math.random(1,2) == 1) then
				r2_newruins_1stdoor.openDoor()
			else
				r2_newruins_2nddoor.openDoor()
			end
		elseif(mob.m == 202) then
			r2_newruins_3rddoor.openDoor()
		elseif(mob.m == 201) then
			r2_newruins_4thdoor.openDoor()
		elseif(mob.m == 205) then
			r2_newruins_5thdoor.openDoor()
		end
		
	end
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
	mob:flank()
end
}