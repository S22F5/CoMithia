displace = {
cast = function(player, target)
	local aether = 60000
	local magicCost = 250
	local distance = 4
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.blType == BL_MOB and target.mobID == 10004) then
		player:sendMinitext("Your target is not elligible for that skill.")
		return
	end
	
	if (distanceSquare(player, target, distance)) then
		player:sendAction(6, 20)
		player:setAether("displace", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Displace.")
		canAmbush(player, target)
		player:playSound(87)
		player:sendAnimation(13, 0)
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Teleports you to a target of choice"}
	
	return level, items, itemAmounts, description
end
}