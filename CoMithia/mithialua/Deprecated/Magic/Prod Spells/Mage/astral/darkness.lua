darkness = {
cast = function(player, target)
	local aether = 30000
	local duration = 8000
	local magicCost = 200
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	if (target:hasDuration("darkness")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (target.blType == BL_MOB) then
		player:sendAction(6, 20)
		player:setAether("darkness", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Darkness.")
		player:playSound(74)
		target:sendAnimation(201, 0)
		target:setDuration("darkness", duration)
		target.blind = true
	elseif (target.blType == BL_PC and player:canPK(target)) then
		player:sendAction(6, 20)
		player:setAether("darkness", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Darkness.")
		player:playSound(74)
		target:sendAnimation(201, 0)
		target:setDuration("darkness", duration)
		target:calcStat()
		target:sendMinitext(player.name.." whirls a darkness around you.")
	end
end,

recast = function(player)
	player.blind = true
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block.blind = false
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end,

requirements = function(player)
	local level = 37
	local items = {}
	local itemAmounts = {}
	local description = {"The darkness of the void covers your target"}
	
	return level, items, itemAmounts, description
end
}