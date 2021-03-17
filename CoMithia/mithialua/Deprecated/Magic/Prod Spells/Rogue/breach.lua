breach = {
on_learn = function(player)
	if (player:hasSpell("puncture")) then
		player:removeSpell("puncture")
	end
	
	if (player:hasSpell("fissure")) then
		player:removeSpell("fissure")
	end
	
	player.registry["learned_puncture"] = 1
	player.registry["learned_fissure"] = 1
end,

cast = function(player)
	local mobTarget = getTargetFacing(player, BL_MOB)
	local pcTarget = getTargetFacing(player, BL_PC)
	local aether = 30000
	local duration = 10000
	local magicCost = 350
	
	if (not player:canCast(1, 1, 0)) then
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
	
	if ((mobTarget ~= nil and mobTarget:hasDuration("breach")) or (mobTarget == nil and pcTarget ~= nil and pcTarget:hasDuration("breach"))) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(1, 20)
	player:setAether("breach", aether)
	player:sendMinitext("You cast Breach.")
	player:playSound(108)
	
	if (mobTarget ~= nil) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		mobTarget:sendAnimation(122, 0)
		
		if (mobTarget:hasDuration("puncture")) then
			mobTarget:setDuration("puncture", 0)
		end
		
		if (mobTarget:hasDuration("fissure")) then
			mobTarget:setDuration("fissure", 0)
		end
		
		mobTarget:setDuration("breach", duration)
		mobTarget:calcStat()
	elseif (pcTarget ~= nil and player:canPK(pcTarget)) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		pcTarget:sendAnimation(122, 0)
		
		if (pcTarget:hasDuration("puncture")) then
			pcTarget:setDuration("puncture", 0)
		end
		
		if (pcTarget:hasDuration("fissure")) then
			pcTarget:setDuration("fissure", 0)
		end
		
		pcTarget:setDuration("breach", duration)
		pcTarget:calcStat()
		pcTarget:sendMinitext(player.name.." breaches your armor.")
	end
end,

while_cast = function(block)
	if (block.blType == BL_MOB and block.charState ~= 2) then
		block:sendAnimation(34, 0)
	elseif (block.blType == BL_PC and block.state ~= 2) then
		block:sendAnimation(34, 0)
	end
end,

recast = function(block)
	block.armor = block.armor * .1
end,

uncast = function(block)
	block:calcStat()
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Greatly Weakens your foes allowing them to take more damage"}
	return level, items, itemAmounts, description
end
}