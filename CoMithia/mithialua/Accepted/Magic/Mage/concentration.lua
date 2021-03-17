concentration = {
cast = function(player)
	local aether = 90000
	local duration = 20000
	local magicCost = (player.maxMagic * .1)
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("concentration", aether)
	player:playSound(98)
	player:sendAnimation(50, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("concentration", duration)
	player:calcStat()
	player:sendMinitext("You cast Concentration.")
end,

recast = function(player)
	player.vRegen = player.vRegen + 75
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	level = 20
	items = {}
	itemAmounts = {}
	description = {"Increases your regeneration"}
	
	return level, items, itemAmounts, description
end
}