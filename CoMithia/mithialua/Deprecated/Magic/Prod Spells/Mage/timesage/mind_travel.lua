mind_travel = {
cast = function(player)
	local aether = 150000
	local magicCost = 100
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("mind_travel", aether)
	player.magic = player.maxMagic
	player:sendStatus()
	player:playSound(81)
	player:sendAnimation(78, 0)
	player:sendMinitext("You cast Mind Travel.")
end,

requirements = function(player)
	local level = 37
	local items = {}
	local itemAmounts = {}
	local description = {"Restores your magic to full strength"}
	
	return level, items, itemAmounts, description
end
}