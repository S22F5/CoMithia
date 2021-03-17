swap = {
cast = function(player, target)
	local itemCellBlocks = player:getObjectsInCell(target.m, target.x, target.y, BL_ITEM)
	local players = player:getObjectsInCell(target.m, target.x, target.y, BL_PC)
	local aether = 180000
	local magicCost = 350
	local distance = 4
	local playerX = player.x
	local playerY = player.y
	
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
	
	if (distanceSquare(player, target, distance) and target.gmLevel == 0 and #players == 1 and (#itemCellBlocks == 0 or player.pvp > 0)) then
		player:sendAction(6, 20)
		player:setAether("swap", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Swap.")
		player:warp(target.m, target.x, target.y)
		target:warp(player.m, playerX, playerY)
		player:playSound(82)
		player:sendAnimation(177, 0)
		target:sendAnimation(177, 0)
		target:sendMinitext(player.name.." makes you swap.")
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"You swap places with your target"}
	
	return level, items, itemAmounts, description
end
}