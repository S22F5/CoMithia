disdaining_pause = {
cast = function(player)
	local mobBlocks = player:getObjectsInSameMap(BL_MOB)
	local aether = 60000
	local duration = 10000
	local magicCost = 300
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (#mobBlocks > 0) then
		player:sendAction(6, 20)
		player:setAether("disdaining_pause", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Disdaining Pause.")
		player:playSound(75)
	
		for i = 1, #mobBlocks do
			if (mobBlocks[i].state ~= 1 and not mobBlocks[i]:hasDuration("disdaining_pause")) then
				mobBlocks[i]:sendAnimation(18, 0)
				mobBlocks[i]:setDuration("disdaining_pause", duration)
				mobBlocks[i].paralyzed = true
			end
		end
	end
end,

recast = function(player)
	player.paralyzed = true
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block.paralyzed = false
	else
		block:calcStat()
	end
end,

requirements = function(player)
	local level = 37
	local items = {}
	local itemAmounts = {}
	local description = {"Large stun that affects everything in the area"}
	
	return level, items, itemAmounts, description
end
}