guillotine = {
cast = function(player)
	local mobTarget = getTargetFacing(player, BL_MOB)
	local pcTarget = getTargetFacing(player, BL_PC)
	local aether = 35000
	local threat
	local damage = ((player.health * 1.6) + (player.magic * .5))
	local healthCost = (player.health * .7)
	local magicCost = (player.magic * .15)
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
	player:setAether("guillotine", aether)
	player:sendMinitext("You cast Guillotine.")
	player:playSound(85)
	
	if (mobTarget ~= nil) then
		player.health = player.health - healthCost
		player.magic = player.magic - magicCost
		player:sendStatus()
		mobTarget:sendAnimation(6, 0)
		mobTarget.attacker = player.ID
		threat = mobTarget:removeHealthExtend(damage, 1, 1, 1, 1, 2)
		player:addThreat(mobTarget.ID, threat)
		
		if (#player.group > 1) then
			mobTarget:setGrpDmg(player.ID, threat)
		else
			mobTarget:setIndDmg(player.ID, threat)
		end
		
		mobTarget:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	elseif (pcTarget ~= nil) then
		pcTarget:sendAnimation(6, 0)
		
		if (player:canPK(pcTarget)) then
			player.health = player.health - healthCost
			player.magic = player.magic - magicCost
			player:sendStatus()
			pcTarget.attacker = player.ID
			pcTarget:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			pcTarget:sendMinitext(player.name.." guillotines you.")
		end
	end
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"A strong attack that consumes power to strike a foe"}
	return level, items, itemAmounts, description
end
}