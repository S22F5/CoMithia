weapon = {
enhance = function(player, itemSlot)
	local success = weapon.checkItemsSuccess(player, itemSlot)
	local breaks = weapon.checkItemsBreaks(player, itemSlot)
	local downgrade = weapon.checkItemsDowngrade(player, itemSlot)
	local secondChance = weapon.checkItemsSecondChance(player, itemSlot)
	local failChance = math.random(1000)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (weapon.checkItemsEnhance(player, itemSlot) == true) then
		if (success ~= false) then
			if (player:menu("Use instant success item?", {"Yes", "No"}) == 1) then
				player:removeItem(success[1], success[2])
				weapon.upgrade(player, itemSlot)
				return 1
			end
		end
		if (secondChance ~= false) then
			if (player:menu("Use second chance item?", {"Yes", "No"}) == 1) then
				player:removeItem(secondChance[1], secondChance[2])
				secondChance = true
			end
		end
		if (downgrade ~= false) then
			if (player:menu("Use downgrade protection item?", {"Yes", "No"}) == 1) then
				player:removeItem(downgrade[1], downgrade[2])
				downgrade = true
			end
		end
		if (breaks ~= false) then
			if (player:menu("Use break protection item?", {"Yes", "No"}) == 1) then
				player:removeItem(breaks[1], breaks[2])
				breaks = true
			end
		end
		if (weapon.checkSuccess(player, itemSlot) == true) then
			weapon.upgrade(player, itemSlot)
			return 1
		end
		if (secondChance == true) then
			if (weapon.checkSuccess(player, itemSlot) == true) then
				weapon.upgrade(player, itemSlot)
				return 1
			end
		end
		if (failChance > 300 and current > 0) then
			if (downgrade ~= true) then
				weapon.downgrade(player, itemSlot)
				return 3
			else
				return 5
			end
		elseif (failChance <= 300 and failChance > 100 and current >= 3) then
			if (breaks ~= true) then
				weapon.breaks(player, itemSlot)
				return 2
			else
				return 5
			end
		elseif (failChance <= 100) then
			if (item.dura > item.maxDura / 10) then
				player:deductDuraInv(itemSlot, item.maxDura / 10)
			else
				player:deductDuraInv(itemSlot, 1)
			end
			
			player:updateInv()
			return 4
		end
	else
		return 0
	end
end,

upgrade = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local newItem = Item(item.id + 1)
	local dura = newItem.maxDura * (item.dura / item.maxDura)
	
	player:addItem(item.id + 1, 1, dura, item.owner, item.realName)
	player:removeItemSlot(itemSlot, 1)
end,

downgrade = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local newItem = Item(item.id - 1)
	local dura = newItem.maxDura * (item.dura / item.maxDura)
	
	player:addItem(item.id - 1, 1, dura, item.owner, item.realName)
	player:removeItemSlot(itemSlot, 1)
end,

breaks = function(player, itemSlot)
	player:removeItemSlot(itemSlot, 1)
end,

checkSuccess = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and math.random(10000000) < 8500000) then
		return true
	elseif (current == 1 and math.random(10000000) < 6000000) then
		return true
	elseif (current == 2 and math.random(10000000) < 3500000) then
		return true
	elseif (current == 3 and math.random(10000000) < 1500000) then
		return true
	elseif (current == 4 and math.random(10000000) < 500000) then
		return true
	elseif (current == 5 and math.random(10000000) < 100000) then
		return true
	elseif (current == 6 and math.random(10000000) < 50000) then
		return true
	elseif (current == 7 and math.random(10000000) < 10000) then
		return true
	elseif (current == 8 and math.random(10000000) < 5000) then
		return true
	--[[
	elseif (current == 9 and math.random(10000000) < 100000) then
		return true
	elseif (current == 10 and math.random(10000000) < 50000) then
		return true
	elseif (current == 11 and math.random(10000000) < 10000) then
		return true
	elseif (current == 12 and math.random(10000000) < 5000) then
		return true
	elseif (current == 13 and math.random(10000000) < 1000) then
		return true
	elseif (current == 14 and math.random(10000000) < 500) then
		return true
	elseif (current == 15 and math.random(10000000) < 100) then
		return true
	]]--
	else
		return false
	end
end,

