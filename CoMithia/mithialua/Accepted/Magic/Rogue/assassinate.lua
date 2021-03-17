assassinate = {
cast = function(player)
	local mobTarget = getTargetFacing(player, BL_MOB)
	local pcTarget = getTargetFacing(player, BL_PC)
	local aether = 40000
	local damage = ((player.health * 1.8) + (player.magic * .5))
	local threat
	local healthCost = ((player.health * 2) / 3)
	local magicCost = (player.magic / 3)
	local minHealth = 100
	local minMagic = 500
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health < minHealth or player.health - healthCost <= 0) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (mobTarget == nil and pcTarget == nil) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	player:sendAction(1, 20)
	player:setAether("assassinate", aether)
	player:sendMinitext("You cast Assassinate.")
	player:playSound(36)
		
	if (mobTarget ~= nil) then
		player.health = player.health - healthCost
		player.magic = player.magic - magicCost
		player:sendStatus()
		mobTarget.attacker = player.ID
		threat = mobTarget:removeHealthExtend(damage, 1, 1, 1, 1, 2)
		player:addThreat(mobTarget.ID, threat)
		
		if (#player.group > 1) then
			mobTarget:setGrpDmg(player.ID, threat)
		else
			mobTarget:setIndDmg(player.ID, threat)
		end
		
		mobTarget:sendAnimation(287, 0)
		mobTarget:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	elseif (pcTarget ~= nil) then
		pcTarget:sendAnimation(287, 0)
		
		if (player:canPK(pcTarget)) then
			player.health = player.health - healthCost
			player.magic = player.magic - magicCost
			player:sendStatus()
			pcTarget.attacker = player.ID
			pcTarget:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		end
	end
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {}
	return level, items, itemAmounts, description
end
}