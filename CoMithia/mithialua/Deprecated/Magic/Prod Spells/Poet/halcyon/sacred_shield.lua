sacred_shield = {
cast = function(player, target)
	local aether = 60000
	local duration = 30000
	local shield = (player.maxHealth * .5)
	local healthCost = (player.health * .5)
	local magicCost = (player.magic * .25)
	local minHealth = 1000
	local minMagic = 250
	
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
	
	if (target.blType ~= BL_PC) then
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That cannot save them now.")
		return
	end
	
	if (target:hasDuration("sacred_shield")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("sacred_shield", aether)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Sacred Shield.")
	target:setDuration("sacred_shield", duration, player.ID)
	player:playSound(64)
	target:sendAnimation(265, 0)
	--323 shield
	--338 leaf bless
	--388 wheat armor?
	--391 lotus
	if (target.dmgShield >= 0) then
		target.dmgShield = shield
	else
		target.dmgShield = target.dmgShield + shield
	end
	
	if (target.blType == BL_PC) then
		target:sendMinitext(player.name.." provides a sacred shield.")
	end
end,

uncast = function(player, caster)
	local shield = (caster.maxHealth * .5)
	
	if (player.dmgShield - shield < 0) then
		player.dmgShield = 0
	else
		player.dmgShield = player.dmgShield - shield
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Uses your life force to place a scaling shield on a target"}
	
	return level, items, itemAmounts, description
end
}