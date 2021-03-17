pitfall = {
cast = function(player)
	local aether = 25000
	local magicCost = 800
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("pitfall", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:addNPC("pitfall", player.m, player.x, player.y, 0, 3600000, player.ID)
	player:sendMinitext("You cast Pitfall.")
	addSpotTrap(player, player.m, player.x, player.y)
end,

click = function(block, npc)
	local damage = 1
	local acDuration = 20000
	local sleepDuration = 10000
	local owner = npc:getBlock(npc.owner)
	
	if (block:hasDuration("pitfall_ac") or block:hasDuration("pitfall_sleep")) then
		return
	end
	
	if (block.blType == BL_MOB) then
		block:sendAnimation(2, 0)
		block.attacker = owner.ID
		block:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		block:setDuration("pitfall_ac", acDuration)
		block:setDuration("pitfall_sleep", sleepDuration)
		block:calcStat()
		removeTrap(npc)
	elseif (block.blType == BL_PC and owner:canPK(block)) then
		if (block.state == 1) then
			return
		end
		block:sendAnimation(2, 0)
		block.attacker = owner.ID
		block:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		block:setDuration("pitfall_ac", acDuration)
		block:setDuration("pitfall_sleep", sleepDuration)
		block:calcStat()
		block:sendMinitext("You've stumbled into a pitfall.")
		removeTrap(npc)
	end
end,

endAction = function(npc)
	removeTrap(npc)
end,

requirements = function(player)
	local level = 34
	local items = {}
	local itemAmounts = {}
	local description = {"Strong trap that sleeps and weakens the target"}
	
	return level, items, itemAmounts, description
end
}

pitfall_ac = {
while_cast = function(block)
	if (block.blType == BL_MOB and block.charState ~= 2) then
		block:sendAnimation(34, 0)
	elseif (block.blType == BL_PC and block.state ~= 2) then	
		block:sendAnimation(34, 0)
	end
end,

recast = function(block)
	block.armor = block.armor * .6
end,

uncast = function(block)
	block:calcStat()
end
}

pitfall_sleep = {
while_cast = function(block)
	if (block.sleep == 1) then
		block:setDuration("pitfall_sleep", 0)
	else
		block:sendAnimation(2, 0)
	end
end,

recast = function(player)
	player.sleep = player.sleep + .3
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		if (block.sleep - .3 < 1) then
			block.sleep = 1
		else
			block.sleep = block.sleep - .3
		end
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end
}