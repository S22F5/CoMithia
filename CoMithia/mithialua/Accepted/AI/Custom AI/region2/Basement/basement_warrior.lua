sub_warrior = {

on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

after_death = function(mob, block)
	local spawn = { }
	mob:sendAnimationXY(149,mob.x,mob.y,1)
	mob:playSound(7)
	--[[
	if(math.random(0,4) == 0) then
		mob:spawn(120,mob.x,mob.y,1)
	else
		mob:spawn(121,mob.x,mob.y,1)	
	end
	]]--
end,

on_attacked = function(mob, attacker)
	if (attacker.damage > (mob.baseHealth / 15)) then
		attacker.damage = mob.baseHealth / 15
	end
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	if (target:hasDuration("turtle_shell") == true) then
		if (math.random(10) == 5 and mob.registry["shell_shatter"] < os.time()) then
			target:flushDuration(0, 417)
			target:sendAnimation(17)
			target:sendMinitext("They hit you so hard that your shell broke.")
			mob.registry["shell_shatter"] = os.time() + 2
		end
	end
	mob_ai_basic.attack(mob, target)
	mob:flank()
	if(mob.health < (mob.baseHealth/7)) then
		local damage = mob.health / 10
		if (damage < 10) then
			damage = 100
		end
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		mob:sendAction(3, 60)
		target:sendAnimation(69)
		mob:playSound(112)
	end
end
}