checkItemsEnhance = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1000, 1) == true) then
		player:removeItem(1000, 1)
		return true
	elseif (current == 1 and player:hasItem(1000, 2) == true) then
		player:removeItem(1000, 2)
		return true
	elseif (current == 2 and player:hasItem(1000, 3) == true) then
		player:removeItem(1000, 3)
		return true
	elseif (current == 3 and player:hasItem(1001, 1) == true) then
		player:removeItem(1001, 1)
		return true
	elseif (current == 4 and player:hasItem(1001, 2) == true) then
		player:removeItem(1001, 2)
		return true
	elseif (current == 5 and player:hasItem(1002, 1) == true) then
		player:removeItem(1002, 1)
		return true
	elseif (current == 6 and player:hasItem(1002, 2) == true) then
		player:removeItem(1002, 2)
		return true
	elseif (current == 7 and player:hasItem(1003, 1) == true) then
		player:removeItem(1003, 1)
		return true
	elseif (current == 8 and player:hasItem(1004, 1) == true) then
		player:removeItem(1004, 1)
		return true
	--[[
	elseif (current == 9 and player:hasItem(1003, 2) == true) then
		player:removeItem(1003, 2)
		return true
	elseif (current == 10 and player:hasItem(1004, 1) == true) then
		player:removeItem(1004, 1)
		return true
	elseif (current == 11 and player:hasItem(1005, 1) == true) then
		player:removeItem(1005, 1)
		return true
	elseif (current == 12 and player:hasItem(1006, 1) == true) then
		player:removeItem(1006, 1)
		return true
	elseif (current == 13 and player:hasItem(1007, 1) == true) then
		player:removeItem(1007, 1)
		return true
	elseif (current == 14 and player:hasItem(1008, 1) == true) then
		player:removeItem(1008, 1)
		return true
	elseif (current == 15 and player:hasItem(1009, 1) == true) then
		player:removeItem(1009, 1)
		return true
	]]--
	else
		return false
	end
end,

checkItemsSuccess = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1020, 1) == true) then
		return {1020, 1}
	elseif (current == 1 and player:hasItem(1020, 2) == true) then
		return {1020, 2}
	elseif (current == 2 and player:hasItem(1020, 3) == true) then
		return {1020, 3}
	elseif (current == 3 and player:hasItem(1021, 1) == true) then
		return {1021, 1}
	elseif (current == 4 and player:hasItem(1021, 2) == true) then
		return {1021, 2}
	elseif (current == 5 and player:hasItem(1022, 1) == true) then
		return {1022, 1}
	elseif (current == 6 and player:hasItem(1022, 2) == true) then
		return {1022, 2}
	elseif (current == 7 and player:hasItem(1023, 1) == true) then
		return {1023, 1}
	elseif (current == 8 and player:hasItem(1024, 1) == true) then
		return {1024, 1}
	--[[
	elseif (current == 9 and player:hasItem(1043, 2) == true) then
		return {1043, 2}
	elseif (current == 10 and player:hasItem(1044, 1) == true) then
		return {1044, 1}
	elseif (current == 11 and player:hasItem(1045, 1) == true) then
		return {1045, 1}
	elseif (current == 12 and player:hasItem(1046, 1) == true) then
		return {1046, 1}
	elseif (current == 13 and player:hasItem(1047, 1) == true) then
		return {1047, 1}
	elseif (current == 14 and player:hasItem(1048, 1) == true) then
		return {1048, 1}
	elseif (current == 15 and player:hasItem(1049, 1) == true) then
		return {1049, 1}
	]]--
	else
		return false
	end
end,

checkItemsBreaks = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1005, 1) == true) then
		return {1005, 1}
	elseif (current == 1 and player:hasItem(1005, 2) == true) then
		return {1005, 2}
	elseif (current == 2 and player:hasItem(1005, 3) == true) then
		return {1005, 3}
	elseif (current == 3 and player:hasItem(1006, 1) == true) then
		return {1006, 1}
	elseif (current == 4 and player:hasItem(1006, 2) == true) then
		return {1006, 2}
	elseif (current == 5 and player:hasItem(1007, 1) == true) then
		return {1007, 1}
	elseif (current == 6 and player:hasItem(1007, 2) == true) then
		return {1007, 2}
	elseif (current == 7 and player:hasItem(1008, 1) == true) then
		return {1008, 1}
	elseif (current == 8 and player:hasItem(1009, 1) == true) then
		return {1009, 1}
	--[[
	elseif (current == 9 and player:hasItem(1013, 2) == true) then
		return {1013, 2}
	elseif (current == 10 and player:hasItem(1014, 1) == true) then
		return {1014, 1}
	elseif (current == 11 and player:hasItem(1015, 1) == true) then
		return {1015, 1}
	elseif (current == 12 and player:hasItem(1016, 1) == true) then
		return {1016, 1}
	elseif (current == 13 and player:hasItem(1017, 1) == true) then
		return {1017, 1}
	elseif (current == 14 and player:hasItem(1018, 1) == true) then
		return {1018, 1}
	elseif (current == 15 and player:hasItem(1019, 1) == true) then
		return {1019, 1}
	]]--
	else
		return false
	end
end,

