ignite = {
on_learn = function(player)
	if (player:hasSpell("singe")) then
		player:removeSpell("singe")
	end
	
	player.registry["learned_singe"] = 1
end,

cast = function(player, target)
	local aether = 1000
	local damage = (player.level * 25 + (((.01 * player.magic) + (.01 * player.health)) / 2.25))
	local threat
	local healthCost = (.01 * player.maxHealth)
	local magicCost = (.01 * player.maxMagic)
	local minHealth = 100
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health < minHealth or player.health - healthCost <= 0) then
		player:sendMinitext("Not enough vita.")
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
	
	if (target.blType == BL_MOB) then
		player:sendAction(6, 20)
		--player:setAether("ignite", aether)
		player.health = player.health - healthCost
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:playSound(58)
	
		--if (checkProtection(player, target, 750)) then
		--	player:sendMinitext("Ignite has been deflected.")
		--else
			target:sendAnimation(29, 1)
			player:sendMinitext("You cast Ignite.")
			target.attacker = player.ID
			threat = target:removeHealthExtend(damage, 1, 1, 1, 1, 2)
			player:addThreat(target.ID, threat)
			
			if (#player.group > 1) then
				target:setGrpDmg(player.ID, threat)
			else
				target:setIndDmg(player.ID, threat)
			end
			
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		--end
	elseif (target.blType == BL_PC and player:canPK(target)) then
		player:sendAction(6, 20)
		player:setAether("ignite", aether)
		player.health = player.health - healthCost
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:playSound(58)
	
		--if (checkProtection(player, target, 750)) then
		--	player:sendMinitext("Ignite has been deflected.")
		--else
			target:sendAnimation(29, 1)
			player:sendMinitext("You cast Ignite.")
			target.attacker = player.ID
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			target:sendMinitext(player.name.." ignites you.")
		--end
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Moderate elemental attack that strikes a target"}
	return level, items, itemAmounts, description
end
}