lesser_shielding_ring = { 
equip = function(player)
	if (player:canLearnSpell("lesser_shielding_ring")) then
		player:addSpell("lesser_shielding_ring")
	end
end,

unequip = function(player)
	local left = player:getEquippedItem(EQ_LEFT)
	local right = player:getEquippedItem(EQ_RIGHT)
	
	if (left ~= nil or right ~= nil and player:hasSpell("lesser_shielding_ring")) then
		if (left ~= nil and left.yname ~= "lesser_shielding_ring") then
			player:removeSpell(507)
		elseif (right ~= nil and right.yname ~= "lesser_shielding_ring") then
			player:removeSpell(507)
		end
	elseif (player:hasSpell("lesser_shielding_ring")) then
		player:removeSpell(507)
	end
end,

on_break = function(player)
	local left = player:getEquippedItem(EQ_LEFT)
	local right = player:getEquippedItem(EQ_RIGHT)
	
	if (left ~= nil and right ~= nil and player:hasSpell("lesser_shielding_ring")) then
		if ((left.yname ~= "lesser_shielding_ring" or (left.yname == "lesser_shielding_ring" and left.dura <= 0))
		and (right.yname ~= "lesser_shielding_ring" or (right.yname == "lesser_shielding_ring" and right.dura <= 0))) then
			player:removeSpell(507)
		end
	elseif (player:hasSpell("lesser_shielding_ring")) then
		player:removeSpell(507)
	end
end,

while_passive = function(player)
	local left = player:getEquippedItem(EQ_LEFT)
	local right = player:getEquippedItem(EQ_RIGHT)
	local aether = 4000
	local shieldCapacity = 75
	local shieldAddition = shieldCapacity / (12000 / aether)
	
	if (player.state == 1) then
		return
	end
	
	if (left ~= nil and right ~= nil and left.yname == right.yname and left.dura > 0 and right.dura > 0) then
		shieldCapacity = shieldCapacity * 2
		shieldAddition = shieldAddition * 2
	end
	
	if (not player:hasAether("lesser_shielding_ring")) then
		if (player.dmgShield < shieldCapacity
		and ((left ~= nil and left.yname == "lesser_shielding_ring" and left.dura > 0)
		or (right ~= nil and right.yname == "lesser_shielding_ring" and right.dura > 0))) then
			player:setAether("lesser_shielding_ring", aether)
			
			if (left ~= nil and left.yname == "lesser_shielding_ring" and left.dura > 0) then
				player:deductDura(4, 1)
			end
			
			if (right ~= nil and right.yname == "lesser_shielding_ring" and right.dura > 0) then
				player:deductDura(5, 1)
			end
			
			player:addShield(shieldAddition)
		end
	end
end
}