checkItemsDowngrade = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1010, 1) == true) then
		return {1010, 1}
	elseif (current == 1 and player:hasItem(1010, 2) == true) then
		return {1010, 2}
	elseif (current == 2 and player:hasItem(1010, 3) == true) then
		return {1010, 3}
	elseif (current == 3 and player:hasItem(1011, 1) == true) then
		return {1011, 1}
	elseif (current == 4 and player:hasItem(1011, 2) == true) then
		return {1011, 2}
	elseif (current == 5 and player:hasItem(1012, 1) == true) then
		return {1012, 1}
	elseif (current == 6 and player:hasItem(1012, 2) == true) then
		return {1012, 2}
	elseif (current == 7 and player:hasItem(1013, 1) == true) then
		return {1013, 1}
	elseif (current == 8 and player:hasItem(1014, 1) == true) then
		return {1014, 1}
	--[[
	elseif (current == 9 and player:hasItem(1023, 2) == true) then
		return {1023, 2}
	elseif (current == 10 and player:hasItem(1024, 1) == true) then
		return {1024, 1}
	elseif (current == 11 and player:hasItem(1025, 1) == true) then
		return {1025, 1}
	elseif (current == 12 and player:hasItem(1026, 1) == true) then
		return {1026, 1}
	elseif (current == 13 and player:hasItem(1027, 1) == true) then
		return {1027, 1}
	elseif (current == 14 and player:hasItem(1028, 1) == true) then
		return {1028, 1}
	elseif (current == 15 and player:hasItem(1029, 1) == true) then
		return {1029, 1}
	]]--
	else
		return false
	end
end,

checkItemsSecondChance = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1015, 1) == true) then
		return {1015, 1}
	elseif (current == 1 and player:hasItem(1015, 2) == true) then
		return {1015, 2}
	elseif (current == 2 and player:hasItem(1015, 3) == true) then
		return {1015, 3}
	elseif (current == 3 and player:hasItem(1016, 1) == true) then
		return {1016, 1}
	elseif (current == 4 and player:hasItem(1016, 2) == true) then
		return {1016, 2}
	elseif (current == 5 and player:hasItem(1017, 1) == true) then
		return {1017, 1}
	elseif (current == 6 and player:hasItem(1017, 2) == true) then
		return {1017, 2}
	elseif (current == 7 and player:hasItem(1018, 1) == true) then
		return {1018, 1}
	elseif (current == 8 and player:hasItem(1019, 1) == true) then
		return {1019, 1}
	--[[
	elseif (current == 9 and player:hasItem(1033, 2) == true) then
		return {1033, 2}
	elseif (current == 10 and player:hasItem(1034, 1) == true) then
		return {1034, 1}
	elseif (current == 11 and player:hasItem(1035, 1) == true) then
		return {1035, 1}
	elseif (current == 12 and player:hasItem(1036, 1) == true) then
		return {1036, 1}
	elseif (current == 13 and player:hasItem(1037, 1) == true) then
		return {1037, 1}
	elseif (current == 14 and player:hasItem(1038, 1) == true) then
		return {1038, 1}
	elseif (current == 15 and player:hasItem(1039, 1) == true) then
		return {1039, 1}
	]]--
	else
		return false
	end
end
}

