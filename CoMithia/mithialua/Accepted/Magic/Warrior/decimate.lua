decimate = {
cast = function(player)
	local mobBlocks = player:getObjectsInArea(BL_MOB)
	local pcBlocks = player:getObjectsInArea(BL_PC)
	local aether = 18000
	local targets = {}
	local damage = (player.health * .55)
	local threat
	local healthCost = (player.health * .5)
	local magicCost = (player.maxMagic * .05)
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health - healthCost <= 0) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(1, 20)
	player:setAether("decimate", aether)
	player:playSound(84)
	player:sendAnimation(119, 0)
	player:sendMinitext("You cast Decimate.")
	
	for i = 1, #mobBlocks do
		if (distanceSquare(player, mobBlocks[i], 1) and mobBlocks[i].ID ~= player.ID) then
			table.insert(targets, mobBlocks[i])
		end
	end
	
	for i = 1, #pcBlocks do
		if (distanceSquare(player, pcBlocks[i], 1) and pcBlocks[i].ID ~= player.ID) then
			table.insert(targets, pcBlocks[i])
		end
	end
	
	if (#targets > 0) then
		player.health = player.health - healthCost
		player.magic = player.magic - magicCost
		player:sendStatus()
		
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
				targets[i]:sendMinitext(player.name.." decimates you.")
			end
		end
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"A moderate attack that consumes power to strike foes around the warrior"}
	return level, items, itemAmounts, description
end
}