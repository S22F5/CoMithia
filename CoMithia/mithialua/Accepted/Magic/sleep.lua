sleep = {
cast = function(player, target)
	local mobBlocks = target:getObjectsInArea(BL_MOB)
	local pcBlocks = target:getObjectsInArea(BL_PC)
	local aether = 35000
	local duration = 7000
	local magicCost = 250
	local dist = 1
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player.pvp > 0) then
		dist = 0
	end
	
	player:sendAction(6, 20)
	player:setAether("sleep", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast sleep.")
	player:playSound(82)
	
	if (#mobBlocks > 0) then
		for i = 1, #mobBlocks do
			if (mobBlocks[i].state ~= 1 and distance(target, mobBlocks[i]) <= dist) then
				mobBlocks[i]:sendAnimation(316, 0)
				mobBlocks[i]:setDuration("sleep", duration)
				mobBlocks[i].sleep = mobBlocks[i].sleep + .3
			end
		end
	end
	
	if (#pcBlocks > 0) then
		for i = 1, #pcBlocks do
			if (pcBlocks[i].state ~= 1 and distance(target, pcBlocks[i]) <= dist and player:canPK(pcBlocks[i])) then
				pcBlocks[i]:sendAnimation(316, 0)
				pcBlocks[i]:setDuration("sleep", duration)
				pcBlocks[i]:calcStat()
				pcBlocks[i]:sendMinietxt(player.name.." says it's sleep time.")
			end
		end
	end
end,

while_cast = function(block)
	if (block.sleep == 1) then
		block:setDuration("sleep", 0)
	else
		block:sendAnimation(2, 0)
	end
end,

recast = function(player)
	player.sleep = player.sleep + .3
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
	local level = 34
	local items = {}
	local itemAmounts = {}
	local description = {"Targets many foes and forces them to sleep increasing damage taken"}
	
	return level, items, itemAmounts, description
end
}