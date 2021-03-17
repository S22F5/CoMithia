gravitational_curse = {
cast = function(player, target)
	local aether = 35000
	local duration = 15000
	local magicCost = 100
	
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
	
	if (target:hasDuration("gravitational_curse")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (target.blType == BL_MOB) then
		player:sendAction(6, 20)
		player:setAether("gravitational_curse", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Gravitational Curse.")
		player:playSound(69)
		target:sendAnimation(417, 0)
		target:setDuration("gravitational_curse", duration)
		target:calcStat()
	elseif (target.blType == BL_PC and player:canPK(target)) then
		player:sendAction(6, 20)
		player:setAether("gravitational_curse", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Gravitational Curse.")
		player:playSound(69)
		target:sendAnimation(417, 0)
		target:setDuration("gravitational_curse", duration)
		target:calcStat()
		target:sendMinitext(player.name.." negates your armor with a gravitational curse.")
	end
end,

while_cast = function(block)
	if (block.blType == BL_MOB and block.charState ~= 2) then
		block:sendAnimation(34, 0)
	elseif (block.blType == BL_PC and block.state ~= 2) then
		block:sendAnimation(34, 0)
	end
end,

recast = function(block)
	block.armor = block.armor * .05
end,

uncast = function(block)
	block:calcStat()
end,

requirements = function(player)
	local level = 34
	local items = {}
	local itemAmounts = {}
	local description = {"Greatly weakens the armor of a target"}
	
	return level, items, itemAmounts, description
end
}