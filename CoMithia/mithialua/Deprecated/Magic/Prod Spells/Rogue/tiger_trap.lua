tiger_trap = {
on_learn = function(player)
	if (player:hasSpell("cub_trap")) then
		player:removeSpell("cub_trap")
	end
	
	if (player:hasSpell("bear_trap")) then
		player:removeSpell("bear_trap")
	end
	
	player.registry["learned_cub_trap"] = 1
	player.registry["learned_bear_trap"] = 1
end,

cast = function(player)
	local aether = 25000
	local magicCost = 400
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player.pvp > 0) then
		player:setAether("tiger_trap", aether)
	end
	
	player:sendAction(6, 20)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:addNPC("tiger_trap", player.m, player.x, player.y, 0, 3600000, player.ID)
	player:sendMinitext("You cast Tiger Trap.")
	addSpotTrap(player, player.m, player.x, player.y)
end,

click = function(block, npc)
	local duration = 10000
	local owner = npc:getBlock(npc.owner)
	
	if (owner == nil or block:hasDuration("tiger_trap") == true) then
		return
	end
	
	if (block.blType == BL_MOB) then
		block:playSound(33)
		block:sendAnimation(92, 0)
		block:setDuration("tiger_trap", duration)
		block.sleep = block.sleep + .3
		removeTrap(npc)
	elseif (block.blType == BL_PC and owner:canPK(block)) then
		block:playSound(33)
		block:sendAnimation(92, 0)
		block:setDuration("tiger_trap", duration)
		block:calcStat()
		block:sendMinitext("A tiger mauls you.")
		removeTrap(npc)
	end
end,

endAction = function(npc, owner)
	removeTrap(npc)
end,

while_cast = function(block)
	if (block.sleep == 1) then
		block:setDuration("tiger_trap", 0)
	else
		block:sendAnimation(2, 0)
	end
end,

recast = function(block)
	block.sleep = block.sleep + .3
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		if (block.sleep - .3 < 1) then
			block.sleep = 1
		else
			block.sleep = block.sleep - .3
		end
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Sets a trap that will you put a foe to sleep"}
	return level, items, itemAmounts, description
end
}