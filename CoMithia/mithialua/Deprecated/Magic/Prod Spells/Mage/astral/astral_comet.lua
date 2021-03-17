astral_comet = {
cast = function(player, target)
	local aether = 60000
	local damage = (player.magic * 1.75)
	local threat
	local healthCost = (player.health * .25)
	local magicCost = (player.magic * .75)
	local minHealth = 250
	local minMagic = 1000
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health < minHealth) then
		player:sendMinitext("Not enough vita.")
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
		player:setAether("astral_comet", aether)
		player.health = player.health - healthCost
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Astral Comet.")
		player:playSound(67)
		target:sendAnimation(419, 0)
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
		player:setAether("astral_comet", aether)
		player.health = player.health - healthCost
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Astral Comet.")
		player:playSound(67)
		target:sendAnimation(419, 0)
		target.attacker = player.ID
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		target:sendMinitext(player.name.." blasts you with an astral comet.")
	end
end,

requirements = function(player)
	local level = 31
	local items = {}
	local itemAmounts = {}
	local description = {"Strong scaling attack to a target"}
	
	return level, items, itemAmounts, description
end
}