armor = {
enhance = function(player, itemSlot)
	local success = armor.checkItemsSuccess(player, itemSlot)
	local breaks = armor.checkItemsBreaks(player, itemSlot)
	local downgrade = armor.checkItemsDowngrade(player, itemSlot)
	local secondChance = armor.checkItemsSecondChance(player, itemSlot)
	local failChance = math.random(1000)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (armor.checkItemsEnhance(player, itemSlot) == true) then
		if (success ~= false) then
			if (player:menu("Use instant success item?", {"Yes", "No"}) == 1) then
				player:removeItem(success[1], success[2])
				armor.upgrade(player, itemSlot)
				return 1
			end
		end
		if (secondChance ~= false) then
			if (player:menu("Use second chance item?", {"Yes", "No"}) == 1) then
				player:removeItem(secondChance[1], secondChance[2])
				secondChance = true
			end
		end
		if (downgrade ~= false) then
			if (player:menu("Use downgrade protection item?", {"Yes", "No"}) == 1) then
				player:removeItem(downgrade[1], downgrade[2])
				downgrade = true
			end
		end
		if (breaks ~= false) then
			if (player:menu("Use break protection item?", {"Yes", "No"}) == 1) then
				player:removeItem(breaks[1], breaks[2])
				breaks = true
			end
		end
		if (armor.checkSuccess(player, itemSlot) == true) then
			armor.upgrade(player, itemSlot)
			return 1
		end
		if (secondChance == true) then
			if (armor.checkSuccess(player, itemSlot) == true) then
				armor.upgrade(player, itemSlot)
				return 1
			end
		end
		if (failChance > 300 and current > 0) then
			if (downgrade ~= true) then
				armor.downgrade(player, itemSlot)
				return 3
			else
				return 5
			end
		elseif (failChance <= 300 and failChance > 100 and current >= 3) then
			if (breaks ~= true) then
				armor.breaks(player, itemSlot)
				return 2
			else
				return 5
			end
		elseif (failChance <= 100) then
			if (item.dura > item.maxDura / 10) then
				player:deductDuraInv(itemSlot, item.maxDura / 10)
			else
				player:deductDuraInv(itemSlot, 1)
			end
			
			player:updateInv()
			return 4
		end
	else
		return 0
	end
end,

upgrade = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local newItem = Item(item.id + 2)
	local dura = newItem.maxDura * (item.dura / item.maxDura)
	
	player:addItem(item.id + 2, 1, dura, item.owner, item.realName)
	player:removeItemSlot(itemSlot, 1)
end,

downgrade = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local newItem = Item(item.id - 2)
	local dura = newItem.maxDura * (item.dura / item.maxDura)
	
	player:addItem(item.id - 2, 1, dura, item.owner, item.realName)
	player:removeItemSlot(itemSlot, 1)
end,

breaks = function(player, itemSlot)
	player:removeItemSlot(itemSlot, 1)
end,

checkSuccess = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and math.random(10000000) < 8500000) then
		return true
	elseif (current == 1 and math.random(10000000) < 6000000) then
		return true
	elseif (current == 2 and math.random(10000000) < 3500000) then
		return true
	elseif (current == 3 and math.random(10000000) < 1500000) then
		return true
	elseif (current == 4 and math.random(10000000) < 500000) then
		return true
	elseif (current == 5 and math.random(10000000) < 100000) then
		return true
	elseif (current == 6 and math.random(10000000) < 50000) then
		return true
	elseif (current == 7 and math.random(10000000) < 10000) then
		return true
	elseif (current == 8 and math.random(10000000) < 5000) then
		return true
	--[[
	elseif (current == 9 and math.random(10000000) < 100000) then
		return true
	elseif (current == 10 and math.random(10000000) < 50000) then
		return true
	elseif (current == 11 and math.random(10000000) < 10000) then
		return true
	elseif (current == 12 and math.random(10000000) < 5000) then
		return true
	elseif (current == 13 and math.random(10000000) < 1000) then
		return true
	elseif (current == 14 and math.random(10000000) < 500) then
		return true
	elseif (current == 15 and math.random(10000000) < 100) then
		return true
	]]--
	else
		return false
	end
end,

checkItemsEnhance = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1000, 1) == true) then
		player:removeItem(1000, 1)
		return true
	elseif (current == 1 and player:hasItem(1000, 2) == true) then
		player:removeItem(1000, 2)
		return true
	elseif (current == 2 and player:hasItem(1000, 3) == true) then
		player:removeItem(1000, 3)
		return true
	elseif (current == 3 and player:hasItem(1001, 1) == true) then
		player:removeItem(1001, 1)
		return true
	elseif (current == 4 and player:hasItem(1001, 2) == true) then
		player:removeItem(1001, 2)
		return true
	elseif (current == 5 and player:hasItem(1002, 1) == true) then
		player:removeItem(1002, 1)
		return true
	elseif (current == 6 and player:hasItem(1002, 2) == true) then
		player:removeItem(1002, 2)
		return true
	elseif (current == 7 and player:hasItem(1003, 1) == true) then
		player:removeItem(1003, 1)
		return true
	elseif (current == 8 and player:hasItem(1004, 1) == true) then
		player:removeItem(1004, 1)
		return true
	--[[
	elseif (current == 9 and player:hasItem(1003, 2) == true) then
		player:removeItem(1003, 2)
		return true
	elseif (current == 10 and player:hasItem(1004, 1) == true) then
		player:removeItem(1004, 1)
		return true
	elseif (current == 11 and player:hasItem(1005, 1) == true) then
		player:removeItem(1005, 1)
		return true
	elseif (current == 12 and player:hasItem(1006, 1) == true) then
		player:removeItem(1006, 1)
		return true
	elseif (current == 13 and player:hasItem(1007, 1) == true) then
		player:removeItem(1007, 1)
		return true
	elseif (current == 14 and player:hasItem(1008, 1) == true) then
		player:removeItem(1008, 1)
		return true
	elseif (current == 15 and player:hasItem(1009, 1) == true) then
		player:removeItem(1009, 1)
		return true
	]]--
	else
		return false
	end
end,

