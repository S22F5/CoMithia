starburst = {
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
	
	if (player:hasDuration("starburst")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("starburst", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("starburst", duration)
	player:playSound(60)
	player:sendAnimation(151, 0)
	player:sendMinitext("You cast Starburst.")
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Focuses your energy into making your next attack stronger"}
	
	return level, items, itemAmounts, description
end
}