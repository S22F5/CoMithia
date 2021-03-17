traverse = {
cast = function(player)
	local pcCellBlocks = {}
	local itemCellBlocks = {}
	local aether = 15000
	local magicCost = 100
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("traverse", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Traverse.")
	
	for i = 0, 2 do
		if (player.side == 0) then
			pcCellBlocks = player:getObjectsInCell(player.m, player.x, player.y - 1, BL_PC)
			
			if (#pcCellBlocks > 0) then
				itemCellBlocks = player:getObjectsInCell(player.m, player.x, player.y - 1, BL_ITEM)
			end
			
			if ((#itemCellBlocks == 0 or player.pvp > 0) and #pcCellBlocks <= 1 and player:objectCanMove(player.x, player.y - 1, 0) and player:objectCanMoveFrom(player.x, player.y, 0) and getPass(player.m, player.x, player.y - 1) == 0 and not getWarp(player.m, player.x, player.y - 1)) then
				player:warp(player.m, player.x, player.y - 1)
			end
		elseif (player.side == 1) then
			pcCellBlocks = player:getObjectsInCell(player.m, player.x + 1, player.y, BL_PC)
			
			if (#pcCellBlocks > 0) then
				itemCellBlocks = player:getObjectsInCell(player.m, player.x + 1, player.y, BL_ITEM)
			end
			
			if ((#itemCellBlocks == 0 or player.pvp > 0) and #pcCellBlocks <= 1 and player:objectCanMove(player.x + 1, player.y, 1) and player:objectCanMoveFrom(player.x, player.y, 1) and getPass(player.m, player.x + 1, player.y) == 0 and not getWarp(player.m, player.x + 1, player.y)) then
				player:warp(player.m, player.x + 1, player.y)
			end
		elseif (player.side == 2) then
			pcCellBlocks = player:getObjectsInCell(player.m, player.x, player.y + 1, BL_PC)
			
			if (#pcCellBlocks > 0) then
				itemCellBlocks = player:getObjectsInCell(player.m, player.x, player.y + 1, BL_ITEM)
			end
			
			if ((#itemCellBlocks == 0 or player.pvp > 0) and #pcCellBlocks <= 1 and player:objectCanMove(player.x, player.y + 1, 2) and player:objectCanMoveFrom(player.x, player.y, 2) and getPass(player.m, player.x, player.y + 1) == 0 and not getWarp(player.m, player.x, player.y + 1)) then
				player:warp(player.m, player.x, player.y + 1)
			end
		elseif (player.side == 3) then
			pcCellBlocks = player:getObjectsInCell(player.m, player.x - 1, player.y, BL_PC)
			
			if (#pcCellBlocks > 0) then
				itemCellBlocks = player:getObjectsInCell(player.m, player.x - 1, player.y, BL_ITEM)
			end
			
			if ((#itemCellBlocks == 0 or player.pvp > 0) and #pcCellBlocks <= 1 and player:objectCanMove(player.x - 1, player.y, 3) and player:objectCanMoveFrom(player.x, player.y, 3) and getPass(player.m, player.x - 1, player.y) == 0 and not getWarp(player.m, player.x - 1, player.y)) then
				player:warp(player.m, player.x - 1, player.y)
			end
		end
	end
end,

requirements = function(player)
	local level = 15
	local items = {}
	local itemAmounts = {}
	local description = {"Jump a moderate distance"}
	return level, items, itemAmounts, description
end
}