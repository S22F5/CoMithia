reapers_howl = {
cast = function(player, target)
	local aether = 45000
	local duration = 5000
	local magicCost = 300
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	if (target:hasDuration("repears_howl")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (target.blType == BL_MOB) then
		player:sendAction(6, 20)
		player:setAether("reapers_howl", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Reaper's Howl.")
		target:setDuration("repears_howl", duration)
		player:playSound(77)
		target:sendAnimation(14, 0)
		target:calcStat()
	elseif (target.blType == BL_PC and player:canPK(target)) then
		player:sendAction(6, 20)
		player:setAether("reapers_howl", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:playSound(77)
		
		if (checkProtection(player, target, 1500)) then
			player:sendMinitext("Reaper's Howl has been deflected.")
		else
			player:sendMinitext("You cast Reaper's Howl.")
			target:setDuration("reapers_howl", duration)
			target:sendAnimation(14, 0)
			target:calcStat()
			target:sendMinitext(player.name.." calls the reaper to howl at you.")
		end
	end
end,

while_cast = function(block)
	if (block.blType == BL_MOB and block.charState ~= 2) then
		block:sendAnimation(34, 0)
		block.registry["reapers_howl"] = block.registry["reapers_howl"] + 1
		block:calcStat()
	elseif (block.blType == BL_PC and block.state ~= 2) then
		block:sendAnimation(34, 0)
		block.registry["reapers_howl"] = block.registry["reapers_howl"] + 1
		block:calcStat()
	end
end,

recast = function(block)
	block.armor = block.armor * (.2 - block.registry["reapers_howl"] / 100)
end,

uncast = function(block)
	block.registry["reapers_howl"] = 0
	block:calcStat()
end,

requirements = function(player)
	local level = 37
	local items = {}
	local itemAmounts = {}
	local description = {"Chip away at your targets armor over time"}
	
	return level, items, itemAmounts, description
end
}