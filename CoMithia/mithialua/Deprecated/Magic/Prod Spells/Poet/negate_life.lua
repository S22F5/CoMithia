negate_life = {
cast = function(player, target)
	local aether = 1000
	local damage = (player.level * 20 + .006 * player.magic)
	local threat
	local magicCost = .01 * player.magic
	local minMagic = 50
	
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
	
	if (player.className == "Halcyon") then
		damage = damage + (player.level * 10)
	end
	
	if (target.blType == BL_MOB) then
		player:sendAction(6, 20)
		player:setAether("negate_life", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:playSound(29)
	
		--if (checkProtection(player, target, 1500)) then
		--	player:sendMinitext("Negate life has been deflected.")
		--else
			target:sendAnimation(28, 1)
			player:playSound(57)
			player:sendMinitext("You cast Negate Life.")
			target.attacker = player.ID
			threat = target:removeHealthExtend(damage, 1, 1, 1, 1, 2)
			player:addThreat(target.ID, threat)
		--end
		
		if (#player.group > 1) then
			target:setGrpDmg(player.ID, threat)
		else
			target:setIndDmg(player.ID, threat)
		end
		
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	elseif (target.blType == BL_PC and player:canPK(target)) then
		player:sendAction(6, 20)
		player:setAether("negate_life", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:playSound(29)
	
		--if (checkProtection(player, target, 1500)) then
		--	player:sendMinitext("Negate life has been deflected.")
		--else
			target:sendAnimation(28, 1)
			player:playSound(57)
			player:sendMinitext("You cast Negate Life.")
			target.attacker = player.ID
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			target:sendMinitext(player.name.." negates your life.")
		--end
	end
end,

requirements = function(player)
	local level = 15
	local items = {}
	local itemAmounts = {}
	local description = {"Moderate attack that focuses your magic towards a target"}
	return level, items, itemAmounts, description
end
}