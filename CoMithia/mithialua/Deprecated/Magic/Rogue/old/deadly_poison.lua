deadly_poison = {
cast = function(player,target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end
	
	if (player:hasAether("deadly_poison") or player:hasDuration("deadly_poison")) then
		player:sendMinitext("Can not use deadly_poison yet.")
		return
	end
	
	player:setAether("deadly_poison", 1000)
	--check items
	if (player:removeItem(1,1) == false) then
		player:sendMinitext("You must have a poison vial.")
		return
	end
	
	player:setDuration("deadly_poison",22000)
	if (player:getEquippedItem(0) ~= nil) then
		player:sendMinitext("You carefully poison the tip of your weapon..")
		player.registry["spell_deadly_poison"] = 2
	else
		player:sendMinitext("You spill the poison on your hands.")
		toxins.cast(player)
		player.registry["spell_deadly_poison"] = 1
	end
	--player:sendAnimation(34)
end,

on_hit_while_cast = function(player, target)
	local level = player.level
	local grace = player.grace
	local graceperc
	if (level >= 40) then
		graceperc = grace / 48
	else
		graceperc = grace / (1.2 * level)
	end
	local might = player.might
	local amt = might * graceperc

	if (player:hasAether("deadly_poison")) then
		return
	else
		if (target:hasDurationID("deadly_poison", player.ID)) then
			amt = (might * 1.5) + (2 * amt)
			target:addHealth(-amt)
		else
			target:setDuration("deadly_poison",9000,player.ID)
			--target:sendAnimation(302)
			player:setAether("deadly_poison", 3000)
		end
	end
end,

while_cast_250 = function(player, caster)
	if (player.ID ~= caster.ID) then
		local level = caster.level
		local grace = caster.grace
		local graceperc, tvra
		if (level >= 40) then
			graceperc = grace / 24
		else
			graceperc = grace / (0.6 * level)
		end
		local might = caster.might * 2
		local amt = might * graceperc
		if (player.blType == BL_PC) then
			tvra = (player.vRegenAmount * 0.15) + (caster.vRegenAmount / 1.2)
		else
			tvra = (player.maxHealth * 0.012 * 0.15) + (caster.vRegenAmount / 1.2)
		end
		amt = math.random(20,50) + amt + tvra + (player.maxHealth * 0.005)
		amt = amt / 4
		player:talk(2,""..amt)
		player:addHealth(-amt)
	else
		local reg = player.registry["spell_deadly_poison"]
		if (reg == 2) then
			if (player:getEquippedItem(0) == nil) then
				player:flushDurationNoUncast("deadly_poison")
			end
		elseif (reg == 1) then
			if (player:getEquippedItem(0) ~= nil) then
				player:flushDurationNoUncast("deadly_poison")
			end
		end
	end
end,

uncast = function(player)
	player:sendMinitext("The poison has run out.")
end
}