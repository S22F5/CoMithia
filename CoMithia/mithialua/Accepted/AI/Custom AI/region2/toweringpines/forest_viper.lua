forest_viper = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	local chance
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (target.protection >= 13) then
		chance = 0
	else
		chance = (((13 - target.protection) / 20) * 100)
	end
	
	if (chance > math.random(100) and mob.registry["forest_viper_venom_aether"] < os.time()) then
		forest_viper_venom.cast(mob, target)
		mob.registry["forest_viper_venom_aether"] = os.time() + 2
	else
		mob_ai_basic.attack(mob, target)
	end
end,

after_death = function(mob)
	local chance = math.random(100000)
	
	if (chance <= 5000) then
		mob:spawn(73, mob.x, mob.y, 1)
	end
end
}

forest_viper_venom = {
cast = function(mob, target)
	mob:sendAction(0, 80)

	if (target.blType == BL_MOB) then
		player:setDuration("forest_viper_venom", 5000)
		target.paralyzed = true
	elseif (target.blType == BL_PC) then
		if (not target:hasDuration("forest_viper_venom")) then--slow
			target:setDuration("forest_viper_venom", 12000)
			target.registry["forest_viper_venom_state"] = 1
		elseif (target:hasDuration("forest_viper_venom") and target.registry["forest_viper_venom_state"] < 2) then--snare
			target:flushDurationNoUncast(7014)
			target:setDuration("forest_viper_venom", 6000)
			target.registry["forest_viper_venom_state"] = 2
		elseif (target:hasDuration("forest_viper_venom") and target.registry["forest_viper_venom_state"] < 3) then--paraylze
			target:flushDurationNoUncast(7014)
			target:setDuration("forest_viper_venom", 3000)
			target.registry["forest_viper_venom_state"] = 3
		end
		
		target:calcStat()
	end
end,

while_cast = function(block)
	block:sendAnimation(144, 0)
end,

recast = function(block)
	if (block.blType == BL_PC) then
		if (block.registry["forest_viper_venom_state"] == 4) then
			block.drunk = 255
		elseif (block.registry["forest_viper_venom_state"] == 3) then
			block.paralyzed = true
		elseif (block.registry["forest_viper_venom_state"] == 2) then
			block.snare = true
		elseif (block.registry["forest_viper_venom_state"] == 1) then
			block.speed = block.speed + 50
		end
	end
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block.paralyzed = false
	elseif (block.blType == BL_PC) then
		if (block.registry["forest_viper_venom_state"] == 3) then
			block:setDuration("forest_viper_venom", 1000)
			block.registry["forest_viper_venom_state"] = 4--<3
		else
			block.registry["forest_viper_venom_state"] = 0
		end
		
		block:calcStat()
	end
end
}