manic_abyss = {
cast = function(player, target)
	local aether = 60000
	local duration = 5000
	local damage = (player.magic * .5)
	local threat
	local healthCost = (player.health * .25)
	local minMagic = 500
	
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
		player:setAether("manic_abyss", aether)
		player.health = player.health - healthCost
		player:sendStatus()
		player:sendMinitext("You cast Manic Abyss.")
		player:playSound(61)
		target:sendAnimation(416, 0)
		target.attacker = player.ID
		threat = target:removeHealthExtend(damage, 1, 1, 1, 1, 2)
		player.registry["manic_abyss"] = (threat / 5)
		player:setDuration("manic_abyss", duration)
		player:addThreat(target.ID, threat)
		
		if (#player.group > 1) then
			target:setGrpDmg(player.ID, threat)
		else
			target:setIndDmg(player.ID, threat)
		end
		
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	elseif (target.blType == BL_PC and player:canPK(target)) then
		player:sendAction(6, 20)
		player:setAether("manic_abyss", aether)
		player.health = player.health - healthCost
		player:sendStatus()
		player:sendMinitext("You cast Manic Abyss.")
		player:playSound(61)
		target:sendAnimation(416, 0)
		target.attacker = player.ID
		player.registry["manic_abyss"] = (target:removeHealthExtend(damage, 1, 1, 1, 1, 2) / 5)
		player:setDuration("manic_abyss", duration)
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		target:sendMinitext(player.name.." drains you through a manic abyss.")
	end
end,

while_cast = function(player)
	local heal = player.registry["manic_abyss"]
	
	player.attacker = player.ID
	player.magic = player.magic + heal
	player:sendStatus()
	--player:addManaExtend(heal)
end,

requirements = function(player)
	local level = 28
	local items = {}
	local itemAmounts = {}
	local description = {"Moderate scaling attack that siphons life from your target"}
	
	return level, items, itemAmounts, description
end
}