halt = {
cast = function(player)
	local aether = 60000
	local magicCost = 250
	
	if (not player:canCast(1, 1, 10)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("halt", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:playSound(36)
	player:sendAnimation(366, 0)
	player:sendMinitext("You cast Halt.")
	halt_sleep.cast(player)
	halt_snare.cast(player)
end,

requirements = function(player)
	local level = 37
	local items = {}
	local itemAmounts = {}
	local description = {"Shouts around the Knight weakening foes and knocking out those around him"}
	
	return level, items, itemAmounts, description
end
}

halt_sleep = {
cast = function(player)
	local mobBlocks = getTargetsAround(player, BL_MOB)
	local pcBlocks = getTargetsAround(player, BL_PC)
	local duration = 5000
	
	if (#mobBlocks > 0) then
		for i = 1, #mobBlocks do
			if (not mobBlocks[i]:hasDuration("halt_sleep")) then
				mobBlocks[i]:setDuration("halt_sleep", duration)
				mobBlocks[i].sleep = mobBlocks[i].sleep + .3
			end
		end
	end
	
	if (#pcBlocks > 0) then
		for i = 1, #pcBlocks do
			if (not pcBlocks[i]:hasDuration("halt_sleep") and player:canPK(pcBlocks[i])) then
				pcBlocks[i]:setDuration("halt_sleep", duration)
				pcBlocks[i]:calcStat()
				pcBlocks[i]:sendMinitext(player.name.." screams in your ear.")
			end
		end
	end
end,

while_cast = function(block)
	if (block.sleep == 1) then
		block:setDuration("halt_sleep", 0)
	else
		block:sendAnimation(2, 0)
	end
end,

recast = function(player)
	player.sleep = player.sleep + .3
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block.sleep = block.sleep - .3
		
		if (block.sleep > .999) then
			block.sleep = 1
		end
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end
}

halt_snare = {
cast = function(player)
	local mobBlocks = player:getObjectsInArea(BL_MOB)
	local pcBlocks = player:getObjectsInArea(BL_PC)
	local duration = 7000
	local distance = 2
	
	if (#mobBlocks > 0) then
		for i = 1, #mobBlocks do
			if (not mobBlocks[i]:hasDuration("halt_sleep")
			and not mobBlocks[i]:hasDuration("halt_snare")
			and distanceSquare(player, mobBlocks[i], distance)) then
				mobBlocks[i]:setDuration("halt_snare", duration)
				mobBlocks[i].snare = true
			end
		end
	end
	
	if (#pcBlocks > 0) then
		for i = 1, #pcBlocks do
			if (not pcBlocks[i]:hasDuration("halt_sleep")
			and not pcBlocks[i]:hasDuration("halt_snare")
			and distanceSquare(player, pcBlocks[i], distance) and player:canPK(pcBlocks[i])) then
				pcBlocks[i]:setDuration("halt_snare", duration)
				pcBlocks[i]:calcStat()
				pcBlocks[i]:sendMinitext(player.name.." screams in your ear.")
			end
		end
	end
end,

recast = function(player)
	player.snare = true
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block.snare = false
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end
}