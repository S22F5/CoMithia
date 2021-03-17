step_in = {
cast = function(player, target)
	local aether = 30000
	local duration = 5000
	local magicCost = (player.maxMagic * .025)
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target:hasDuration("step_in")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("step_in", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast step in.")
	target:setDuration("step_in", duration, player.ID)
	player:playSound(62)
	target:sendAnimation(192, 0)
	
	if (target.blType == BL_PC) then
		target:sendMinitext(player.name.." step_ins on your behalf.")
	end
end,

requirements = function(player)
	local level = 28
	local items = {}
	local itemAmounts = {}
	local description = {"Defend an ally from incoming attacks"}
	
	return level, items, itemAmounts, description
end
}