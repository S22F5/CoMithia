puncture = {
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
	
	if ((mobTarget ~= nil and (mobTarget:hasDuration("fissure") or mobTarget:hasDuration("breach")))
	or (mobTarget == nil and pcTarget ~= nil and (pcTarget:hasDuration("fissure") or pcTarget:hasDuration("breach")))) then
		player:sendMinitext("A stronger version is already running.")
		return
	end
	
	if ((mobTarget ~= nil and mobTarget:hasDuration("puncture")) or (mobTarget == nil and pcTarget ~= nil and pcTarget:hasDuration("puncture"))) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(1, 20)
	player:setAether("puncture", aether)
	player:sendMinitext("You cast Puncture.")
	player:playSound(108)
	
	if (mobTarget ~= nil) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		mobTarget:sendAnimation(122, 0)
		mobTarget:setDuration("puncture", duration)
		mobTarget:calcStat()
	elseif (pcTarget ~= nil and player:canPK(pcTarget)) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		pcTarget:sendAnimation(122, 0)
		pcTarget:setDuration("puncture", duration)
		pcTarget:calcStat()
		pcTarget:sendMinitext(player.name.." punctures your armor.")
	end
end,

recast = function(block)
	block.armor = block.armor * .4
end,

uncast = function(block)
	block:calcStat()
end,

requirements = function(player)
	local level = 10
	local items = {}
	local itemAmounts = {}
	local description = {"Weakens your foes allowing them to take more damage"}
	return level, items, itemAmounts, description
end
}