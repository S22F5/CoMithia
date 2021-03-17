sub_dweller = {

on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

after_death = function(mob, block)
	local spawn = { }
	mob:sendAnimationXY(149,mob.x,mob.y,1)
	mob:playSound(7)
	if(math.random(0,4) == 0) then
		mob:spawn(120,mob.x,mob.y,1)
	else
		mob:spawn(121,mob.x,mob.y,1)	
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
	if(mob.health < (mob.baseHealth / 3) and math.random(3) == 1) then
		local damage
		if (math.random(100000) >= 33000) then
			damage = (mob.baseHealth * 0.03) + (mob.health / 10)
			if (damage < 500) then
				damage = 500
			end
			mob:playSound(112)
		else--CRIT
			damage = (mob.baseHealth * 0.15) + (mob.health / 10)
			if (damage < 1500) then
				damage = 1500
			end
			mob:playSound(113)
		end
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		mob:sendAction(3,60)
		target:sendAnimation(69)
	end
end
}