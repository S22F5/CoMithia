ntrap = {
cast = function(player)

	if(player.state == 1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.state == 3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	
	local mana_cost = 5
	if (player.magic < mana_cost) then
		player:sendMinitext("Not enough mana.")
		return
	end

	if (player:hasItem(121, 1) == true) then
		player:removeItem(121, 1)
	elseif (player:hasItem(122, 1) == true) then
		player:removeItem(122, 1)
	elseif (player:hasItem(120, 1) == true) then
		player:removeItem(120, 1)
	else
		player:sendMinitext("You need a cocounut as catalyst")
		return
	end
	
	player:addMana(-mana_cost)
	player:setAether("ntrap", 2000)
	player:addNPC("ntrap", player.m, player.x, player.y, 30000, 30000,player.ID)
	player:sendAction(6, 40)
	local h = player:getObjectsInCell(player.m, player.x, player.y, BL_ITEM)
	
	if (#h > 0) then
		for i = 1, #h do
			if (h[i].id == 130) then
				return
			end
		end
	end
	player:dropItem(130,1)
end,
recast = function(block)
	block.ac = block.ac + 5
end,
uncast = function(block)
	block.ac = block.ac - 5
end,

click = function(block, npc)
	local amt = 25

	if (block.blType == BL_MOB) then
		if (block:hasDuration("ntrap") == false) then
			block:setDuration("ntrap", 6000)
			ntrap.recast(block)
			block.attacker = npc.owner
			block:removeHealthExtend(amt, 1, 1, 1, 1, 0)
		end
	elseif (block.blType == BL_PC) then
		if (block.pvp ~= 0) then
			block.attacker = npc.owner
			block:removeHealthExtend(amt, 1, 1, 1, 1, 0)
		end		
	end

	removeTrap(npc)
end
}