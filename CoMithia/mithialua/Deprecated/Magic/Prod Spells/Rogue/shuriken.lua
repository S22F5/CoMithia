shuriken = {
on_learn = function(player)
	if (player:hasSpell("throw_rock")) then
		player:removeSpell("throw_rock")
	end
	
	if (player:hasSpell("throw_knife")) then
		player:removeSpell("throw_knife")
	end
	
	player.registry["learned_throw_rock"] = 1
	player.registry["learned_throw_knife"] = 1
end,

cast = function(player, target)
	local damage = 250
	local threat
	local aether = 5000
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
	
	player:sendAction(2, 20)
	player:setAether("shuriken", aether)
	player:sendMinitext("You cast Shuriken.")
	player:playSound(104)
	
	if (target.blType == BL_MOB) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		target:sendAnimation(120, 0)
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
		if (target.state == 1) then
			player:sendMinitext("That is no longer useful.")
			return
		end
		player.magic = player.magic - magicCost
		player:sendStatus()
		target:sendAnimation(120, 0)
		target.attacker = player.ID
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		target:sendMinitext(player.name.." throws a shuriken at you.")
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