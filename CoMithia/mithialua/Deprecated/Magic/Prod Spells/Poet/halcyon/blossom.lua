blossom = {
cast = function(player)
	local aether = 90000
	local duration = 15000
	local magicCost = 1000
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("blossom")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("blossom", aether)
	player:setDuration("blossom", duration)
	player:playSound(75)
	player:sendAnimation(59, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Blossom.")
end,

requirements = function(player)
	local level = 34
	local items = {}
	local itemAmounts = {}
	local description = {"Focus your healing power strengthening your healing spells"}
	
	return level, items, itemAmounts, description
end
}