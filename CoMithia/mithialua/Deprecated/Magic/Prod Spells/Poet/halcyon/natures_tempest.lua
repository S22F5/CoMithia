natures_tempest = {
cast = function(player, target)
	local aether = 25000
	local damage = (player.magic * .9)
	local threat
	local magicCost = (player.magic * .9)
	local minMagic = 250
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	if (target.blType == BL_MOB) then
		player:sendAction(6, 20)
		player:setAether("natures_tempest", aether)
		player:playSound(72)
		target:sendAnimation(189, 0)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Nature's Tempest.")
		target.attacker = player.ID
		threat = target:removeHealthExtend(damage, 1, 1, 1, 1, 2)
		player:addThreat(target.ID, threat)
		
		if (#player.group > 1) then
			target:setGrpDmg(player.ID, threat)
		else
			target:setIndDmg(player.ID, threat)
		end
		
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	elseif (target.blType == BL_PC and player:canPK(target)) then
		player:sendAction(6, 20)
		player:setAether("natures_tempest", aether)
		player:playSound(72)
		target:sendAnimation(189, 0)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Nature's Tempest.")
		target.attacker = player.ID
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		target:sendMinitext(player.name.." unleashes nature's tempest upon you.")
	end
end,

requirements = function(player)
	local level = 31
	local items = {}
	local itemAmounts = {}
	local description = {"Powerful scaling attack that focuses your magic into damage"}
	
	return level, items, itemAmounts, description
end
}