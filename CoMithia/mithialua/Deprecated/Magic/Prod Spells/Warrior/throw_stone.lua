throw_stone = {
cast = function(player, target)
	local damage = 1
	local aether = 30000
	local duration = 3000
	local magicCost = 25
	
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
	
	if (target:hasDuration("throw_hatchet") or target:hasDuration("throw_axe")) then
		player:sendMinitext("A stronger spell is already running.")
		return
	end
	
	if (target:hasDuration("throw_stone")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(2, 20)
	player:setAether("throw_stone", aether)
	player:playSound(72)
	player:sendMinitext("You cast Throw Stone.")
	
	if (target.blType == BL_MOB) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:throw(target.x, target.y, 3254, 0, 2)
		target:setDuration("throw_stone", duration)
		target.attacker = player.ID
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		target:changeMove(1000)
	elseif (target.blType == BL_PC and player:canPK(target)) then
		player:throw(target.x, target.y, 3254, 0, 2)
		
		if (player:canPK(target)) then
			player.magic = player.magic - magicCost
			player:sendStatus()
			target:setDuration("throw_stone", duration)
			target.attacker = player.ID
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			target:calcStat()
			target:sendMinitext(player.name.." throws a stone at you.")
		end
	end
end,

recast = function(player)
	block.speed = block.speed * 1.1
end,

uncast = function(block)
	if (block.blType == BL_MOB) then
		block:changeMove(1000)
	elseif (block.blType == BL_PC) then
		block:calcStat()
	end
end,

requirements = function(player)
	local level = 10
	local items = {}
	local itemAmounts = {}
	local description = {"A weak strike from distance"}
	return level, items, itemAmounts, description
end
}