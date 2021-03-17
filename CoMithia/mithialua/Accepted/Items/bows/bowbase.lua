bowbase = {
thrown = function(player, target)
	local arrow = 6
	local bowRange = 5 --max range of bow
	local attack = false --only attack if they're supposed to
	local block = player:getBlock(player.target)
	local passDamageModifier
	
	--no ammo
	
	--cannot shoot
	
	--1 and 2 for PK
	
	if (block == nil) then
		block = player:getBlock(player.attacker)
	end
	
	if (block == nil or block.state == 1 or block.ID == player.ID or block.m ~= player.m or (block.x == player.x and block.y == player.y) or bowbase.checkAttack(player, block, bowRange) == false) then
		local blockTable = player:getObjectsInArea(BL_MOB)
		
		block = nil
		
		if (player.pvp > 0) then
			local pcTable = player:getObjectsInArea(BL_PC)
			
			if (#pcTable > 0) then
				for i = 1, #pcTable do
					if (pcTable[i].state ~= 2 and pcTable[i].groupID ~= player.groupID) then
						table.insert(blockTable, pcTable[i])
					end
				end
			end
		end
		
		if (#blockTable > 0) then
			local blocks = {}
			
			for i = 1, #blockTable do
				if (blockTable[i].state ~= 1 and blockTable[i].ID ~= player.ID
				and (distance(player, blockTable[i]) <= bowRange)
				and (blockTable[i].x ~= player.x and blockTable[i].y ~= player.y)) then
					table.insert(blocks, blockTable[i])
				end
			end
			
			if (#blocks > 0) then
				block = blocks[math.random(#blocks)]
			end
		end
	end
	
	attack = bowbase.checkAttack(player, block, bowRange)
	
	if (attack == true) then
		hitCritChance(player, block)
		
		if (player.critChance > 0) then
			swingDamage(player)
			swingDamage(player, block)
			
			if (block.blType == BL_MOB) then
				mob_ai_basic.on_attacked(block, player)
			elseif (block.blType == BL_PC) then
				player_combat.on_attacked(block, player)
			end
		end
		
		player:throw(block.x, block.y, arrow + player.side, 0, 1)
	else
		if (player.side == 0) then
			player:throw(player.x, player.y - bowRange, arrow + player.side, 0, 1)
		elseif (player.side == 1) then
			player:throw(player.x + bowRange, player.y, arrow + player.side, 0, 1)
		elseif (player.side == 2) then
			player:throw(player.x, player.y + bowRange, arrow + player.side, 0, 1)
		elseif (player.side == 3) then
			player:throw(player.x - bowRange, player.y, arrow + player.side, 0, 1)
		end
	end
end,

checkAttack = function(player, block, bowRange)
	if (block ~= nil) then
		player.target = block.ID
		block.attacker = player.ID
		
		if (block.blType == BL_MOB) then
			if (distance(player, block) <= bowRange) then
				return true
			end
		elseif (block.blType == BL_PC) then
			if (distance(player, block) <= bowRange) then
				if (block.y <= player.y and block.x >= player.x and (player.side == 0 or player.side == 1)) then
					return true
				elseif (block.y >= player.y and block.x >= player.x and (player.side == 1 or player.side == 2)) then
					return true
				elseif (block.y >= player.y and block.x <= player.x and (player.side == 2 or player.side == 3)) then
					return true
				elseif (block.y <= player.y and block.x <= player.x and (player.side == 3 or player.side == 0)) then
					return true
				end
			end
		end
	end
	
	return false
end
}