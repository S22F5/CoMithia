mind_numbing_poison = {
cast = function(player,target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end
	
	if (player:hasAether("mind_numbing_poison") or player:hasDuration("mind_numbing_poison")) then
		player:sendMinitext("Can not use mind numbing poison yet.")
		return
	end
	
	player:setAether("mind_numbing_poison", 1000)
	--check items
	if (player:removeItem(1,1) == false) then
		player:sendMinitext("You must have a poison vial.")
		return
	end
	
	player:setDuration("mind_numbing_poison",18000)
	if (player:getEquippedItem(0) ~= nil) then
		player:sendMinitext("You carefully poison the tip of your weapon..")
		player.registry["spell_mind_numbing_poison"] = 2
	else
		player:sendMinitext("You spill the poison on your hands.")
		toxins.cast(player)
		player.registry["spell_mind_numbing_poison"] = 1
	end
	--player:sendAnimation(34)
end,

on_hit_while_cast = function(player, target)
	local level = player.level
	local will = player.will
	local willperc
	if (level >= 40) then
		willperc = will / 24
	else
		willperc = will / (0.6 * level)
	end
	local mRegenAmount = player.mRegenAmount
	local amt = mRegenAmount * willperc

	if (player:hasAether("mind_numbing_poison")) then
		return
	else
		if (target:hasDurationID("mind_numbing_poison", player.ID)) then
			amt = -2 * amt
			target:addMana(amt)
		else
			target:setDuration("mind_numbing_poison",5000,player.ID)
			--target:sendAnimation(302)
			player:setAether("mind_numbing_poison", 3000)
		end
	end
end,

while_cast = function(player, caster)
	if (player.ID ~= caster.ID) then
		local level = caster.level
		local will = caster.will
		local willperc
		if (level >= 40) then
			willperc = will / 24
		else
			willperc = will / (0.6 * level)
		end
		local mRegenAmount = caster.mRegenAmount
		local amt = mRegenAmount * willperc
		
		local tvra = player.vRegenAmount
		amt = amt + (tvra * 0.45)
		player:talk(2,""..amt)
		player:addMana(-amt)
	else
		local reg = player.registry["spell_mind_numbing_poison"]
		if (reg == 2) then
			if (player:getEquippedItem(0) == nil) then
				player:flushDurationNoUncast("mind_numbing_poison")
			end
		elseif (reg == 1) then
			if (player:getEquippedItem(0) ~= nil) then
				player:flushDurationNoUncast("mind_numbing_poison")
			end
		end
	end
end,

uncast = function(player)
	player:sendMinitext("The poison has run out.")
end
}