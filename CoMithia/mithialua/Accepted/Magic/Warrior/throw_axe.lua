throw_axe = {
on_learn = function(player)
	if (player:hasSpell("throw_stone")) then
		player:removeSpell("throw_stone")
	end
	
	if (player:hasSpell("throw_hatchet")) then
		player:removeSpell("throw_hatchet")
	end
	
	player.registry["learned_throw_stone"] = 1
	player.registry["learned_throw_hatchet"] = 1
end,

cast = function(player, target)
	local damage = 1
	local aether = 30000
	local duration = 3000
	local magicCost = 50
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player.x == target.x and player.y == target.y) then
		player:sendMinitext("It would be unwise to do that.")
		return
	end
	
	if (target:hasDuration("throw_axe")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (target:hasDuration("throw_rock")) then
		target:setDuration("throw_rock", 0)
	end
	
	if (target:hasDuration("throw_hatchet")) then
		target:setDuration("throw_hatcher", 0)
	end
	
	player:sendAction(2, 20)
	player:setAether("throw_axe", aether)
	player:playSound(87)
	player:sendMinitext("You cast Throw Axe.")
	
	if (target.blType == BL_MOB) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:throw(target.x, target.y, 789, 0, 2)
		target:setDuration("throw_axe", duration)
		target.attacker = player.ID
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		target:changeMove(1500)
	elseif (target.blType == BL_PC) then
		player:throw(target.x, target.y, 789, 0, 2)
		
		if (player:canPK(target)) then
			player.magic = player.magic - magicCost
			player:sendStatus()
			target:setDuration("throw_axe", duration)
			target.attacker = player.ID
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			target:calcStat()
			target:sendMinitext(player.name.." throws an axe at you.")
		end
	end
end,

recast = function(player)
	block.speed = block.speed * 1.2
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block:changeMove(1500)
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"A strong strike from distance"}
	return level, items, itemAmounts, description
end
}