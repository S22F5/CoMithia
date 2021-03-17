grizz = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	if (mob.registry["grizz_channeling"] > os.time()) then
		mob:sendAction(2, 80)
		mob:addHealthExtend((mob.maxHealth * .02), 0, 0, 0, 0, 0)
		return
	end
	
	if (mob.registry["grizz_fury"] < os.time()) then
		mob.registry["grizz_channeling"] = os.time() + 2
		mob.registry["grizz_fury"] = os.time() + 9
		grizz_fury.cast(mob)
		return
	end
	
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	if (mob.registry["grizz_channeling"] > os.time()) then
		mob:sendAction(2, 80)
		mob:addHealthExtend((mob.maxHealth * .02), 0, 0, 0, 0, 0)
		return
	end
	
	if (mob.registry["grizz_fury"] < os.time()) then
		mob.registry["grizz_channeling"] = os.time() + 2
		mob.registry["grizz_fury"] = os.time() + 9
		grizz_fury.cast(mob)
		return
	end
	
	mob_ai_basic.attack(mob, target)
end,

after_death = function(mob)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	
	for i = 1, #mobBlocks do
		local chance = math.random(100000)
		
		if (mobBlocks[i].owner ~= mob.owner and chance <= 65000) then
			if (not mobBlocks[i]:hasDuration("grizzle_fear_debuff")) then
				mobBlocks[i].ac = mobBlocks[i].ac + 10
			end
			
			if (mobBlocks[i]:getDuration("grizzle_fear_debuff") < 12000) then
				mobBlocks[i]:setDuration("grizzle_fear_debuff", 12000, 0, 1)
			end
			
			if (not mobBlocks[i]:hasDuration("grizzle_fear_paralyze")) then
				mobBlocks[i].paralyze = true
				mobBlocks[i]:setDuration("grizzle_fear_paralyze", 1000)
			end
		end
		
		if (mobBlocks[i].owner ~= mob.owner and chance > 65000 and chance <= 80000) then
			if (not mobBlocks[i]:hasDuration("grizzle_fear_debuff")) then
				mobBlocks[i].ac = mobBlocks[i].ac + 10
			end
			
			if (mobBlocks[i]:getDuration("grizzle_fear_debuff") < 12000) then
				mobBlocks[i]:setDuration("grizzle_fear_debuff", 12000, 0, 1)
			end
		end
		
		if (mobBlocks[i].owner ~= mob.owner and chance > 80000) then
			if (not mobBlocks[i]:hasDuration("grizzle_fear_paralyze")) then
				mobBlocks[i].paralyze = true
				mobBlocks[i]:setDuration("grizzle_fear_paralyze", 1000)
			end
		end
	end
	
	for i = 1, #pcBlocks do
		local chance = math.random(100000)
		
		if (chance <= 65000) then
			if (pcBlocks[i]:getDuration("grizzle_fear_debuff") < 12000) then
				pcBlocks[i]:setDuration("grizzle_fear_debuff", 12000, 0, 1)
			end
			
			if (not pcBlocks[i]:hasDuration("grizzle_fear_paralyze")) then
				pcBlocks[i]:setDuration("grizzle_fear_paralyze", 1000)
			end
		end
		
		if (chance > 65000 and chance <= 80000) then
			if (pcBlocks[i]:getDuration("grizzle_fear_debuff") < 12000) then
				pcBlocks[i]:setDuration("grizzle_fear_debuff", 12000, 0, 1)
			end
		end
		
		if (chance > 80000) then
			if (not pcBlocks[i]:hasDuration("grizzle_fear_paralyze")) then
				pcBlocks[i]:setDuration("grizzle_fear_paralyze", 1000)
			end
		end
		
		pcBlocks[i]:calcStat()
	end
end
}

grizz_fury = {
on_hit_while_cast = function(mob, target)
	target:sendAnimation(31, 1)
end,

cast = function(mob)
	mob:changeAttack(-750)
	mob:setDuration("grizz_fury", 5000)
end,

uncast = function(mob)
	mob:changeAttack(750)
end
}