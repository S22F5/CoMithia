suppress = {
on_learn = function(player)
	if (player:hasSpell("inhibit")) then
		player:removeSpell("inhibit")
	end
	
	if (player:hasSpell("restrain")) then
		player:removeSpell("restrain")
	end
	
	player.registry["learned_inhibit"] = 1
	player.registry["learned_restrain"] = 1
end,

cast = function(player, target)
	local aether = 30000
	local duration = 3000
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
	
	if (target:hasDuration("suppress")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (target.blType == BL_MOB) then
		player:sendAction(6, 20)
		player:setAether("suppress", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Suppress.")
		player:playSound(41)
	
		if (target:hasDuration("inhibit")) then
			target:setDuration("inhibit", 0)
		end
		
		if (target:hasDuration("restrain")) then
			target:setDuration("restrain", 0)
		end
		
		target:setDuration("suppress", duration)
		target:sendAnimation(3, 0)
		target.deduction = target.deduction + .3
		target.snare = true
	elseif (target.blType == BL_PC and player:canPK(target)) then
		player:sendAction(6, 20)
		player:setAether("suppress", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Suppress.")
		player:playSound(41)
	
		if (target:hasDuration("inhibit")) then
			target:setDuration("inhibit", 0)
		end
		
		if (target:hasDuration("restrain")) then
			target:setDuration("restrain", 0)
		end
		
		target:setDuration("suppress", duration)
		target:sendAnimation(3, 0)
		target:calcStat()
		target:sendMinitext(player.name.." suppresses you.")
	end
end,

while_cast = function(block)
	block:sendAnimation(34, 0)
end,

recast = function(player)
	player.deduction = player.deduction + .3
	player.snare = true
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block.deduction = block.deduction - .3
		block.snare = false
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Weakens a target allowing them to take more damage"}
	return level, items, itemAmounts, description
end
}