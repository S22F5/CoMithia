time_storm = {
cast = function(player, target)
	local mobBlocks = target:getObjectsInArea(BL_MOB)
	local pcBlocks = target:getObjectsInArea(BL_PC)
	local duration = 8000
	local aether = 85000
	local damage = (player.magic * 1.3) * (1 + target.registry["stormDebuff"..player.ID] / 10)
	local threat
	local magicCost = (player.magic * .8)
	local minMagic = 1000
	local targets = {}
	local targetsLeft = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_MOB)
	local targetsRight = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_MOB)
	local targetsUp = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_MOB)
	local targetsDown = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_MOB)
	
	if (#targetsLeft == 0) then
		targetsLeft = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_PC)
	end
	
	if (#targetsLeft == 0) then
		targetsRight = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_PC)
	end
	
	if (#targetsLeft == 0) then
		targetsUp = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_PC)
	end
	
	if (#targetsLeft == 0) then
		targetsDown = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_PC)
	end
	
	if (#targetsLeft > 0) then
		table.insert(targets, targetsLeft[1])
	end
	
	if (#targetsRight > 0) then
		table.insert(targets, targetsRight[1])
	end
	
	if (#targetsUp > 0) then
		table.insert(targets, targetsUp[1])
	end
	
	if (#targetsDown > 0) then
		table.insert(targets, targetsDown[1])
	end
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (not target:hasDurationID("time_storm", player.ID)) then
		player:sendAction(6, 20)
		target:sendAnimation(212, 0)
		player:sendMinitext("You prepared the Storm.")
		target:setDuration("time_storm", duration, player.ID)
	else
		if (target.blType == BL_MOB) then
			player.magic = player.magic - magicCost
			player:sendStatus()
			player:sendAction(6, 20)
			player:setAether("time_storm", aether)
			player:sendMinitext("You released the Time Storm.")
			player:playSound(85)
			target:sendAnimation(221, 0)
			target.attacker = player.ID
			threat = target:removeHealthExtend(damage, 1, 1, 1, 1, 2)
			player:addThreat(target.ID, threat)
			
			if (#player.group > 1) then
				target:setGrpDmg(player.ID, threat)
			else
				target:setIndDmg(player.ID, threat)
			end
			
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			
			if (#targets > 0) then
				for i = 1, #targets do
					targets[i].attacker = player.ID
					threat = targets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
					player:addThreat(targets[i].ID, threat)
					
					if (#player.group > 1) then
						targets[i]:setGrpDmg(player.ID, threat)
					else
						targets[i]:setIndDmg(player.ID, threat)
					end			
					
					targets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				end
			end
		elseif (target.blType == BL_PC and (player:canPK(target) or #targets > 0)) then
			player.magic = player.magic - magicCost
			player:sendStatus()
			player:sendAction(6, 20)
			player:setAether("time_storm", aether)
			player:sendMinitext("You released the Time Storm.")
			player:playSound(85)
			target:sendAnimation(221, 0)
			
			if (player:canPK(target)) then
				target.attacker = player.ID
				target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				target:sendMinitext(player.name.." is storming time for you.")
			end
			
			if (#targets > 0) then
				for i = 1, #targets do
					if (player:canPK(targets[i])) then
						targets[i].attacker = player.ID
						threat = targets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
						player:addThreat(targets[i].ID, threat)
						
						if (#player.group > 1) then
							targets[i]:setGrpDmg(player.ID, threat)
						else
							targets[i]:setIndDmg(player.ID, threat)
						end			
						
						targets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
					end
				end
			end
		end
	end
end,

while_cast = function(block, caster)
	block:sendAnimation(22, 0)
	block.registry["stormDebuff"..caster.ID] = block.registry["stormDebuff"..caster.ID] + 1
end,

uncast = function(block, caster)
	block.registry["stormDebuff"..caster.ID] = 0
end,

requirements = function(player)
	local level = 31
	local items = {}
	local itemAmounts = {}
	local description = {"A scaling attack that relies on precise timing to deal a range of damage."}
	
	return level, items, itemAmounts, description
end
}