checkItemsSuccess = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1020, 1) == true) then
		return {1020, 1}
	elseif (current == 1 and player:hasItem(1020, 2) == true) then
		return {1020, 2}
	elseif (current == 2 and player:hasItem(1020, 3) == true) then
		return {1020, 3}
	elseif (current == 3 and player:hasItem(1021, 1) == true) then
		return {1021, 1}
	elseif (current == 4 and player:hasItem(1021, 2) == true) then
		return {1021, 2}
	elseif (current == 5 and player:hasItem(1022, 1) == true) then
		return {1022, 1}
	elseif (current == 6 and player:hasItem(1022, 2) == true) then
		return {1022, 2}
	elseif (current == 7 and player:hasItem(1023, 1) == true) then
		return {1023, 1}
	elseif (current == 8 and player:hasItem(1024, 1) == true) then
		return {1024, 1}
	--[[
	elseif (current == 9 and player:hasItem(1043, 2) == true) then
		return {1043, 2}
	elseif (current == 10 and player:hasItem(1044, 1) == true) then
		return {1044, 1}
	elseif (current == 11 and player:hasItem(1045, 1) == true) then
		return {1045, 1}
	elseif (current == 12 and player:hasItem(1046, 1) == true) then
		return {1046, 1}
	elseif (current == 13 and player:hasItem(1047, 1) == true) then
		return {1047, 1}
	elseif (current == 14 and player:hasItem(1048, 1) == true) then
		return {1048, 1}
	elseif (current == 15 and player:hasItem(1049, 1) == true) then
		return {1049, 1}
	]]--
	else
		return false
	end
end,

checkItemsBreaks = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1005, 1) == true) then
		return {1005, 1}
	elseif (current == 1 and player:hasItem(1005, 2) == true) then
		return {1005, 2}
	elseif (current == 2 and player:hasItem(1005, 3) == true) then
		return {1005, 3}
	elseif (current == 3 and player:hasItem(1006, 1) == true) then
		return {1006, 1}
	elseif (current == 4 and player:hasItem(1006, 2) == true) then
		return {1006, 2}
	elseif (current == 5 and player:hasItem(1007, 1) == true) then
		return {1007, 1}
	elseif (current == 6 and player:hasItem(1007, 2) == true) then
		return {1007, 2}
	elseif (current == 7 and player:hasItem(1008, 1) == true) then
		return {1008, 1}
	elseif (current == 8 and player:hasItem(1009, 1) == true) then
		return {1009, 1}
	--[[
	elseif (current == 9 and player:hasItem(1013, 2) == true) then
		return {1013, 2}
	elseif (current == 10 and player:hasItem(1014, 1) == true) then
		return {1014, 1}
	elseif (current == 11 and player:hasItem(1015, 1) == true) then
		return {1015, 1}
	elseif (current == 12 and player:hasItem(1016, 1) == true) then
		return {1016, 1}
	elseif (current == 13 and player:hasItem(1017, 1) == true) then
		return {1017, 1}
	elseif (current == 14 and player:hasItem(1018, 1) == true) then
		return {1018, 1}
	elseif (current == 15 and player:hasItem(1019, 1) == true) then
		return {1019, 1}
	]]--
	else
		return false
	end
end,

checkItemsDowngrade = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1010, 1) == true) then
		return {1010, 1}
	elseif (current == 1 and player:hasItem(1010, 2) == true) then
		return {1010, 2}
	elseif (current == 2 and player:hasItem(1010, 3) == true) then
		return {1010, 3}
	elseif (current == 3 and player:hasItem(1011, 1) == true) then
		return {1011, 1}
	elseif (current == 4 and player:hasItem(1011, 2) == true) then
		return {1011, 2}
	elseif (current == 5 and player:hasItem(1012, 1) == true) then
		return {1012, 1}
	elseif (current == 6 and player:hasItem(1012, 2) == true) then
		return {1012, 2}
	elseif (current == 7 and player:hasItem(1013, 1) == true) then
		return {1013, 1}
	elseif (current == 8 and player:hasItem(1014, 1) == true) then
		return {1014, 1}
	--[[
	elseif (current == 9 and player:hasItem(1023, 2) == true) then
		return {1023, 2}
	elseif (current == 10 and player:hasItem(1024, 1) == true) then
		return {1024, 1}
	elseif (current == 11 and player:hasItem(1025, 1) == true) then
		return {1025, 1}
	elseif (current == 12 and player:hasItem(1026, 1) == true) then
		return {1026, 1}
	elseif (current == 13 and player:hasItem(1027, 1) == true) then
		return {1027, 1}
	elseif (current == 14 and player:hasItem(1028, 1) == true) then
		return {1028, 1}
	elseif (current == 15 and player:hasItem(1029, 1) == true) then
		return {1029, 1}
	]]--
	else
		return false
	end
end,

