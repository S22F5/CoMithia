lucky_coin = {
cast = function(player)
	local aether = 120000
	local magicCost = (player.magic * .2)
	local minMagic = 100
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("lucky_coin", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:addNPC("lucky_coin", player.m, player.x, player.y, 0, 3600000, player.ID)
	player:sendMinitext("You cast Lucky Coin.")
	addSpotTrap(player, player.m, player.x, player.y)
end,

click = function(block, npc)
	local damage = (block.health * .2)
	local threat
	local owner = npc:getBlock(npc.owner)
	local chance = math.random(100000)
	
	if (math.random(100000) <= 90000) then
		if (block.blType == BL_MOB) then
			block:sendAnimation(16, 0)
			block.attacker = owner.ID
			threat = block:getHealthExtend(damage, 1, 1, 1, 1, 2)
			player:addThreat(block.ID, threat)
			
			if (#player.group > 1) then
				block:setGrpDmg(player.ID, threat)
			else
				block:setIndDmg(player.ID, threat)
			end
			
			block:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			block.magic = block.maxMagic
			removeTrap(npc)
		elseif (block.blType == BL_PC and (owner:canPK(block) or block.ID == owner.ID)) then
			block:sendAnimation(16, 0)
			block.attacker = owner.ID
			block:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			block.magic = block.maxMagic
			block:sendMinitext("You found a lucky coin.")
			removeTrap(npc)
		end
	else
		removeTrap(npc)
	end
end,

endAction = function(npc, owner)
	removeTrap(npc)
end,

requirements = function(player)
	local level = 28
	local items = {}
	local itemAmounts = {}
	local description = {"A trap that forces a target to convert their life to mana"}
	
	return level, items, itemAmounts, description
end
}