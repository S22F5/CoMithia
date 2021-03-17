deflect = {
cast = function(player)
	local aether = 50000
	local duration = 7000
	local magicCost = (player.magic * .17)
	local minMagic = 500
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("deflect")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("deflect", aether)
	player:setDuration("deflect", duration)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:playSound(78)
	player:sendAnimation(232, 0)
	player:sendMinitext("You cast deflect.")
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Greatly reduces damage taken, while reflecting damage back to your foes"}
	
	return level, items, itemAmounts, description
end
}