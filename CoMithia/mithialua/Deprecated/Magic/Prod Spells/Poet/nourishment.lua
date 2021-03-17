nourishment = {
on_learn = function(player)
	if (player:hasSpell("comfort")) then
		player:removeSpell("comfort")
	end
	
	if (player:hasSpell("remedy")) then
		player:removeSpell("remedy")
	end
	
	if (player:hasSpell("annoint")) then
		player:removeSpell("annoint")
	end
	
	player.registry["learned_comfort"] = 1
	player.registry["learned_remedy"] = 1
	player.registry["learned_annoint"] = 1
end,

cast = function(player, target)
	local heal = 4000
	local damage = heal / 2
	local threat
	local magicCost = 300
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That cannot save them now.")
		return
	end
	
	player:sendAction(6, 20)
	player:playSound(98)
	target:sendAnimation(166, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Nourishment.")
	
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
			target:sendMinitext(player.name.." ferociously nourishes you.")
		end
	else
		target.attacker = player.ID
		target:addHealthExtend(heal, 0, 0, 0, 0, 0)
			target:sendMinitext(player.name.." nourishes you.")
	end
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Very strong healing spell that allows you to heal others"}
	return level, items, itemAmounts, description
end
}