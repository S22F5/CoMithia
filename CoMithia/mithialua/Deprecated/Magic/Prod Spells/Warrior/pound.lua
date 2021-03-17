pound = {
cast = function(player)
	local mobTargets = {}
	local pcTargets = {}
	local aether = 15000
	local duration = 3000
	local damage = (player.health * .1)
	local threat
	local healthCost = (player.health * .05)
	local magicCost = 100
	local minHealth = 100
	
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
	player:setAether("pound", aether)
	player:sendMinitext("You cast Pound.")
	player:playSound(10)
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
			
			if (i == 2 and not mobTargets[i]:hasDuration("pound") and not mobTargets[i]:hasDuration("slam") and not mobTargets[i]:hasDuration("concussive_blow")) then
				mobTargets[i]:setDuration("pound", duration)
				mobTargets[i].snare = true
			end
			
			mobTargets[i]:sendAnimation(300, 0)
			mobTargets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		elseif (pcTargets[i] ~= nil) then
			pcTargets[i]:sendAnimation(300, 0)
			
			if (player:canPK(pcTargets[i])) then
				if (i == 2 and not pcTargets[i]:hasDuration("pound") and not pcTargets[i]:hasDuration("slam") and not pcTargets[i]:hasDuration("concussive_blow")) then
					pcTargets[i]:setDuration("pound", duration)
					pcTargets[i]:calcStat()
				end
				
				pcTargets[i].attacker = player.ID
				pcTargets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				pcTargets[i]:sendMinitext(player.name.." pounds you.")
			end
		else
			if (player.side == 0) then
				if (i == 1) then
					player:sendAnimationXY(300, player.x, player.y - 1, 0)
				elseif (i == 2) then
					player:sendAnimationXY(300, player.x - 1, player.y - 1, 0)
				elseif (i == 3) then
					player:sendAnimationXY(300, player.x + 1, player.y - 1, 0)
				end
			elseif (player.side == 1) then
				if (i == 1) then
					player:sendAnimationXY(300, player.x + 1, player.y, 0)
				elseif (i == 2) then
					player:sendAnimationXY(300, player.x + 1, player.y - 1, 0)
				elseif (i == 3) then
					player:sendAnimationXY(300, player.x + 1, player.y + 1, 0)
				end
			elseif (player.side == 2) then
				if (i == 1) then
					player:sendAnimationXY(300, player.x, player.y + 1, 0)
				elseif (i == 2) then
					player:sendAnimationXY(300, player.x - 1, player.y + 1, 0)
				elseif (i == 3) then
					player:sendAnimationXY(300, player.x + 1, player.y + 1, 0)
				end
			elseif (player.side == 3) then
				if (i == 1) then
					player:sendAnimationXY(300, player.x - 1, player.y, 0)
				elseif (i == 2) then
					player:sendAnimationXY(300, player.x - 1, player.y - 1, 0)
				elseif (i == 3) then
					player:sendAnimationXY(300, player.x - 1, player.y + 1, 0)
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
	local level = 10
	local items = {}
	local itemAmounts = {}
	local description = {"A weak attack that targets three foes"}
	return level, items, itemAmounts, description
end
}