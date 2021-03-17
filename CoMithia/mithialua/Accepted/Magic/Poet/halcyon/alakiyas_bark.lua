alakiyas_bark = {
cast = function(player, target)
	local aether = 12000
	local heal = (player.magic * 1.5)
	local damage = heal / 2
	local threat
	local magicCost = (player.magic * .25)
	local minMagic = 100
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That cannot save them now.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("alakiyas_bark", aether)
	player:playSound(67)
	target:sendAnimation(317, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Alakiya's Bark.")
	
	if (player:hasDuration("ferocious_gale")) then
		if (target.blType == BL_MOB) then
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
			target.attacker = player.ID
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			target:sendMinitext(player.name.." throws Alakiya's bark at you.")
		end
	else
		target.attacker = player.ID
		target:addHealthExtend(heal, 0, 0, 0, 0, 0)
		target:sendMinitext(player.name.." passes Alakiya's bark to you.")
	end
end,

requirements = function(player)
	local level = 28
	local items = {}
	local itemAmounts = {}
	local description = {"Powerful scaling heal on a target"}
	
	return level, items, itemAmounts, description
end
}