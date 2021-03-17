dismiss = {
cast = function(player, target)
	local magicCost = 150
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	player:sendAction(6, 20)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:playSound(37)
	
	if (checkProtection(player, target, 3500)) then
		player:sendMinitext("Dismiss has been deflected.")
	else
		player:sendMinitext("You cast Dismiss.")
		target:sendAnimation(77, 0)
		target:flushDuration(0)
		target:sendMinitext(player.name.." dismisses your magic.")
	end
end,

requirements = function(player)
	local level = 20
	local items = {}
	local itemAmounts = {}
	local description = {"Removes magic from a target"}
	return level, items, itemAmounts, description
end
}