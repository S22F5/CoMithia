sharpen = {
on_learn = function(player)
	if (player:hasSpell("file")) then
		player:removeSpell("file")
	end
	
	player.registry["learned_file"] = 1
end,

cast = function(player)
	local aether = 30000
	local duration = 600000
	local magicCost = 200
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("hone")) then
		player:sendMinitext("A stronger version is already running.")
		return
	end
	
	if (player:hasDuration("sharpen")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (player:hasDuration("file")) then
		player:setDuration("file", 0)
	end
	
	player:sendAction(6, 20)
	player:setDuration("sharpen", duration)
	player:setAether("sharpen", aether)
	player:playSound(100)
	player:sendAnimation(107, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:calcStat()
	player:sendMinitext("You cast Sharpen.")
end,

recast = function(player)
	player.enchant = player.enchant + 3
	player.hit = player.hit + 6
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Prepares your weapon for battle"}
	return level, items, itemAmounts, description
end
}