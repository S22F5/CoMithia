poison_strike = {
cast = function(player,target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end
	
	if (player:hasAether("poison_strike") or player:hasDuration("poison_strike")) then
		player:sendMinitext("Can not use poison strike yet.")
		return
	end
	
	player:setAether("poison_strike", 3000)
	--check items
	if (player:removeItem(1,1) == false) then
		player:sendMinitext("You must have a poison vial.")
		return
	end
	
	player:setDuration("poison_strike",120000)
	if (player:getEquippedItem(0) ~= nil) then
		player:sendMinitext("You carefully poison the tip of your weapon..")
		player.registry["spell_poison_strike"] = 2
	else
		player:sendMinitext("You spill the poison on your hands.")
		toxins.cast(player)
		player.registry["spell_poison_strike"] = 1
	end
	player:sendAnimation(34)
end,

on_hit_while_cast = function(player, target)
	if (player:hasAether("poison_strike")) then
		return
	else
		local mult = 1000
		local level = player.level
		
		local grace = player.grace
		local graceperc
		if (level >= 40) then--96
			graceperc = grace / 96 * mult--1.92
		else
			graceperc = grace / (2.4 * level) * mult
		end
		--[[Stat percent per level with cap limits]]--
		local might = player.might
		local mightperc
		if (level >= 40) then--96
			mightperc = might / 96--1.92
		else
			mightperc = might / (2.4 * player.level)
		end
		
		if (graceperc > math.random(mult)) then
			local vRegenA = player.vRegenAmount * 6
			local damage = player.damage * 1.1
			local amt = damage + (vRegenA * mightperc)
			target.attacker = player.ID
			target:sendAnimation(302)
			target:removeHealthExtend(amt, 1, 1, 0, 0, 0)
			--setAether
			player:setAether("poison_strike", 3000)
		end
	end
end,

on_aethers = function(player)
	local level = player.level
	local might = player.might
	local mightperc
	if (level >= 40) then--96
		mightperc = might / 96--1.92
	else
		mightperc = might / (2.4 * player.level)
	end
	local vRegenA = player.vRegenAmount * 6
	local damage = player.damage * 1.1
	local amt1 = damage + (vRegenA * mightperc)
	local mult = 1000
	local grace = player.grace
	local graceperc
	if (level >= 40) then--96
		graceperc = grace / 96 * mult--1.92
	else
		graceperc = grace / (2.4 * level) * mult
	end
	local amt2 = graceperc / 10
	player:sendMinitext("PS chance: "..amt2)
	player:sendMinitext("PS approx damage: "..math.floor(amt1))
end,

while_cast = function(player)
	local reg = player.registry["spell_poison_strike"]
	if (reg == 2) then
		if (player:getEquippedItem(0) == nil) then
			player:flushDurationNoUncast("poison_strike")
		end
	elseif (reg == 1) then
		if (player:getEquippedItem(0) ~= nil) then
			player:flushDurationNoUncast("poison_strike")
		end
	end
end,

uncast = function(player)
	player:sendMinitext("The poison has run out.")
end
}