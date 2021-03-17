alpha_wolf = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	local mobBlocks = mob:getObjectsInSameMap(BL_MOB)
	local pcTargets = mob:getObjectsInSameMap(BL_PC)
	local deadCount = 0
	local aether = 15
	
	if (#pcTargets == 0) then
		mob.health = mob.maxHealth
		mob.registry["alpha_wolf_blood_aether"] = os.time() + aether
		
		if (mob.registry["enrage"] == 1) then
			mob.newAttack = mob.baseAttack
			mob.minDam = mob.minDam / 2
			mob.maxDam = mob.maxDam / 2
			mob.registry["enrage"] = 0
		end
		
		if (#mobBlocks > 0) then
			for i = 1, #mobBlocks do
				if (mobBlocks[i].ID ~= mob.ID) then
					mobBlocks[i].health = 1
					mobBlocks[i]:removeHealthExtend(1, 0, 0, 0, 0, 0)
				end
			end
		end
	else
		for i = 1, #pcTargets do
			if (pcTargets[i].state == 1 or pcTargets[i].gmLevel > 0) then
				deadCount = deadCount + 1
			end
		end
		
		if (deadCount >= #pcTargets) then
			mob.health = mob.maxHealth
			mob.registry["alpha_wolf_blood_aether"] = os.time() + aether
			
			if (mob.registry["enrage"] == 1) then
				mob.newAttack = mob.baseAttack
				mob.minDam = mob.minDam / 2
				mob.maxDam = mob.maxDam / 2
				mob.registry["enrage"] = 0
			end
			
			if (#mobBlocks > 0) then
				for i = 1, #mobBlocks do
					if (mobBlocks[i].ID ~= mob.ID) then
						mobBlocks[i].health = 1
						mobBlocks[i]:removeHealthExtend(1, 0, 0, 0, 0, 0)
					end
				end
			end
			
			return
		end
		
		if (mob.paralyzed or mob.sleep ~= 1 or mob.snare) then
			mob.paralyzed = false
			mob.snare = false
			mob.sleep = 1
		end
		
		if (mob.health / mob.maxHealth <= .25 and mob.registry["enrage"] == 0) then
			mob:changeAttack(-(mob.baseAttack / 2))
			mob.minDam = mob.minDam * 2
			mob.maxDam = mob.maxDam * 2
			mob.registry["enrage"] = 1
		end
		
		if (mob.registry["alpha_wolf_blood_aether"] <= os.time()) then
			alpha_wolf_blood.cast(mob, pcTargets[math.random(#pcTargets)])
			mob.registry["alpha_wolf_blood_aether"] = os.time() + aether
		end
		
		mob_ai_basic.move(mob, target)
	end
end,

attack = function(mob, target)
	local pcTargets = mob:getObjectsInSameMap(BL_PC)
	local aether = 15
	
	if (mob.paralyzed or mob.sleep ~= 1 or mob.snare) then
		mob.paralyzed = false
		mob.snare = false
		mob.sleep = 1
	end
	
	if (mob.health / mob.maxHealth <= .25 and mob.registry["enrage"] == 0) then
		mob:changeAttack(-(mob.baseAttack / 2))
		mob.minDam = mob.minDam * 2
		mob.maxDam = mob.maxDam * 2
		mob.registry["enrage"] = 1
	end
	
	if (mob.registry["alpha_wolf_blood_aether"] <= os.time()) then
		alpha_wolf_blood.cast(mob, pcTargets[math.random(#pcTargets)])
		mob.registry["alpha_wolf_blood_aether"] = os.time() + aether
	end
	
	mob_ai_basic.attack(mob, target)
end,

after_death = function(mob, block)
	if (block.blType == BL_MOB) then
		local owner = mob:getBlock(block.owner)
		
		for i = 1, #owner.group do
			if (Player(owner.group[i]).quest["r2_c_alchemist_wolf"] == 3 and Player(owner.group[i]):hasItem(5, 1) ~= true and Player(owner.group[i]).m == mob.m) then
				Player(owner.group[i]):addItem(5, 1)
			end
		end
	elseif (block.blType == BL_PC) then
		for i = 1, #block.group do
			if (Player(block.group[i]).quest["r2_c_alchemist_wolf"] == 3 and Player(block.group[i]):hasItem(5, 1) ~= true and Player(block.group[i]).m == mob.m) then
				Player(block.group[i]):addItem(5, 1)
			end
		end
	end
end
}

alpha_wolf_blood = {
cast = function(mob, target)
	local mobBlock
	
	if (not target:hasDuration("alpha_wolf_blood") and target.state ~= 1 and target.gmLevel == 0) then
		target:setDuration("alpha_wolf_blood", 18000)
		target:spawn(102, target.x, target.y, 1)
		mobBlock = mob:getObjectsInCell(target.m, target.x, target.y, BL_MOB)[1]
		target:calcStat()
		alpha_wolf_blood.setMobStats(mobBlock, target)
	end
end,

while_cast_250 = function(block)
	block:calcStat()
end,

recast = function(block)
	if (block.state ~= -1) then
		block.state = -1
	end
	
	block.gfxClone = 1
	block.gfxName = ""
	block.paralyzed = true
	block:removeSprite()
	block:updateState()
end,

uncast = function(block)
	if (block.state ~= 0) then
		block.state = 0
	end
	
	block.gfxClone = 0
	block.paralyzed = false
	block:calcStat()
	block:updateState()
end,

setMobStats = function(mob, player)
	local damage = swingDamage(player, nil, 1)
	
	mob.newMove = 400
	mob.newAttack = ((player.attackSpeed / 50) * 1000)
	mob.ac = player.ac - 25
	mob.maxHealth = ((player.maxHealth * 1.35) + (.5 * player.maxMagic))
	mob.health = mob.maxHealth
	mob.hit = player.hit + 3
	mob.might = player.might + 10
	mob.grace = player.grace + 3
	mob.will = player.will + 2
	mob.pierce = player.pierce
	mob.miss = player.miss
	mob.minDam = (damage - (damage / 1.5))
	mob.maxDam = (damage + (damage / 1.5))
	mob.registry["alpha_wolf_blood_standin"] = player.ID
end
}