crush = {
cast = function(player)
	local mobTarget = getTargetFacing(player, BL_MOB)
	local pcTarget = getTargetFacing(player, BL_PC)
	local aether = 32000
	local damage = (player.health * 1.6)
	local threat
	local healthCost = (player.health * .65)
	local magicCost = 150
	
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
	
	if (mobTarget == nil and pcTarget == nil) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	player:sendAction(1, 20)
	player:setAether("crush", aether)
	player:sendMinitext("You cast Crush.")
	player:playSound(104)
	
	if (mobTarget ~= nil) then
		player.health = player.health - healthCost
		player.magic = player.magic - magicCost
		player:sendStatus()
		mobTarget:sendAnimation(7, 0)
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
		pcTarget:sendAnimation(7, 0)
		
		if (player:canPK(pcTarget)) then
			player.health = player.health - healthCost
			player.magic = player.magic - magicCost
			player:sendStatus()
			pcTarget.attacker = player.ID
			pcTarget:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			pcTarget:sendMinitext(player.name.." crushes you.")
		end
	end
end,

requirements = function(player)
	local level = 34
	local items = {}
	local itemAmounts = {}
	local description = {"Channel your life force into a strong scaling attack"}
	
	return level, items, itemAmounts, description
end
}