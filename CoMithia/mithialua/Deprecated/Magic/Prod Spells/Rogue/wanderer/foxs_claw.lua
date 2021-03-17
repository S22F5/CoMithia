foxs_claw = {
cast = function(player)
	local mobTarget = getTargetFacing(player, BL_MOB)
	local pcTarget = getTargetFacing(player, BL_PC)
	local aether = 55000
	local duration = 5000
	local magicCost = (player.magic * .25)
	local minMagic = 500
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDurationID("foxs_claw", player.ID)) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(1, 20)
	player:setAether("foxs_claw", aether)
	player:sendMinitext("You cast Fox's Claw.")		
	player:playSound(64)
	
	if (mobTarget ~= nil) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		mobTarget:setDuration("foxs_claw", duration, player.ID)
		mobTarget:sendAnimation(67, 0)
	elseif (pcTarget ~= nil) then
		pcTarget:sendAnimation(67, 0)
		
		if (player:canPK(pcTarget)) then
			player.magic = player.magic - magicCost
			player:sendStatus()
			pcTarget:setDuration("foxs_claw", duration, player.ID)
			pcTarget:sendMinitext(player.name.." pierces you with a fox's claw.")
		end
	end
end,

while_cast = function(block, caster)
	if (caster ~= nil) then
		local damage = ((caster.maxHealth * .25) / 5)
		local threat
		
		if (block.blType == BL_MOB) then
			block.attacker = caster.ID
			threat = block:removeHealthExtend(damage, 1, 1, 1, 1, 2)
			caster:addThreat(block.ID, threat)
			
			if (#caster.group > 1) then
				block:setGrpDmg(caster.ID, threat)
			else
				block:setIndDmg(caster.ID, threat)
			end
			
			block:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		elseif (block.blType == BL_PC) then
			block.attacker = caster.ID
			block:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		end
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Moderate attack that causes the enemy to bleed taking damage"}
	
	return level, items, itemAmounts, description
end
}