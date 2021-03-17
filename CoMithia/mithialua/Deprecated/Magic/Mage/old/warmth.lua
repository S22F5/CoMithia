warmth = {
cast = function(player,target)

	if (player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	elseif (player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	elseif (player:hasDuration("warmth")) then
		player:sendMinitext("Spell is already cast.")
		return
	elseif (player.magic >= player.maxMagic) then
		player:sendMinitext("You have "..player.registry["spell_stored_mana"].." mana in store.")
		return
	end

	local stored_mana = player.registry["spell_stored_mana"]
	local amt = player.maxMagic - player.magic
	if (stored_mana >= amt) then
		player:addMana(amt)
		player.registry["spell_stored_mana"] = stored_mana - amt
		player:sendMinitext("You have "..player.registry["spell_stored_mana"].." mana in store.")
	else
		player:addMana(stored_mana)
		player.registry["spell_stored_mana"] = 0
	end
	player:setAether("warmth",120000)
	player:setDuration("warmth",6000)
end,

while_cast = function(player)
	local amt = 1 + (player.mRegenAmount * 1.275)
	player:addMana(amt)

end,


on_aethers = function(player)

	player:sendMinitext("You have "..player.registry["spell_stored_mana"].." mana in store.")
	
end,


uncast=function(player)

end,


recast=function(player)

end,

passive = function(player)

end,

while_passive = function(player)
	if (player.afk == 1) then
		return
	end
	
	if (player:hasAether("warmth")) then
		local dist = 2 + math.floor(player.will / 33)
		local nonmage = {}
		local magewith = {}
		local magewithout = {}
		for x = 1, #player.group do
			target = Player(player.group[x])
			if (target.id ~= player.id and distance(player, target) <= dist) then
				if (target.class == 3) then
					if (target.hasSpell("warmth")) then
						table.insert(magewith, target)
					else
						table.insert(magewithout, target)
					end
				else
					table.insert(nonmage, target)
				end
			end
		end
		local total = player.mRegenAmount + (player.mRegenAmount * .25 * #nonmage) + (player.mRegenAmount * .05 * #magewith) + (player.mRegenAmount * .001 * #magewithout)
		local left = math.floor(total) * (player.magic / player.maxMagic)
		local final = math.floor(left) / (#nonmage + #magewith + #magewithout)
		if (#nonmage + #magewith + #magewithout == 0) then
			final = left / 1
		end
		--player:talk(1,"Total: "..total.." Left: "..left.." Final: "..final)
		for x = 1, #nonmage do
			nonmage[x]:addMagic(math.floor(final * .5))
			--nonmage[x]:talk(0,"Healed Mana: "..(final * .5))
		end
		for x = 1, #magewith do
			magewith[x]:addMagic(math.floor(final * .15))
			--nonmage[x]:talk(0,"Healed Mana: "..(final * .15))
		end
		for x = 1, #magewithout do
			magewithout[x]:addMagic(math.floor(final * .1))
			--nonmage[x]:talk(0,"Healed Mana: "..(final * .1))
		end
		if (final * .015 > .3 and final * .015 < 1) then
			player:addMagic(1)
			--player:talk(0,"Healed Mana: "..(final * .015))
		else
			player:addMagic(math.floor(final * .015))
			--player:talk(0,"Healed Mana: "..(final * .015))
		end

		return--Aether, so no charging.
	end
	
	local stored_mana = player.registry["spell_stored_mana"]
	if ((stored_mana < 2100000000) and (stored_mana <= (player.maxMagic*3/4))) then
		player.registry["spell_stored_mana"] = stored_mana + math.floor(player.mRegenAmount/10) + 1
	else
		if ((player.timerInterval*2)%90==0) then --os.time()%90==0) then
			player:sendMinitext("You may not charge more mana.")
		end
	end
end,

passive_beforedamaged = function(player,attacker)

end,


passive_afterdamaged = function(player,attacker)

end,

on_takedamage = function(player,attacker)

end

}