powder_trap = {
on_learn = function(player)
	if (player:hasSpell("sand_trap")) then
		player:removeSpell("sand_trap")
	end
	
	player.registry["learned_sand_trap"] = 1
end,

cast = function(player)
	local aether = 10000
	local magicCost = 100
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("powder_trap", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:addNPC("powder_trap", player.m, player.x, player.y, 0, 3600000, player.ID)
	player:sendMinitext("You cast Powder Trap.")
	addSpotTrap(player, player.m, player.x, player.y)
end,

click = function(block, npc)
	local damage = 1
	local duration = 4000
	local owner = npc:getBlock(npc.owner)
	
	if (owner == nil or block:hasDuration("powder_trap")) then
		return
	end
	
	if (block.blType == BL_MOB) then
		block:playSound(33)
		block:sendAnimation(13, 0)
		block.attacker = owner.ID
		block:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		block:setDuration("powder_trap", duration)
		block.blind = true
		removeTrap(npc)
	elseif (block.blType == BL_PC and owner:canPK(block)) then
		block:playSound(33)
		block:sendAnimation(13, 0)
		block.attacker = owner.ID
		block:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		block:setDuration("powder_trap", duration)
		block:calcStat()
		block:sendMinitext("You've gotten powder in your eyes.")
		removeTrap(npc)
	end
end,

endAction = function(npc, owner)
	removeTrap(npc)
end,

recast = function(block)
	block.blind = true
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block.blind = false
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Sets a trap that will moderatly blind your foes"}
	return level, items, itemAmounts, description
end
}