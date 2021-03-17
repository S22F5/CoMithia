sweeping_strikes = {
cast = function(player)
	local aether = 125000
	local duration = 25000
	local healthCost = (player.health * .25)
	local magicCost = (player.magic * .05)
	local minMagic = 500
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("sweeping_strikes")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:playSound(72)
	player:sendAnimation(185, 0)
	player:setAether("sweeping_strikes", aether)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("sweeping_strikes", duration)
	player:calcStat()
	player:sendMinitext("You cast sweeping strikes.")
end,

recast = function(player)
	player.extendHit = true
	player.flank = true
	player.backstab = true
	player.ac = player.ac + 20
end,

uncast = function(player)
	player.extendHit = false
	player.flank = false
	player.backstab = false
	player:calcStat()
end,

requirements = function(player)
	local level = 37
	local items = {}
	local itemAmounts = {}
	local description = {"Strike many foes around you"}
	
	return level, items, itemAmounts, description
end
}