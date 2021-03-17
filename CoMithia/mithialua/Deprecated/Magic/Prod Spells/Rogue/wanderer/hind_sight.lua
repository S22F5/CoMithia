hind_sight = {
cast = function(player)
	local aether = 90000
	local duration = 30000
	local healthCost = (player.health * .05)
	local magicCost = 400
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health - healthCost <= 0) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("hind_sight")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("hind_sight", aether)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("hind_sight", duration)
	player:playSound(71)
	player:sendAnimation(125, 0)
	player:calcStat()
	player:sendMinitext("You cast Hind Sight.")
end,

recast = function(player)
	player.grace = player.grace + 50
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 34
	local items = {}
	local itemAmounts = {}
	local description = {"Greatly increases your grace"}
	
	return level, items, itemAmounts, description
end
}