fissure = {
on_learn = function(player)
	if (player:hasSpell("puncture")) then
		player:removeSpell("puncture")
	end
	
	player.registry["learned_puncture"] = 1
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
		player:sendMinitext("A stronger version is already running.")
		return
	end
	
	if ((mobTarget ~= nil and mobTarget:hasDuration("fissure")) or (mobTarget == nil and pcTarget ~= nil and pcTarget:hasDuration("fissure"))) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(1, 20)
	player:setAether("fissure", aether)
	player:sendMinitext("You cast Fissure.")
	player:playSound(108)
	
	if (mobTarget ~= nil and not mobTarget:hasDuration("fissure")) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		mobTarget:sendAnimation(122, 0)
		
		if (mobTarget:hasDuration("puncture")) then
			mobTarget:setDuration("puncture", 0)
		end
		
		mobTarget:setDuration("fissure", duration)
		mobTarget:calcStat()
	elseif (pcTarget ~= nil and player:canPK(pcTarget) and not pcTarget:hasDuration("fissure")) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		pcTarget:sendAnimation(122, 0)
		
		if (pcTarget:hasDuration("puncture")) then
			pcTarget:setDuration("puncture", 0)
		end
		
		pcTarget:setDuration("fissure", duration)
		pcTarget:calcStat()
		pcTarget:sendMinitext(player.name.." fissures your armor.")
	end
end,

recast = function(block)
	block.armor = block.armor * .2
end,

uncast = function(block)
	block:calcStat()
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Moderatly weakens your foes allowing them to take more damage"}
	return level, items, itemAmounts, description
end
}