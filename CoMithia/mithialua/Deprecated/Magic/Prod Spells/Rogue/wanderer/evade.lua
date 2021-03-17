evade = {
cast = function(player)
	local aether = 60000
	local duration = 15000
	local magicCost = 250
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("evade")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("evade", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("evade", duration)
	player:playSound(47)
	player:sendAnimation(72, 0)
	player:sendMinitext("You cast Evade.")
end,

requirements = function(player)
	local level = 28
	local items = {}
	local itemAmounts = {}
	local description = {"Focuses your luck towards absorbing a hostile spell"}
	
	return level, items, itemAmountes, description
end
}