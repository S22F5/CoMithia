destruction = {
cast = function(player)
	local aether = 120000
	local duration = 15000
	local healthCost = (player.maxHealth * .1)
	local magicCost = (player.magic * .25)
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health < healthCost) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(18, 30)
	player:playSound(73)
	player:sendAnimation(178, 0)
	player:setAether("destruction", aether)
	player:setDuration("destruction", duration)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:calcStat()
	player:sendMinitext("You cast destruction.")
end,

recast = function(player)
	player.rage = player.rage * 1.5
	player.armor = player.armor * .6
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmountes = {}
	local description = {"Sacrifices defense for very strong attacks"}
	
	return level, items, itemAmountes, description
end
}