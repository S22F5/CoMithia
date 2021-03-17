grizzle_jr = {
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
	local chance = math.random(100000)
	local bossChance = math.random(100000)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	local boss = nil
	local lowest = nil
	
	for i = 1, #mobBlocks do
		if (mobBlocks[i].mobID == 65) then
			boss = mobBlocks[i]
			break
		end
	end
	
	for i = 1, #mobBlocks do
		if (lowest == nil and (mobBlocks[i].owner == mob.owner or mobBlocks[i].ID == mob.owner)) then
			lowest = mobBlocks[i]
		elseif ((mobBlocks[i].owner == mob.owner or  mobBlocks[i].ID == mob.owner)
		and mobBlocks[i].health / mobBlocks[i].maxHealth < lowest.health / lowest.maxHealth) then
			lowest = mobBlocks[i]
		end
	end
	
	if (chance <= 30000) then
		if (boss ~= nil and boss.health / boss.maxHealth < .5) then
			if (bossChance <= 50000) then
				grizzle_jr.heal(mob, boss)
			else
				grizzle_jr.heal(mob, lowest)
			end
		else
			grizzle_jr.heal(mob, lowest)
		end
		
		mob:sendAction(2, 80)
		return
	else
		mob_ai_basic.attack(mob, target)
	end
end,

after_death = function(mob)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	local pcBlocks = mob:getObjectsInArea(BL_PC)
	
	for i = 1, #mobBlocks do
		local chance = math.random(100000)
		
		if (mobBlocks[i].owner ~= mob.owner and chance <= 75000) then
			if (not mobBlocks[i]:hasDuration("grizzle_fear_debuff")) then
				mobBlocks[i].ac = mobBlocks[i].ac + 10
			end
			
			if (mobBlocks[i]:getDuration("grizzle_fear_debuff") < 12000) then
				mobBlocks[i]:setDuration("grizzle_fear_debuff", 12000, 0, 1)
			end
		end
		
		if (mobBlocks[i].owner ~= mob.owner and chance > 75000) then
			if (not mobBlocks[i]:hasDuration("grizzle_fear_paralyze")) then
				mobBlocks[i].paralyze = true
				mobBlocks[i]:setDuration("grizzle_fear_paralyze", 1000)
			end
		end
	end
	
	for i = 1, #pcBlocks do
		local chance = math.random(100000)
		
		if (chance <= 75000) then
			if (pcBlocks[i]:getDuration("grizzle_fear_debuff") < 12000) then
				pcBlocks[i]:setDuration("grizzle_fear_debuff", 12000, 0, 1)
			end
		end
		
		if (chance > 75000) then
			if (not pcBlocks[i]:hasDuration("grizzle_fear_paralyze")) then
				pcBlocks[i]:setDuration("grizzle_fear_paralyze", 1000)
			end
		end
		
		pcBlocks[i]:calcStat()
	end
end,

heal = function(mob, target)
	if (target ~= nil) then
		local missingHealth = ((target.maxHealth - target.health) / target.maxHealth)
		local currentHealth = (target.health / target.maxHealth)
		local baseHeal = 100
		local heal = 0
		
		if (missingHealth > currentHealth) then
			heal = (baseHeal + (baseHeal * currentHealth))
		else
			heal = (baseHeal + (baseHeal * missingHealth))
		end
		
		if (target.health ~= target.maxHealth) then
			target:addHealthExtend(heal, 2, 0, 0, 0, 0)
		end
	end
end
}