trick_time = {
cast = function(player)
	local aether = 150000
	local magicCost = (player.magic * .25)
	local minMagic = 1000
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:flushAether()
	player:setAether("trick_time", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:playSound(77)
	player:sendAnimation(167, 0)
	player:sendMinitext("You cast Trick Time.")
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Frees your mind of all aethers"}
	
	return level, items, itemAmounts, description
end
}