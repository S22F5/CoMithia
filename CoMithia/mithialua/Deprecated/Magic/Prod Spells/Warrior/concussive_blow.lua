concussive_blow = {
on_learn = function(player)
	if (player:hasSpell("pound")) then
		player:removeSpell("pound")
	end
	
	if (player:hasSpell("slam")) then
		player:removeSpell("slam")
	end
	
	player.registry["learned_pound"] = 1
	player.registry["learned_slam"] = 1
end,

cast = function(player)
	local mobTargets = {}
	local pcTargets = {}
	local aether = 15000
	local duration = 3000
	local damage = (player.health * .3)
	local threat
	local healthCost = (player.health * .15)
	local magicCost = 200
	local minHealth = 100
	local counter = false
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health < minHealth) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player.side == 0) then
		mobTargets = {player:getObjectsInCell(player.m, player.x, player.y - 1, BL_MOB)[1],
						player:getObjectsInCell(player.m, player.x - 1, player.y - 1, BL_MOB)[1],
						player:getObjectsInCell(player.m, player.x + 1, player.y - 1, BL_MOB)[1]}
		pcTargets = {player:getObjectsInCell(player.m, player.x, player.y - 1, BL_PC)[1],
						player:getObjectsInCell(player.m, player.x - 1, player.y - 1, BL_PC)[1],
						player:getObjectsInCell(player.m, player.x + 1, player.y - 1, BL_PC)[1]}
	elseif (player.side == 1) then
		mobTargets = {player:getObjectsInCell(player.m, player.x + 1, player.y, BL_MOB)[1],
						player:getObjectsInCell(player.m, player.x + 1, player.y - 1, BL_MOB)[1],
						player:getObjectsInCell(player.m, player.x + 1, player.y + 1, BL_MOB)[1]}
		pcTargets = {player:getObjectsInCell(player.m, player.x + 1, player.y, BL_PC)[1],
						player:getObjectsInCell(player.m, player.x + 1, player.y - 1, BL_PC)[1],
						player:getObjectsInCell(player.m, player.x + 1, player.y + 1, BL_PC)[1]}
	elseif (player.side == 2) then
		mobTargets = {player:getObjectsInCell(player.m, player.x, player.y + 1, BL_MOB)[1],
						player:getObjectsInCell(player.m, player.x - 1, player.y + 1, BL_MOB)[1],
						player:getObjectsInCell(player.m, player.x + 1, player.y + 1, BL_MOB)[1]}
		pcTargets = {player:getObjectsInCell(player.m, player.x, player.y + 1, BL_PC)[1],
						player:getObjectsInCell(player.m, player.x - 1, player.y + 1, BL_PC)[1],
						player:getObjectsInCell(player.m, player.x + 1, player.y + 1, BL_PC)[1]}
	elseif (player.side == 3) then
		mobTargets = {player:getObjectsInCell(player.m, player.x - 1, player.y, BL_MOB)[1],
						player:getObjectsInCell(player.m, player.x - 1, player.y - 1, BL_MOB)[1],
						player:getObjectsInCell(player.m, player.x - 1, player.y + 1, BL_MOB)[1]}
		pcTargets = {player:getObjectsInCell(player.m, player.x - 1, player.y, BL_PC)[1],
						player:getObjectsInCell(player.m, player.x - 1, player.y - 1, BL_PC)[1],
						player:getObjectsInCell(player.m, player.x - 1, player.y + 1, BL_PC)[1]}
	end
	
	player:sendAction(1, 20)
	player:setAether("concussive_blow", aether)
	player:sendMinitext("You cast Concussive Blow.")
	player:playSound(14)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	
	for i = 1, 3 do
		if (mobTargets[i] ~= nil) then
			mobTargets[i].attacker = player.ID
			threat = mobTargets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
			player:addThreat(mobTargets[i].ID, threat)
			
			if (#player.group > 1) then
				mobTargets[i]:setGrpDmg(player.ID, threat)
			else
				mobTargets[i]:setIndDmg(player.ID, threat)
			end
			
			if (i == 2 and not mobTargets[i]:hasDuration("concussive_blow")) then
				if (mobTargets[i]:hasDuration("pound")) then
					mobTargets[i]:setDuration("pound", 0)
				end
				
				if (mobTargets[i]:hasDuration("slam")) then
					mobTargets[i]:setDuration("slam", 0)
				end
				
				mobTargets[i]:setDuration("concussive_blow", duration)
				mobTargets[i].snare = true
			end
			
			mobTargets[i]:sendAnimation(424, 0)
			mobTargets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		elseif (pcTargets[i] ~= nil) then
			pcTargets[i]:sendAnimation(424, 0)
			
			if (player:canPK(pcTargets[i])) then
				if (i == 2 and not pcTargets[i]:hasDuration("concussive_blow")) then
					if (pcTargets[i]:hasDuration("pound")) then
						pcTargets[i]:setDuration("pound", 0)
					end
					
					if (pcTargets[i]:hasDuration("slam")) then
						pcTargets[i]:setDuration("slam", 0)
					end
					
					pcTargets[i]:setDuration("concussive_blow", duration)
					pcTargets[i]:calcStat()
				end
				
				pcTargets[i].attacker = player.ID
				pcTargets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				pcTargets[i]:sendMinitext(player.name.." strikes you with a concussive blow.")
			end
		else
			if (player.side == 0) then
				if (i == 1) then
					player:sendAnimationXY(424, player.x, player.y - 1, 0)
				elseif (i == 2) then
					player:sendAnimationXY(424, player.x - 1, player.y - 1, 0)
				elseif (i == 3) then
					player:sendAnimationXY(424, player.x + 1, player.y - 1, 0)
				end
			elseif (player.side == 1) then
				if (i == 1) then
					player:sendAnimationXY(424, player.x + 1, player.y, 0)
				elseif (i == 2) then
					player:sendAnimationXY(424, player.x + 1, player.y - 1, 0)
				elseif (i == 3) then
					player:sendAnimationXY(424, player.x + 1, player.y + 1, 0)
				end
			elseif (player.side == 2) then
				if (i == 1) then
					player:sendAnimationXY(424, player.x, player.y + 1, 0)
				elseif (i == 2) then
					player:sendAnimationXY(424, player.x - 1, player.y + 1, 0)
				elseif (i == 3) then
					player:sendAnimationXY(424, player.x + 1, player.y + 1, 0)
				end
			elseif (player.side == 3) then
				if (i == 1) then
					player:sendAnimationXY(424, player.x - 1, player.y, 0)
				elseif (i == 2) then
					player:sendAnimationXY(424, player.x - 1, player.y - 1, 0)
				elseif (i == 3) then
					player:sendAnimationXY(424, player.x - 1, player.y + 1, 0)
				end
			end
		end
	end
end,

recast = function(block)
	block.snare = true
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block.snare = false
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"A great attack that targets three foes"}
	return level, items, itemAmounts, description
end
}