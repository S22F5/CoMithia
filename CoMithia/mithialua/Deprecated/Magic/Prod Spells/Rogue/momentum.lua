momentum = {
on_learn = function(player)
	if (player:hasSpell("velocity")) then
		player:removeSpell("velocity")
	end
	
	player.registry["learned_velocity"] = 1
end,

cast = function(player)
	local aether = 40000
	local duration = 20000
	local magicCost = 500
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("momentum")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (player:hasDuration("velocity")) then
		player:setDuration("velocity", 0)
	end
	
	player:sendAction(6, 20)
	player:setDuration("momentum", duration)
	player:setAether("momentum", aether)
	player:sendAnimation(332, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:calcStat()
	player:sendMinitext("You cast Momentum.")
end,

recast = function(player)
	player.attackSpeed = player.attackSpeed * .5
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 30
	local items = {}
	local itemAmounts = {}
	local description = {}
	return level, items, itemAmounts, description
end
}