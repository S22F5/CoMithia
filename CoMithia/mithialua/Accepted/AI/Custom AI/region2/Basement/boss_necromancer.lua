boss_necromancer = {
on_spawn = function(mob)
	mob.registry["souls"] = 25
	mob.side = 2
	mob:sendSide()
	if (mob.m == 226) then
		for i = 138, 150 do
			if (i == 150) then
				i = 226
			end
			
			broadcast(i, "A dreadful presence overcomes you.")
		end
	end
end,

on_healed = function(mob, healer)
	if (healer.blType == BL_PC) then
		healer.damage = healer.damage / -2
		healer.damage = healer.damage + math.random((healer.damage / -10), (healer.damage / 10))
		boss_necromancer.on_attacked(mob, healer)
	end
	if (math.random(100) < 2) then
		mob.registry["souls"] = mob.registry["souls"] + 1
	end
	if (healer.damage < 0) then
		mob_ai_basic.on_healed(mob, healer)
	end
end,

after_death = function(mob, block)
	if (mob.registry["souls"] > 0) then
		local damage = 100
		damage = damage * (mob.registry["souls"] / 1.5)
		block.attacker = mob.ID
		block:removeHealthExtend(damage, 1, 0, 1, 1, 0)
		mob.registry["souls"] = mob.registry["souls"] - math.floor(mob.registry["souls"] / 2)
		local pcBlocks = mob:getObjectsInArea(BL_PC)
		if (#pcBlocks > 0) then
			damage = 60
			damage = damage * mob.registry["souls"]
			for i = 1, #pcBlocks do
				if (pcBlocks[i].state ~= 1) then
					pcBlocks[i].attacker = mob.ID
					pcBlocks[i]:removeHealthExtend(damage, 1, 0, 1, 1, 0)
				end
				pcBlocks[i]:sendAnimation(145)
				pcBlocks[i]:sendMinitext("Souls have been released on you.")
			end
		end
	end
	mob:sendAnimationXY(149, mob.x, mob.y, 1)
	mob:playSound(7)
end,

on_attacked = function(mob, attacker)
	local rand = math.random(7, 13)
	if (attacker.damage > (mob.baseHealth / rand)) then
		attacker.damage = mob.baseHealth / rand
	end
	
	if (mob.health <= (mob.baseHealth * 0.5) and math.random(100) < 25) then
		boss_necromancer.drain(mob)
	end
	
	if (math.random(100) < 35) then
		if (mob.registry["soul_aether"] <= os.time()) then
			mob.registry["souls"] = mob.registry["souls"] + math.random(1, 3)
			if (math.random(100) < 25) then
				mob.registry["souls"] = mob.registry["souls"] + math.random(1, 3)
			end
			mob.registry["soul_aether"] = os.time() + 2
		end
	end
	if (mob.registry["souls"] > 0 and math.random(100) < 12) then
		if (math.random(100) < 65) then
			necromancer_necrosis.cast(mob, attacker)
		else
			necromancer_necrosis.cast(mob)
		end
		mob.registry["souls"] = mob.registry["souls"] - math.random(0, 1)
	end
	
	if (math.random(100) < 2) then
		necromancer_regen.cast(mob)
	end
	
	boss_necromancer.mass_glare(mob)
	
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	if (#pcBlocks > 0) then
		for i = 1, #pcBlocks do
			if (pcBlocks[i].deduction ~= 1 and distance(mob, pcBlocks[i]) < 16) then
				if (math.random(100) < 15) then
					if (pcBlocks[i]:hasDuration("necromancer_necrosis") == false) then
						pcBlocks[i]:setDuration("necromancer_necrosis", 3000)
						if (math.random(100) < 30) then
							break
						end
					end
				end
			end
		end
	end
	
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	if (mob.registry["souls"] < 100) then
		if (math.random(100) < 5 and mob.registry["soul_aether"] <= os.time()) then
			mob.registry["souls"] = mob.registry["souls"] + 1
			mob.registry["soul_aether"] = os.time() + 2
		end
	end
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	if (mob.paralyzed or mob.sleep ~= 1) then
		if (#pcBlocks > 0 and mob.registry["souls"] > 0) then
			boss_necromancer.poison(mob, pcBlocks[math.random(#pcBlocks)])
			mob.registry["souls"] = mob.registry["souls"] - 1
			mob.snare = true
		end
	else
		mob.snare = false
	end
	local target
	if (target == nil) then
		target = pcBlocks[math.random(#pcBlocks)]
	end
	if (target.m ~= mob.m or target == nil or target == 0 or target.state == 1) then
		target = pcBlocks[math.random(#pcBlocks)]
	end

	mob_ai_basic.move(mob, target)

	boss_necromancer.zap(mob, target)
	necromancer_necrosis.cast(mob, target)
	necromancer_curse.cast(mob, target)
	boss_necromancer.poison(mob, target)
	boss_necromancer.summon(mob)
	boss_necromancer.nuke(mob, target)
	boss_necromancer.glare(mob, target)
	necromancer_snare.cast(mob, target)
	
	if (math.random(100) < 10 and (mob.health + 1000 < mob.baseHealth)) then
		necromancer_regen.cast(mob)
	end
end,

attack = function(mob, target)
	if (mob.registry["souls"] < 100) then
		if (math.random(100) < 15 and mob.registry["soul_aether"] <= os.time()) then
			mob.registry["souls"] = mob.registry["souls"] + 1
			mob.registry["soul_aether"] = os.time() + 2
		end
	end
	
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	if (mob.paralyzed or mob.sleep ~= 1) then
		if (#pcBlocks > 0 and mob.registry["souls"] > 0) then
			boss_necromancer.poison(mob, pcBlocks[math.random(#pcBlocks)])
			mob.registry["souls"] = mob.registry["souls"] - 1
			mob.snare = true
		end
	else
		mob.snare = false
	end
	
	if (target.m ~= mob.m or target.state == 1) then
		local loop = 0
		repeat
		target = pcBlocks[math.random(#pcBlocks)]
		loop = loop + 1
		until target.state ~= 1 or loop > 50
	end
	--[[
	if (target:hasDuration("turtle_shell") == true) then
		if (math.random(100) < 10 and mob.registry["souls"] > 0) then
			target:setDuration("turtle_shell", 0)
			target:sendMinitext("A soul has broken your will.")
			target:sendAnimation(145)
			mob.registry["souls"] = mob.registry["souls"] - 1
		else
			boss_necromancer.glare(mob, target)
		end
	end]]--
	
	boss_necromancer.zap(mob, target)
	necromancer_necrosis.cast(mob, target)
	necromancer_curse.cast(mob, target)
	boss_necromancer.poison(mob, target)
	boss_necromancer.summon(mob)
	boss_necromancer.nuke(mob, target)
	boss_necromancer.glare(mob, target)
	necromancer_snare.cast(mob, target)

	if(mob.health < (mob.baseHealth * 0.7)) then
		necromancer_regen.cast(mob)
	end
	mob_ai_basic.attack(mob, target)
end,

drain = function(mob)
	if (mob.registry["drain"] > os.time()) then
		return
	end
	local mobBlocks = mob:getObjectsInSameMap(BL_MOB)
	
	for i = 1, #mobBlocks do
		if (mobBlocks[i].yname == "sub_warrior") then
			if ((mob.health + (mobBlocks[i].health * 1.2)) <= mob.baseHealth) then
				mob.attacker = mob.ID
				mob:addHealthExtend((mobBlocks[i].health * 1.2), 0, 0, 0, 0, 0)
			else
				mob.attacker = mob.ID
				mob:addHealthExtend((mob.baseHealth - mob.health), 0, 0, 0, 0, 0)
			end
			mob:sendAnimation(149)
			mob.registry["souls"] = mob.registry["souls"] + math.random(0, 2)
			mobBlocks[i]:sendAnimationXY(111, mobBlocks[i].x, mobBlocks[i].y)
			mobBlocks[i]:delete()
			break
		end
	end
	mob:sendAction(6, 40)
	mob.registry["souls"] = mob.registry["souls"] + math.random(0, 2)
	mob.registry["drain"] = os.time() + 4
end,

summon = function(mob)
	if (mob.registry["summon"] > os.time()) then
		return
	end
	
	if (mob.registry["souls"] <= 0) then
		return
	end
	
	local target
	local pcBlocks = mob:getObjectsInSameMap(BL_PC)
	local mobBlocks = mob:getObjectsInSameMap(BL_MOB)
	
	if ((#mobBlocks > math.random(10, 15) and math.random(100) < 25)
	or (#mobBlocks > math.random(18, 25) and math.random(100) < 50)
	or #mobBlocks > 40) then
		boss_necromancer.drain(mob)
		mob.registry["summon"] = os.time() + 4
		return
	end
	
	if (math.random(100) < 30) then
		target = mob
	else
		if (math.random(100) < 50) then
			target = mobBlocks[math.random(#mobBlocks)]
		else
			if (#pcBlocks > 0) then
				for i = 1, #pcBlocks do
					if (pcBlocks[i].state ~= 1) then
						if (math.random(100) < 70 and distance(pcBlocks[i], mob) < 18) then
							target = pcBlocks[i]
							break
						end
					end
				end
			end
		end
	end
	
	if (target == nil) then
		target = pcBlocks[math.random(#pcBlocks)]
	end
	
	local check = boss_necromancer.summon_check(target)
	if (check ~= false) then
		local ratio = ((mob.baseHealth - mob.health) / mob.baseHealth) + math.random(0, 1)
		mob:spawn(131, check[1], check[2], math.ceil(1 * ratio), mob.m)
		mob:sendAnimationXY(61, check[1], check[2])
		mob:sendAction(6, 40)
		mob.registry["souls"] = mob.registry["souls"] - 1
		if (math.random(100) < 60) then
			mob.registry["summon"] = os.time() + math.random(4, 5)
		end
		mob:playSound(20)
	end
end,

summon_check = function(target)
	local ret = false
	local m = target.m
	local x = target.x
	local y = target.y
	local sides = {0, 1, 2, 3}
	local rand
	
	repeat	
	rand = math.random(1, 4)
	if (sides[rand] == 0) then
		y = y - 1
	elseif (sides[rand] == 1) then
		x = x + 1
	elseif (sides[rand] == 2) then
		y = y + 1
	elseif (sides[rand] == 3) then
		x = x - 1
	end	
	until (x >= 0 and x <= target.xmax and y >= 0 and y <= target.ymax)
	
	local pcBlocks = target:getObjectsInCell(m, x, y, BL_PC)
	local mobBlocks = target:getObjectsInCell(m, x, y, BL_MOB)
	
	if (#pcBlocks == 0 and #mobBlocks == 0) then
		if (getObject(m, x, y) == 0 and getPass(m, x, y) == 0) then
			ret = {x, y}
		end
	end
	return ret
end,

zap = function(mob, target)
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	if (target == nil) then
		return
	end
	if (target.state == 1) then
		return
	end
	
	if (mob.registry["zap"] > os.time()) then
		return
	end
	
	local damage = math.random(75, 125) + math.random(75, 125)

	--[[
	if (target:hasDuration("turtle_shell") == true) then
		if (#pcBlocks > 0) then
			for i = 1, #pcBlocks do
				if (pcBlocks[i]:hasDuration("turtle_shell") == false and pcBlocks[i].state ~= 1) then
					target = pcBlocks[i]
					if (math.random(100) > 50) then
						break
					end
				end
			end
		end
	end]]--
	
	damage = damage + (target.baseHealth * 0.02)

	target.attacker = mob.ID
	if (target:removeHealthExtend(damage, 1, 1, 1, 1, 2) >= target.health) then
		target:sendAnimation(41)--kill and absorb
		target:sendAnimation(111)
		target.attacker = mob.ID
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		mob.registry["souls"] = mob.registry["souls"] + 10
	else
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		target:sendAnimation(17)
	end
	mob:sendAction(6, 40)
	mob.registry["zap"] = os.time() + 1
end,

poison = function(mob, target)
	if (target == nil) then
		return
	end
	if (target.state == 1) then
		return
	end
	if (mob.registry["poison"] > os.time()) then
		return
	end
	local damage = math.random(175, 325)
	damage = damage + target.baseHealth * 0.07
	damage = damage + target.health * 0.03
	--[[
	if (target:hasDuration("turtle_shell") == true or target.deduction == -1) then
		damage = damage / (math.random(25, 50) / 10)
	end]]--
	target.attacker = mob.ID
	target:removeHealthExtend(damage, 1, 0, 1, 1, 0)
	target:sendAnimation(84)
	if (target.blType == BL_PC) then
		target:sendMinitext("You feel the corrosion down to your soul.")
	end
	mob:playSound(13)
	mob:sendAction(6, 40)
	mob.registry["poison"] = os.time() + math.random(3, 5)
end,

glare = function(mob, target)
	if (target == nil) then
		return
	end
	if (target.state == 1) then
		return
	end
	if (mob.registry["glare"] > os.time()) then
		return
	end
	if (target.blType ~= BL_PC) then
		return
	end
	local damage = math.random(10, 150)
	damage = damage + math.floor(target.maxMagic * 0.015)
	damage = damage + math.ceil(target.magic * 0.0218)
	
	target:removeMagic(damage)
	target.attacker = mob.ID
	target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	target:sendAnimation(88)
	if (target.blType == BL_PC) then
		target:sendMinitext("Your will weakens as you stare into their eyes.")
	end
	mob:sendAction(6, 40)
	mob:playSound(86)
	mob.registry["glare"] = os.time() + 8
end,

mass_glare = function(mob)
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	if (mob.registry["mass_glare"] > os.time()) then
		return
	end

	if (#pcBlocks > 0) then
		for i = 1, #pcBlocks do
			if (distance(mob, pcBlocks[i]) < 12) then
				if (pcBlocks[i].blType ~= BL_PC or pcBlocks[i].state == 1) then
					--skip
				else
					local damage = math.random(100, 250)
					damage = damage + math.floor(pcBlocks[i].maxMagic * 0.035)
					damage = damage + math.ceil(pcBlocks[i].magic * 0.0418)
					damage = damage + math.ceil(pcBlocks[i].baseMagic * 0.05)
					
					pcBlocks[i]:removeMagic(damage)
					pcBlocks[i].attacker = mob.ID
					pcBlocks[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
					pcBlocks[i]:sendAnimation(88)
					pcBlocks[i]:playSound(86)
					if (pcBlocks[i].blType == BL_PC) then
						pcBlocks[i]:sendMinitext("Your will weakens as you stare into their eyes.")
					end
					mob:sendAction(6, 40)
					mob.registry["mass_glare"] = os.time() + 16
					mob.registry["glare"] = os.time() + 8
				end
			end
		end
	end
end,

nuke = function(mob, target)
	local pcBlocks = mob:getObjectsInSameMap(BL_PC)
	if (target == nil) then
		return
	end
	if (target.state == 1) then
		return
	end
	
	if (mob.registry["nuke"] > os.time()) then
		return
	end
	
	if (mob.registry["souls"] < 5) then
		return
	else
		mob.registry["souls"] = mob.registry["souls"] - 5
	end
	
	local damage = math.random(600, 675)
	--[[
	if (target:hasDuration("turtle_shell") == true) then
		if (#pcBlocks > 0) then
			for i = 1, #pcBlocks do
				if (pcBlocks[i]:hasDuration("turtle_shell") == false and pcBlocks[i].state ~= 1) then
					target = pcBlocks[i]
					if (math.random(100) > 50) then
						break
					end
				elseif (pcBlocks[i]:hasDuration("turtle_shell") == true) then
					pcBlocks[i]:setDuration("turtle_shell", 0)
					pcBlocks[i]:sendAnimation(145)
					pcBlocks[i]:sendMinitext("Spirits break your will.")
					pcBlocks[i]:msg(0, ""..mob.name..'" '.."That spell will not work against me!", pcBlocks[i].ID)
				end
			end
		end
	end]]--
	
	local missingHealth = target.baseHealth - target.health
	local damage2 = target.baseHealth * 0.25
	damage2 = (1 + (missingHealth / target.baseHealth)) * damage2
	damage = damage + damage2
	damage = damage + (target.baseHealth * 0.1) + (target.health * 0.05)
	
	target.attacker = mob.ID
	if (target:removeHealthExtend(damage, 1, 1, 1, 1, 2) >= target.health) then
		target:sendAnimation(149)--kill and absorb
		target:sendAnimation(111)
		target.attacker = mob.ID
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		mob.registry["souls"] = mob.registry["souls"] + 20
	else
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		target:sendAnimation(145)
	end
	if (target.blType == BL_PC) then
		target:sendMinitext("A dark soul comes from within.")
	end
	mob:sendAction(6, 60)
	mob:playSound(29)
	mob:playSound(118)
	mob.registry["nuke"] = os.time() + 26
end
}

necromancer_regen = {
cast = function(mob, target)
	if (mob.registry["necromancer_regen"] > os.time()) then
		return
	end
	if (target == nil) then
		target = mob
	end
	if (mob.registry["souls"] <= 0) then
		return
	end
	local duration = math.random(6, 12)
	duration = duration * 1000
	
	target:setDuration("necromancer_regen", duration)
	target:sendAnimation(172)
	mob.registry["souls"] = mob.registry["souls"] - math.random(0, 1)
	mob:sendAction(6, 40)
	mob.registry["necromancer_regen"] = os.time() + 8
end,

while_cast_250 = function(block)
	damage = math.random(125, 250) + math.random(125, 250)
	block.attacker = block.ID
	block:addHealthExtend(damage, 0, 0, 0, 0, 0)
	block:sendAnimation(172)
end
}
necromancer_curse = {
cast = function(mob, target)
	if (target == nil) then
		return
	end
	if (target.state == 1) then
		return
	end
	if (mob.registry["necromancer_curse"] > os.time()) then
		return
	end
	local duration = math.random(8, 16)
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	if (target:hasDuration("necromancer_curse") == true) then
		if (#pcBlocks > 0) then
			for i = 1, #pcBlocks do
				if (pcBlocks[i]:hasDuration("necromancer_curse") == false and pcBlocks[i].state ~= 1) then
					target = pcBlocks[i]
					if (math.random(100) < 30) then
						break
					end
				end
			end
		end
	end
	duration = duration * 1000
	target:setDuration("necromancer_curse", duration)
	target:sendAnimation(101)
	target:calcStat()
	if (target.blType == BL_PC) then
		target:sendMinitext("Your spirit has been cursed.")
	end
	
	mob:sendAction(6, 40)
	mob.registry["necromancer_curse"] = os.time() + math.random(1, 2)
end,

recast = function(block)
	block.armor = block.armor * 0.15
end,

while_cast = function(block)
	block:sendAnimation(34)
end,

uncast = function(block)
	block:calcStat()
end
}

necromancer_snare = {
cast = function(mob, target)
	if (target == nil) then
		return
	end
	if (target.state == 1) then
		return
	end
	if (mob.registry["necromancer_snare"] > os.time()) then
		return
	end
	local duration = math.random(10, 12)
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	if (target:hasDuration("necromancer_snare") == true) then
		if (#pcBlocks > 0) then
			for i = 1, #pcBlocks do
				if (pcBlocks[i]:hasDuration("necromancer_snare") == false and pcBlocks[i].state ~= 1) then
					target = pcBlocks[i]
					if (math.random(100) > 30) then
						break
					end
				end
			end
		end
	end
	duration = duration * 1000
	target:setDuration("necromancer_snare", duration)
	target:sendAnimation(141)
	target:calcStat()
	if (target.blType == BL_PC) then
		target:sendMinitext("You feel chains binding your very soul.")
	end
	
	mob:sendAction(6, 40)
	mob:playSound(33)
	mob.registry["necromancer_snare"] = os.time() + math.random(8, 12)
end,
recast = function(block)
	block.snare = true
end,
while_cast_250 = function(block)
	block:sendAnimation(141)
	block:removeHealth(math.random(1, 35))
end,
uncast = function(block)
	block:calcStat()
end
}

necromancer_necrosis = {
cast = function(mob, target)
	local duration = 8000
	if (target == nil) then
		return
	end
	if (target.state == 1) then
		return
	end	
	
	if (mob.registry["necromancer_necrosis"] > os.time()) then
		if (mob:hasDuration("necromancer_necrosis") == false) then
			mob:setDuration("necromancer_necrosis", 2000)
		end
		return
	end
	
	if (target == nil) then
		target = mob
	end
	
	if (target:hasDuration("necromancer_necrosis") == true) then
		local pcBlocks = mob:getObjectsInSameArea(BL_PC)
		if (#pcBlocks > 0) then
			for i = 1, #pcBlocks do
				if (pcBlocks[i]:hasDuration("necromancer_necrosis") == false and pcBlocks[i].state ~= 1) then
					if (math.random(100) > 7) then
						target = pcBlocks[i]
						break
					end
				end
			end
		end
	
		if (target:hasDurationID("necromancer_necrosis", mob.ID) == false) then
			target:setDuration("necromancer_necrosis", duration, mob.ID)
		end
		if (target:getDuration("necromancer_necrosis") < duration) then
			target:setDuration("necromancer_necrosis", duration)
		end
		return
	end
	
	target:setDuration("necromancer_necrosis", (duration * (math.random(10, 35) / 10)))
	
	mob:sendAction(6, 40)
	mob.registry["necromancer_necrosis"] = os.time() + 2
	if (target.blType == BL_PC) then
		target:sendMinitext("Your soul has been corrupted and it eats away your body.")
	end
	target:playSound(24)
	target:playSound(116)
end,

while_cast_250 = function(block, caster)
	if (caster ~= nil) then
		--block:talk(2, ""..caster.name) SOME ERROR HERE?
		if (block:hasDurationID("necromancer_necrosis", caster.ID) == false) then
			return
		end
		block.attacker = caster.ID
	else
		block.attacker = 1073743399
	end
	
	local damage = math.random(33, 58) + math.random(33, 58) + math.random(33, 58)
	if (block.blType == BL_PC) then
		damage = damage + (block.baseHealth * 0.01)
		--[[
		if (block:hasDuration("turtle_shell") == true) then
			damage = (block:removeHealthExtend(damage, 2, 0, 1, 1, 2) / (math.random(15, 25) / 10))
		end]]--
		if (block.attacker == 0) then
			block.attacker = 1073743399
		end
		
		block:removeHealthExtend(damage, 0, 0, 0, 0, 0)

	elseif (block.blType == BL_MOB) then
		damage = damage * (math.random(10, 35) / 10)
		if (block.attacker == 0) then
			block.attacker = 1073743399
		end
		
		block:addHealthExtend(damage, 0, 0, 0, 0, 0)
	end
	if (block.registry["necrosis_animation"] == 1) then
		block.registry["necrosis_animation"] = 0
	else
		block:sendAnimation(14)
		block.registry["necrosis_animation"] = 1
	end
end,


while_cast = function(block, caster)
	if (caster ~= nil) then
		block.attacker = caster.ID
	else
		block.attacker = 1073743399
	end
	
	local damage = math.random(125, 225)
	if (block.blType == BL_PC) then
		damage = damage + (block.baseHealth * 0.01)
		--[[
		if (block:hasDuration("turtle_shell") == true) then
			damage = (block:removeHealthExtend(damage, 2, 0, 1, 1, 2) / (math.random(15, 25) / 10))
		end]]--
		if (block.attacker == 0) then
			block.attacker = 1073743399
		end
		
		block:removeHealthExtend(damage, 0, 0, 0, 0, 0)

	elseif (block.blType == BL_MOB) then
		damage = damage * (math.random(10, 35) / 10)
		if (block.attacker == 0) then
			block.attacker = 1073743399
		end
		
		block:addHealthExtend(damage, 0, 0, 0, 0, 0)
	end
	block:sendAnimation(14)
	block:playSound(24)
	block:playSound(116)	
end,

uncast = function(block, caster)
	local damage = math.random(325, 750)
	if (block.blType == BL_PC) then
		if ((block.health / block.maxHealth) <= 0.15) then
			block.attacker = 1073743399
			
			damage = damage + block.health
			--[[
			if (block:hasDuration("turtle_shell") == true) then
				damage = (block:removeHealthExtend(damage, 2, 0, 1, 1, 2) / (math.random(15, 25) / 10))
			end]]--
			if (block.attacker == 0) then
				block.attacker = 1073743399
			end
			if (caster ~= nil) then
				caster.attacker = caster.ID
				caster:addHealthExtend(block.health * 1.25, 0, 0, 0, 0, 0)
				caster:sendAnimation(64)
			end
			
			damage = damage - (math.random(375, 750))
			block:removeHealthExtend(damage, 0, 0, 0, 0, 0)
			caster.registry["souls"] = mob.registry["souls"] + 10
			block:sendAnimation(111)
		end
		block.registry["necrosis_animation"] = 0
	end
end
}