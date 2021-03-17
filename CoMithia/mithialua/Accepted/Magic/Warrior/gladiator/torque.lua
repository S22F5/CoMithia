torque = {
cast = function(player)
	local aether = 70000
	local duration = 15000
	local healthCost = (player.health * .05)
	local magicCost = (player.magic * .1)
	local minHealth = 250
	local minMagic = 500
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health < minHealth) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("torque")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(21, 30)
	player:playSound(7)
	player:sendAnimation(104, 0)
	player:setAether("torque", aether)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("torque", duration)
	player:calcStat()
	player:sendMinitext("You cast Torque.")
end,

recast = function(player)
	player.speed = player.speed / 2
	player.attackSpeed = player.attackSpeed / 2
	player:updateState()
end,

uncast = function(player)
	player:calcStat()
	player:updateState()
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Channels rage into a frenzy increasing movement and attack speed"}
	
	return level, items, itemAmounts, description
end
}