checkItemsSecondChance = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1015, 1) == true) then
		return {1015, 1}
	elseif (current == 1 and player:hasItem(1015, 2) == true) then
		return {1015, 2}
	elseif (current == 2 and player:hasItem(1015, 3) == true) then
		return {1015, 3}
	elseif (current == 3 and player:hasItem(1016, 1) == true) then
		return {1016, 1}
	elseif (current == 4 and player:hasItem(1016, 2) == true) then
		return {1016, 2}
	elseif (current == 5 and player:hasItem(1017, 1) == true) then
		return {1017, 1}
	elseif (current == 6 and player:hasItem(1017, 2) == true) then
		return {1017, 2}
	elseif (current == 7 and player:hasItem(1018, 1) == true) then
		return {1018, 1}
	elseif (current == 8 and player:hasItem(1019, 1) == true) then
		return {1019, 1}
	--[[
	elseif (current == 9 and player:hasItem(1033, 2) == true) then
		return {1033, 2}
	elseif (current == 10 and player:hasItem(1034, 1) == true) then
		return {1034, 1}
	elseif (current == 11 and player:hasItem(1035, 1) == true) then
		return {1035, 1}
	elseif (current == 12 and player:hasItem(1036, 1) == true) then
		return {1036, 1}
	elseif (current == 13 and player:hasItem(1037, 1) == true) then
		return {1037, 1}
	elseif (current == 14 and player:hasItem(1038, 1) == true) then
		return {1038, 1}
	elseif (current == 15 and player:hasItem(1039, 1) == true) then
		return {1039, 1}
	]]--
	else
		return false
	end
end
}

equipment = {
enhance = function(player, itemSlot)
	local success = equipment.checkItemsSuccess(player, itemSlot)
	local breaks = equipment.checkItemsBreaks(player, itemSlot)
	local downgrade = equipment.checkItemsDowngrade(player, itemSlot)
	local secondChance = equipment.checkItemsSecondChance(player, itemSlot)
	local failChance = math.random(1000)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (equipment.checkItemsEnhance(player, itemSlot) == true) then
		if (success ~= false) then
			if (player:menu("Use instant success item?", {"Yes", "No"}) == 1) then
				player:removeItem(success[1], success[2])
				equipment.upgrade(player, itemSlot)
				return 1
			end
		end
		if (secondChance ~= false) then
			if (player:menu("Use second chance item?", {"Yes", "No"}) == 1) then
				player:removeItem(secondChance[1], secondChance[2])
				secondChance = true
			end
		end
		if (downgrade ~= false) then
			if (player:menu("Use downgrade protection item?", {"Yes", "No"}) == 1) then
				player:removeItem(downgrade[1], downgrade[2])
				downgrade = true
			end
		end
		if (breaks ~= false) then
			if (player:menu("Use break protection item?", {"Yes", "No"}) == 1) then
				player:removeItem(breaks[1], breaks[2])
				breaks = true
			end
		end
		if (equipment.checkSuccess(player, itemSlot) == true) then
			equipment.upgrade(player, itemSlot)
			return 1
		end
		if (secondChance == true) then
			if (equipment.checkSuccess(player, itemSlot) == true) then
				equipment.upgrade(player, itemSlot)
				return 1
			end
		end
		if (failChance > 300 and current > 0) then
			if (downgrade ~= true) then
				equipment.downgrade(player, itemSlot)
				return 3
			else
				return 5
			end
		elseif (failChance <= 300 and failChance > 100 and current >= 3) then
			if (breaks ~= true) then
				equipment.breaks(player, itemSlot)
				return 2
			else
				return 5
			end
		elseif (failChance <= 100) then
			if (item.dura > item.maxDura / 10) then
				player:deductDuraInv(itemSlot, item.maxDura / 10)
			else
				player:deductDuraInv(itemSlot, 1)
			end
			
			player:updateInv()
			return 4
		end
	else
		return 0
	end
end,

upgrade = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local newItem = Item(item.id + 1)
	local dura = newItem.maxDura * (item.dura / item.maxDura)
	
	player:addItem(item.id + 1, 1, dura, item.owner, item.realName)
	player:removeItemSlot(itemSlot, 1)
end,

downgrade = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local newItem = Item(item.id - 1)
	local dura = newItem.maxDura * (item.dura / item.maxDura)
	
	player:addItem(item.id - 1, 1, dura, item.owner, item.realName)
	player:removeItemSlot(itemSlot, 1)
end,

breaks = function(player, itemSlot)
	player:removeItemSlot(itemSlot, 1)
end,

checkSuccess = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and math.random(10000000) < 8500000) then
		return true
	elseif (current == 1 and math.random(10000000) < 6000000) then
		return true
	elseif (current == 2 and math.random(10000000) < 3500000) then
		return true
	elseif (current == 3 and math.random(10000000) < 1500000) then
		return true
	elseif (current == 4 and math.random(10000000) < 500000) then
		return true
	elseif (current == 5 and math.random(10000000) < 100000) then
		return true
	elseif (current == 6 and math.random(10000000) < 50000) then
		return true
	elseif (current == 7 and math.random(10000000) < 10000) then
		return true
	elseif (current == 8 and math.random(10000000) < 5000) then
		return true
	--[[
	elseif (current == 9 and math.random(10000000) < 100000) then
		return true
	elseif (current == 10 and math.random(10000000) < 50000) then
		return true
	elseif (current == 11 and math.random(10000000) < 10000) then
		return true
	elseif (current == 12 and math.random(10000000) < 5000) then
		return true
	elseif (current == 13 and math.random(10000000) < 1000) then
		return true
	elseif (current == 14 and math.random(10000000) < 500) then
		return true
	elseif (current == 15 and math.random(10000000) < 100) then
		return true
	]]--
	else
		return false
	end
