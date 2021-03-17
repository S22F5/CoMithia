mark_of_death = {
cast = function(player, target)
	local aether = 60000
	local duration = 10000
	local magicCost = 500
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That is not longer useful.")
		return
	end
	
	if (target:hasDuration("mark_of_death")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("mark_of_death", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Mark of Death.")
	player:playSound(74)
	
	if (target.blType == BL_MOB) then
		target:setDuration("mark_of_death", duration)
		target:sendAnimation(111, 0)
	elseif (target.blType == BL_PC and player:canPK(target)) then
		target:setDuration("mark_of_death", duration)
		target:sendAnimation(111, 0)
		target:sendMinitext(player.name.." lays the mark of death upon you.")
	end
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"You mark a target for death greatly increasing incoming damage"}
	
	return level, items, itemAmounts, description
end
}