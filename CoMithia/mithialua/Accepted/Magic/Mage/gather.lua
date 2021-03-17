gather = {
cast = function(player)
	local aether = 30000
	local healthCost = (player.maxMagic * .6)
	local minMagic = 30
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player.health - healthCost < 1) then
		player.health = 100
	else
		player.health = player.health - healthCost
	end
	
	player:sendAction(6, 20)
	player:setAether("gather", aether)
	player:playSound(13)
	player:sendAnimation(171, 0)
	player.magic = player.maxMagic
	player:sendStatus()
	player:sendMinitext("You cast Gather.")
end,

requirements = function(player)
	local level = 15
	local items = {}
	local itemAmounts = {}
	local description = {"Sacrafices life to restore magic"}
	return level, items, itemAmounts, description
end
}