end,

checkItemsEnhance = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1000, 1) == true) then
		player:removeItem(1000, 1)
		return true
	elseif (current == 1 and player:hasItem(1000, 2) == true) then
		player:removeItem(1000, 2)
		return true
	elseif (current == 2 and player:hasItem(1000, 3) == true) then
		player:removeItem(1000, 3)
		return true
	elseif (current == 3 and player:hasItem(1001, 1) == true) then
		player:removeItem(1001, 1)
		return true
	elseif (current == 4 and player:hasItem(1001, 2) == true) then
		player:removeItem(1001, 2)
		return true
	elseif (current == 5 and player:hasItem(1002, 1) == true) then
		player:removeItem(1002, 1)
		return true
	elseif (current == 6 and player:hasItem(1002, 2) == true) then
		player:removeItem(1002, 2)
		return true
	elseif (current == 7 and player:hasItem(1003, 1) == true) then
		player:removeItem(1003, 1)
		return true
	elseif (current == 8 and player:hasItem(1004, 1) == true) then
		player:removeItem(1004, 1)
		return true
	--[[
	elseif (current == 9 and player:hasItem(1003, 2) == true) then
		player:removeItem(1003, 2)
		return true
	elseif (current == 10 and player:hasItem(1004, 1) == true) then
		player:removeItem(1004, 1)
		return true
	elseif (current == 11 and player:hasItem(1005, 1) == true) then
		player:removeItem(1005, 1)
		return true
	elseif (current == 12 and player:hasItem(1006, 1) == true) then
		player:removeItem(1006, 1)
		return true
	elseif (current == 13 and player:hasItem(1007, 1) == true) then
		player:removeItem(1007, 1)
		return true
	elseif (current == 14 and player:hasItem(1008, 1) == true) then
		player:removeItem(1008, 1)
		return true
	elseif (current == 15 and player:hasItem(1009, 1) == true) then
		player:removeItem(1009, 1)
		return true
	]]--
	else
		return false
	end
end,

checkItemsSuccess = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1020, 1) == true) then
		return {1020, 1}
	elseif (current == 1 and player:hasItem(1020, 2) == true) then
		return {1020, 2}
	elseif (current == 2 and player:hasItem(1020, 3) == true) then
		return {1020, 3}
	elseif (current == 3 and player:hasItem(1021, 1) == true) then
		return {1021, 1}
	elseif (current == 4 and player:hasItem(1021, 2) == true) then
		return {1021, 2}
	elseif (current == 5 and player:hasItem(1022, 1) == true) then
		return {1022, 1}
	elseif (current == 6 and player:hasItem(1022, 2) == true) then
		return {1022, 2}
	elseif (current == 7 and player:hasItem(1023, 1) == true) then
		return {1023, 1}
	elseif (current == 8 and player:hasItem(1024, 1) == true) then
		return {1024, 1}
	--[[
	elseif (current == 9 and player:hasItem(1043, 2) == true) then
		return {1043, 2}
	elseif (current == 10 and player:hasItem(1044, 1) == true) then
		return {1044, 1}
	elseif (current == 11 and player:hasItem(1045, 1) == true) then
		return {1045, 1}
	elseif (current == 12 and player:hasItem(1046, 1) == true) then
		return {1046, 1}
	elseif (current == 13 and player:hasItem(1047, 1) == true) then
		return {1047, 1}
	elseif (current == 14 and player:hasItem(1048, 1) == true) then
		return {1048, 1}
	elseif (current == 15 and player:hasItem(1049, 1) == true) then
		return {1049, 1}
	]]--
	else
		return false
	end
end,

