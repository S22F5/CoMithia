incinerate = {
cast = function(player, target)
	local mobBlocks = target:getObjectsInArea(BL_MOB)
	local pcBlocks = target:getObjectsInArea(BL_PC)
	local targets = {}
	local damage = ((.9 * player.magic) * 1.3)
	local threat
	local magicCost = (.9 * player.magic)
	local minMagic = 500
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	for i = 1, #mobBlocks do
		if (distanceSquare(target, mobBlocks[i], 1) and mobBlocks[i].ID ~= target.ID and mobBlocks.state ~= 1) then
			table.insert(targets, mobBlocks[i])
		end
	end
	
	for i = 1, #pcBlocks do
		if (distanceSquare(target, pcBlocks[i], 1) and pcBlocks[i].ID ~= target.ID and pcBlocks[i].state ~= 1 and player:canPK(pcBlocks[i])) then
			table.insert(targets, pcBlocks[i])
		end
	end
	
	if (target.blType == BL_MOB) then
		player:sendAction(6, 20)
		player:setAether("incinerate", 55000)
		player:playSound(68)
		target:sendAnimation(195, 1)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Incinerate.")
		target.attacker = player.ID
		threat = target:removeHealthExtend(damage, 1, 1, 1, 1, 2)
		player:addThreat(target.ID, threat)
		
		if (#player.group > 1) then
			target:setGrpDmg(player.ID, threat)
		else
			target:setIndDmg(player.ID, threat)
		end
		
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	elseif (target.blType == BL_PC and (player:canPK(target) or #targets > 0)) then
		player:sendAction(6, 20)
		player:setAether("incinerate", 55000)
		player:playSound(68)
		target:sendAnimation(195, 1)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Incinerate.")
		
		if (player:canPK(target)) then
			target.attacker = player.ID
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			target:sendMinitext(player.name.." incinerates you.")
		end
	end
	
	if (#targets > 0) then
		for i = 1, #targets do
			if (targets[i] ~= nil and targets[i].blType == BL_MOB) then
				targets[i].attacker = player.ID
				threat = targets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
				player:addThreat(targets[i].ID, threat)
				
				if (#player.group > 1) then
					targets[i]:setGrpDmg(player.ID, threat)
				else
					targets[i]:setIndDmg(player.ID, threat)
				end
				
				targets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			elseif (targets[i] ~= nil and targets[i].blType == BL_PC and player:canPK(targets[i])) then
				targets[i].attacker = player.ID
				targets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			end
		end
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Very strong elemental attack that scales"}
	return level, items, itemAmounts, description
end
}