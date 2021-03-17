grizzle = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

on_spawn = function(mob)
	for i = 57, 68 do
		broadcast(i, "You hear a faint roar from a distant cave.")
	end
	
	for i = 69, 71 do
		broadcast(i, "You hear a loud roar from a nearby passage.")
	end
	
	for i = 81, 83 do
		broadcast(i, "You hear a loud roar from a nearby passage.")
	end
end,

move = function(mob, target)
	local mobBlocks = mob:getObjectsInSameMap(BL_MOB)
	local pcBlocks = mob:getObjectsInSameMap(BL_PC)
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		mob.paralyzed = false
		mob.sleep = 1
	end
	
	
	if (#pcBlocks == 0) then	
		mob.health = mob.maxHealth
		
		if (#mobBlocks > 0) then
			for i = 1, #mobBlocks do
				if (mobBlocks[i].ID ~= mob.ID) then
					mobBlocks[i].health = 1
					mobBlocks[i]:removeHealthExtend(1, 0, 0, 0, 0, 0)
				end
			end
		end
	end
	
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	local players = #mob:getObjectsInArea(BL_PC)
	local summons = ((players * 2) + 3)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	local bears = 0

	if (mob.paralyzed or mob.sleep ~= 1) then
		mob.paralyzed = false
		mob.sleep = 1
	end
	
	if (mob.health / mob.maxHealth <= .9 and mob.registry["grizzle_phase"] == 0) then
		grizzle_fear.cast(mob)
		mob.registry["grizzle_phase"] = 1
		return
	elseif (mob.health / mob.maxHealth <= .75 and mob.registry["grizzle_phase"] == 1) then
		grizzle_fear.cast(mob)
		mob.registry["grizzle_phase"] = 2
		return
	elseif (mob.health / mob.maxHealth <= .6 and mob.registry["grizzle_phase"] == 2) then
		grizzle_fear.cast(mob)
		mob.registry["grizzle_phase"] = 3
		return
	elseif (mob.health / mob.maxHealth <= .5 and mob.registry["grizzle_phase"] == 3) then
		grizzle_fear.cast(mob)
		mob.registry["grizzle_phase"] = 4
		return
	elseif (mob.health / mob.maxHealth <= .4 and mob.registry["grizzle_phase"] == 4) then
		grizzle_fear.cast(mob)
		mob.registry["grizzle_phase"] = 5
		return
	elseif (mob.health / mob.maxHealth <= .3 and mob.registry["grizzle_phase"] == 5) then
		grizzle_fear.cast(mob)
		mob.registry["grizzle_phase"] = 6
		return
	elseif (mob.health / mob.maxHealth <= .2 and mob.registry["grizzle_phase"] == 6) then
		grizzle_fear.cast(mob)
		mob.registry["grizzle_phase"] = 7
		return
	elseif (mob.health / mob.maxHealth <= .15 and mob.registry["grizzle_phase"] == 7) then
		grizzle_fear.cast(mob)
		mob.registry["grizzle_phase"] = 8
		return
	elseif (mob.health / mob.maxHealth <= .1 and mob.registry["grizzle_phase"] == 8) then
		grizzle_fear.cast(mob)
		mob.registry["grizzle_phase"] = 9
		return
	end
	
	if (#mobBlocks > 0) then
		for i = 1, #mobBlocks do
			if (mobBlocks[i].mobID == 62 or mobBlocks[i].mobID == 64) then
				bears = bears + 1
			end
		end
	end
	
	if (bears < summons and mob.registry["grizzle_summon"] <= os.time()) then
		mob.registry["grizzle_summon"] = os.time() + 3
		grizzle.summon(mob)
		return
	end
	
	if (bears >= (summons - 3) and mob.registry["grizzle_swipe"] <= os.time()) then
		mob.registry["grizzle_swipe"] = os.time() + 12
		grizzle.swipe(mob, target)
		
		if (target.state ~= 1 and bears < summons) then
			grizzle.summon(mob)
		end
		
		return
	end
	
	mob_ai_basic.attack(mob, target)
end,

after_death = function(mob)
	mob.registry["grizzle_phase"] = 0
	mob.registry["grizzle_summon"] = 0
	mob.registry["grizzle_swipe"] = 0
	grizzle_fear.cast(mob)
end,

swipe = function(mob, target)
	local addedHealth = target.maxHealth - target.baseHealth
	if (addedHealth <= 0) then
		addedHealth = 1
	end
	local missingHealth = target.maxHealth - target.health
	local baseDamage = 100
	local damage = (baseDamage + (0.05 * baseDamage * (missingHealth / addedHealth)))
	
	mob:sendAction(1, 80)
	target:sendAnimation(32, 1)
	target.attacker = mob.ID
	target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
end,

summon = function(mob)
	local summons = math.random(2,3)
	local mobBlocks
	
	for i = 1, summons do
		if (math.random(2) == 1) then
			mob:spawn(62, math.random(2, 15), math.random(4, 13), 1)
		else
			mob:spawn(64, math.random(2, 15), math.random(4, 13), 1)
		end
	end
	
	mobBlocks = mob:getObjectsInSameMap(BL_MOB)
	
	for i = 1, #mobBlocks do
		if ((mobBlocks[i].mobID == 62 or mobBlocks[i].mobID == 64) and mobBlocks[i].owner == 0) then
			mobBlocks[i].owner = mob.ID
		end
	end
end
}

grizzle_fear = {
cast = function(mob)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	
	mob:sendAction(2, 80)
	--mob:playSound()
	
	for i = 1, #mobBlocks do
		if (mobBlocks[i].owner ~= mob.ID) then
			if (not mobBlocks[i]:hasDuration("grizzle_fear_paralyze")) then
				mobBlocks[i].paralyze = true
				mobBlocks[i]:setDuration("grizzle_fear_paralyze", 2000)
			end
			
			if (not mobBlocks[i]:hasDuration("grizzle_fear_debuff")) then
				mobBlocks[i].ac = mobBlocks[i].armor - (10 * armorPerAC)
			end
			
			if (mobBlocks[i]:getDuration("grizzle_fear_debuff") < 6000) then
				mobBlocks[i]:setDuration("grizzle_fear_debuff", (math.random(6, 8) * 1000), 0, 1)
			end
		end
	end
	
	for i = 1, #pcBlocks do
		if (not pcBlocks[i]:hasDuration("grizzle_fear_paralyze")) then
			pcBlocks[i]:setDuration("grizzle_fear_paralyze", 2000)
		end
		
		if (pcBlocks[i]:getDuration("grizzle_fear_debuff") < 6000) then
			pcBlocks[i]:setDuration("grizzle_fear_debuff", (math.random(6, 8) * 1000), 0, 1)
		end
		
		pcBlocks[i]:calcStat()
	end
end
}

grizzle_fear_paralyze = {
recast = function(block)
	block.paralyze = true
end,

uncast = function(block)
	if (block.blType == BL_PC) then
		block:calcStat()
	else
		block.paralyze = false
	end
end
}

grizzle_fear_debuff = {
recast = function(block)
	block.armor = block.armor - (10 * armorPerAC)
end,

uncast = function(block)
	if (block.blType == BL_PC) then
		block:calcStat()
	else
		block.armor = block.armor + (10 * armorPerAC)
	end
end,
}