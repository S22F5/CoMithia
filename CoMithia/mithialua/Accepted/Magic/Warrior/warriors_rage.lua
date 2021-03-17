warriors_rage = {
cast = function(player)
	local aether = 60000
	local duration = 600000
	local magicCost = 75
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("fighters_rage") or player:hasDuration("champions_rage")) then
		player:sendMinitext("A stronger spell is already running.")
	end
	
	if (player:hasDuration("warriors_rage")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("warriors_rage", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("warriors_rage", duration)
	player:playSound(116)
	player:sendAnimation(213, 0)
	player:calcStat()
	player:sendMinitext("You cast Warrior's Rage.")
end,

recast = function(player)
	player.rage = player.rage + .33
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 10
	local items = {}
	local itemAmounts = {}
	local description = {"Hones your rage into a small damage boost"}
	
	return level, items, itemAmounts, description
end
}