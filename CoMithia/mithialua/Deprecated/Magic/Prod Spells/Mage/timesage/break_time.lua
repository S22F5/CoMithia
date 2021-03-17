break_time = {
cast = function(player)
	local mobBlocks = player:getObjectsInArea(BL_MOB)
	local aether = 25000
	local duration = 15000
	local magicCost = (player.magic * .05)
	local minMagic = 200
	local distance = 4
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (#mobBlocks > 0) then
		player:sendAction(6, 20)
		player:setAether("break_time", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Break Time.")
		player:playSound(86)
	
		for i = 1, #mobBlocks do
			if (mobBlocks[i].state ~= 1 and distanceSquare(player, mobBlocks[i], distance) and not mobBlocks[i]:hasDuration("break_time")) then
				if (mobBlocks[i]:hasDuration("stop_time")) then
					mobBlocks[i]:setDuration("stop_time", 0)
				end
				
				mobBlocks[i]:sendAnimation(99, 0)
				mobBlocks[i]:setDuration("break_time", duration)
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
	local level = 28
	local items = {}
	local itemAmounts = {}
	local description = {"Stuns all targets around you"}
	
	return level, items, itemAmounts, description
end
}