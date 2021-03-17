velocity = {
cast = function(player)
	local aether = 40000
	local duration = 20000
	local magicCost = 400
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("momentum")) then
		player:sendMinitext("A stronger version is already running.")
		return
	end
	
	if (player:hasDuration("velocity")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setDuration("velocity", duration)
	player:setAether("velocity", aether)
	player:sendAnimation(345, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:calcStat()
	player:sendMinitext("You cast Velocity.")
end,

recast = function(player)
	player.attackSpeed = player.attackSpeed * .75
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 15
	local items = {}
	local itemAmounts = {}
	local description = {}
	return level, items, itemAmounts, description
end
}