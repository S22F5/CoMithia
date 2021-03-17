double_edge = {
cast = function(player,target)
	--Player state
	if (player.state~=0) then
		player:sendMinitext("You can not use this at this moment.")
		return
	end

	local magic = player.magic
	local will = player.will
	local grace = player.grace
	local mana_cost = (magic * 0.01) - (magic * 0.008 * (will/100)) + grace + 45
	mana_cost = math.ceil(mana_cost)
	
	if (magic < mana_cost) then
		player:sendMinitext("Not enough mana.")
		return
	end	
	
	mana_cost = -1 * mana_cost


	--Get Target
	local target = getTargetFacing(player, BL_PC)
		if (target == nil) then
			target = getTargetFacing(player, BL_MOB)
			if (target == nil) then
				return
			end
		end
	
	--Check for PvP options
	if ((target.blType == BL_PC) and (player.blType == BL_PC)) then
		if ((target.pvp == 0) and (player:getPK(target.id) == false)) then
			return
		end
	end

	local level = player.level
	local health = player.health
	local mHealth = player.maxHealth
	local bMight = player.baseMight
	local might = player.might
	local mightDif = might - bMight
	local aether = 8 + math.floor(grace / 20) - math.floor(will/15)
	if (aether < 2) then
		aether = 2
	end
	aether = aether * 1000
	
	local amt = (health * 0.015) + (mHealth * 0.01)
	amt = amt + (mightDif * 0.007 * health) + ((might / 1.2) * (level / 5))
	amt = amt + ((health * 0.002) * (player.registry["spell_raging"] / 2.5) * (might / 11))
	amt = math.floor(amt)
	player:addMana(mana_cost)
	player:setAether("double_edge", aether)
	player:talk(0,""..amt)
	player:sendAction(1,40)
	player:playSound(9)
	player.attacker = player.ID
	player:removeHealthExtend(amt, 1, 0, 1, 1, 0)
	player:sendAnimation(307)
	target:sendAnimation(306)
	target.attacker = player.ID
	target:removeHealthExtend(amt, 1, 0, 1, 1, 0)
end
}