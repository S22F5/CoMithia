throw_knife = {
on_learn = function(player)
	if (player:hasSpell("throw_rock")) then
		player:removeSpell("throw_rock")
	end
	
	player.registry["learned_throw_rock"] = 1
end,

cast = function(player, target)
	local damage = 100
	local threat
	local aether = 5000
	local magicCost = 20
	
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
	
	if (target.state == 1) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	player:sendAction(2, 20)
	player:setAether("throw_knife", aether)
	player:sendMinitext("You cast Throw Knife.")
	player:playSound(104)
	
	if (target.blType == BL_MOB) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:throw(target.x, target.y, 3393, 0, 2)
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
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:throw(target.x, target.y, 3393, 0, 2)
		target.attacker = player.ID
		target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		target:sendMinitext(player.name.." throws a knife at you.")
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"A moderate strike from distance"}
	return level, items, itemAmounts, description
end
}