checkItemsBreaks = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1005, 1) == true) then
		return {1005, 1}
	elseif (current == 1 and player:hasItem(1005, 2) == true) then
		return {1005, 2}
	elseif (current == 2 and player:hasItem(1005, 3) == true) then
		return {1005, 3}
	elseif (current == 3 and player:hasItem(1006, 1) == true) then
		return {1006, 1}
	elseif (current == 4 and player:hasItem(1006, 2) == true) then
		return {1006, 2}
	elseif (current == 5 and player:hasItem(1007, 1) == true) then
		return {1007, 1}
	elseif (current == 6 and player:hasItem(1007, 2) == true) then
		return {1007, 2}
	elseif (current == 7 and player:hasItem(1008, 1) == true) then
		return {1008, 1}
	elseif (current == 8 and player:hasItem(1009, 1) == true) then
		return {1009, 1}
	--[[
	elseif (current == 9 and player:hasItem(1013, 2) == true) then
		return {1013, 2}
	elseif (current == 10 and player:hasItem(1014, 1) == true) then
		return {1014, 1}
	elseif (current == 11 and player:hasItem(1015, 1) == true) then
		return {1015, 1}
	elseif (current == 12 and player:hasItem(1016, 1) == true) then
		return {1016, 1}
	elseif (current == 13 and player:hasItem(1017, 1) == true) then
		return {1017, 1}
	elseif (current == 14 and player:hasItem(1018, 1) == true) then
		return {1018, 1}
	elseif (current == 15 and player:hasItem(1019, 1) == true) then
		return {1019, 1}
	]]--
	else
		return false
	end
end,

checkItemsDowngrade = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1010, 1) == true) then
		return {1010, 1}
	elseif (current == 1 and player:hasItem(1010, 2) == true) then
		return {1010, 2}
	elseif (current == 2 and player:hasItem(1010, 3) == true) then
		return {1010, 3}
	elseif (current == 3 and player:hasItem(1011, 1) == true) then
		return {1011, 1}
	elseif (current == 4 and player:hasItem(1011, 2) == true) then
		return {1011, 2}
	elseif (current == 5 and player:hasItem(1012, 1) == true) then
		return {1012, 1}
	elseif (current == 6 and player:hasItem(1012, 2) == true) then
		return {1012, 2}
	elseif (current == 7 and player:hasItem(1013, 1) == true) then
		return {1013, 1}
	elseif (current == 8 and player:hasItem(1014, 1) == true) then
		return {1014, 1}
	--[[
	elseif (current == 9 and player:hasItem(1023, 2) == true) then
		return {1023, 2}
	elseif (current == 10 and player:hasItem(1024, 1) == true) then
		return {1024, 1}
	elseif (current == 11 and player:hasItem(1025, 1) == true) then
		return {1025, 1}
	elseif (current == 12 and player:hasItem(1026, 1) == true) then
		return {1026, 1}
	elseif (current == 13 and player:hasItem(1027, 1) == true) then
		return {1027, 1}
	elseif (current == 14 and player:hasItem(1028, 1) == true) then
		return {1028, 1}
	elseif (current == 15 and player:hasItem(1029, 1) == true) then
		return {1029, 1}
	]]--
	else
		return false
	end
end,

checkItemsSecondChance = function(player, itemSlot)
	local item = player:getInventoryItem(itemSlot)
	local offset = string.find(item.name, "+")
	local current = 0
	
	if (offset ~= nil) then
		local space = string.find(item.name, "%s")
		current = string.sub(item.name, offset + 1, space)
		current = current * 1
	end
	
	if (current == 0 and player:hasItem(1015, 1) == true) then
		return {1015, 1}
	elseif (current == 1 and player:hasItem(1015, 2) == true) then
		return {1015, 2}
	elseif (current == 2 and player:hasItem(1015, 3) == true) then
		return {1015, 3}
	elseif (current == 3 and player:hasItem(1016, 1) == true) then
		return {1016, 1}
	elseif (current == 4 and player:hasItem(1016, 2) == true) then
		return {1016, 2}
	elseif (current == 5 and player:hasItem(1017, 1) == true) then
		return {1017, 1}
	elseif (current == 6 and player:hasItem(1017, 2) == true) then
		return {1017, 2}
	elseif (current == 7 and player:hasItem(1018, 1) == true) then
		return {1018, 1}
	elseif (current == 8 and player:hasItem(1019, 1) == true) then
		return {1019, 1}
	--[[
	elseif (current == 9 and player:hasItem(1033, 2) == true) then
		return {1033, 2}
	elseif (current == 10 and player:hasItem(1034, 1) == true) then
		return {1034, 1}
	elseif (current == 11 and player:hasItem(1035, 1) == true) then
		return {1035, 1}
	elseif (current == 12 and player:hasItem(1036, 1) == true) then
		return {1036, 1}
	elseif (current == 13 and player:hasItem(1037, 1) == true) then
		return {1037, 1}
	elseif (current == 14 and player:hasItem(1038, 1) == true) then
		return {1038, 1}
	elseif (current == 15 and player:hasItem(1039, 1) == true) then
		return {1039, 1}
	]]--
	else
		return false
	end
end
}