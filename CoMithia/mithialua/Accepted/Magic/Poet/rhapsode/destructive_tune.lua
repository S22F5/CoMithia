destructive_tune = {
cast = function(player)
	local mobBlocks = player:getObjectsInArea(BL_MOB)
	local aether = 45000
	local duration = 60000
	local magicCost = 500
	local distance = 3
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
		
	if (#mobBlocks > 0) then
		player:sendAction(6, 20)
		player:setAether("destructive_tune", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Destructive Tune.")
		player:playSound(44)
	
		for i = 1, #mobBlocks do
			if ((mobBlocks[i].owner == 0 or mobBlocks[i].owner >= 1073741823) and distanceSquare(player, mobBlocks[i], distance)
			and not mobBlocks[i]:hasDuration("plague") and not mobBlocks[i]:hasDuration("destructive_tune")) then
				if (mobBlocks[i]:hasDuration("afflict")) then
					mobBlocks[i]:setDuration("afflict", 0)
				end
				
				if (mobBlocks[i]:hasDuration("curse")) then
					mobBlocks[i]:setDuration("curse", 0)
				end
				
				mobBlocks[i]:sendAnimation(75, 0)
				mobBlocks[i]:setDuration("destructive_tune", duration)
				mobBlocks[i]:calcStat()
			end
		end
	end
end,

while_cast = function(block)
	block:sendAnimation(34, 0)
end,

recast = function(block)
	block.armor = block.armor * .4
end,

uncast = function(block)
	block:calcStat()
end,

requirements = function(player)
	local level = 34
	local items = {}
	local itemAmounts = {}
	local description = {"Weakens all foes in the area"}
	
	return level, items, itemAmounts, description
end
}