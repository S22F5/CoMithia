turtle_shell = {
cast = function(player)
	local duration = 11000
	local magicCost = 250
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("turtle_shell")) then
		player:sendMinitext("That spell is already cast.")
		return
	end

	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendAction(6, 20)
	player:playSound(41)
	
	if (checkProtection(player, nil, 5000)) then
		player:sendMinitext("Turtle Shell has been deflected.")
	else
		player:setDuration("turtle_shell", duration)
		player:sendAnimation(87, 0)
		player:calcStat()
		player:sendMinitext("You cast Turtle Shell.")
	end
end,

recast = function(player)
	player.deduction = player.deduction - 2
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Casts a protective barrier that greatly reduces incoming damage"}
	return level, items, itemAmounts, description
end
}