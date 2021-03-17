champions_rage = {
on_learn = function(player)
	if (player:hasSpell("warriors_rage")) then
		player:removeSpell("warriors_rage")
	end
	
	if (player:hasSpell("fighters_rage")) then
		player:removeSpell("fighters_rage")
	end
	
	player.registry["learned_warriors_rage"] = 1
	player.registry["learned_fighters_rage"] = 1
end,

cast = function(player)
	local aether = 60000
	local duration = 600000
	local magicCost = 175
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("champions_rage")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (player:hasDuration("warriors_rage")) then
		player:setDuration("warriors_rage", 0)
	end
	
	if (player:hasDuration("fighters_rage")) then
		player:setDuration("fighters_rage", 0)
	end
	
	player:sendAction(6, 20)
	player:setAether("champions_rage", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("champions_rage", duration)
	player:playSound(48)
	player:sendAnimation(215, 0)
	player:calcStat()
	player:sendMinitext("You cast Champion's Rage.")
end,

recast = function(player)
	player.rage = player.rage + 1
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 30
	local items = {}
	local itemAmounts = {}
	local description = {"Hones your rage into a great damage boost"}
	
	return level, items, itemAmounts, description
end
}