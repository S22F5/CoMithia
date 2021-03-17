regenerate = {
cast = function(player, target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end

	local vcost = player.maxHealth * 0.05
	local mcost = 60 + (player.maxMagic * 0.01)
	
	if (vcost > player.health) or (mcost > player.magic) then
		player:sendMinitext("You are not strong enough.")
		return
	else
		player:addMana(-mcost)
		player:addHealth2(-vcost)
	end
		
	local casterID, class1, class2, amt1, amt2
	
	if (target:hasDuration("regenerate")) then
		casterID = target:getCasterID("regenerate")
		player2 = Player(casterID[1])--NEEDS A NIL CHECK FOR OFFLINE
		if (player2 ~= nil) then
			class1 = player.class
			class2 = player2.class
			if (class1 == 1) then
				amt1 = regenerate.warrior_health(player)
			elseif (class1 == 3) then
				amt1 = regenerate.mage_health(player)
			elseif (class1 == 4) then
				amt1 = regenerate.poet_health(player)
			end
			
			if (class2 == 1) then
				amt2 = regenerate.warrior_health(player2)
			elseif (class2 == 3) then
				amt2 = regenerate.mage_health(player2)
			elseif (class2 == 4) then
				amt2 = regenerate.poet_health(player2)
			end
			
			if (amt1 >= amt2) then
				target:flushDurationNoUncast(406)
				target:setDuration("regenerate", 80000, player.ID)
			end
		end
	else
		target:setDuration("regenerate", 80000, player.ID)
	end
	
	local amt = 0
	player:setAether("regenerate", 8000)
	
	if (player.baseClass == 1) then
		amt = (player.level / 50) * 10 * (player.will + (player.might / 10))
	elseif (player.baseClass == 3) then
		amt = (player.level / 50) * 10 * player.will
	elseif (player.baseClass == 4) then
		amt = (player.level / 50) * 10 * player.will
	end
	
	if (amt > 0) then
		target:addHealth(amt)
	end
end,

while_cast_250 = function(player, caster)
	local health = caster.health
	local mHealth = caster.maxHealth
	local mMagic = caster.maxMagic
	local vRA, amt
	if (caster.baseClass == 1) then
		amt = regenerate.process(player, caster, regenerate.warrior_health(caster))
	elseif (caster.baseClass == 3) then
		amt = regenerate.process(player, caster, regenerate.mage_health(caster))
	elseif (caster.baseClass == 4) then
		amt = regenerate.process(player, caster, regenerate.poet_health(caster))
	else
		player:flushDurationNoUncast("regenerate")
	end
	player:addHealth2(amt)
	--Post portion
end,

process = function(player, caster, vRA)
	local health = caster.health
	local mHealth = caster.maxHealth
	local vcount = 0
	
	if (health >= mHealth) then
		player.registry["spell_regenerate_vRA"] = 0
		return
	end
	--Vita portion
	if (player.registry["spell_regenerate_vRA"] >= 1000) then
		repeat
			player.registry["spell_regenerate_vRA"] = player.registry["spell_regenerate_vRA"] - 1000
			vcount = vcount + 1
		until player.registry["spell_regenerate_vRA"] < 1000
	end
	
	if (vRA < 1) then
		player.registry["spell_regenerate_vRA"] = player.registry["spell_regenerate_vRA"] + (vRA * 1000)
	else
		repeat
			vRA = vRA - 1
			vcount = vcount + 1
		until vRA < 1
		player.registry["spell_regenerate_vRA"] = player.registry["spell_regenerate_vRA"] + (vRA * 1000)
		if (player.registry["spell_regenerate_vRA"] >= 1000) then
			player.registry["spell_regenerate_vRA"] = player.registry["spell_regenerate_vRA"] - 1000
			vcount = vcount + 1
		end
	end
	
	if (vcount >= 1) then
		return vcount
	end
end,


mage_health = function(caster)
	local health = caster.health
	local mHealth = caster.maxHealth
	local mMagic = caster.maxMagic
	local vRA
	vRA = ((mMagic * 0.03) + (mHealth * 0.07)) / 160
	return vRA
end,

poet_health = function(caster)
	local health = caster.health
	local mHealth = caster.maxHealth
	local mMagic = caster.maxMagic
	local vRA = ((mMagic * 0.04) + (mHealth * 0.08)) / 160
	return vRA
end,

warrior_health = function(caster)
	local health = caster.health
	local mHealth = caster.maxHealth
	local mMagic = caster.maxMagic
	local vRA = ((mMagic * 0.07) + (mHealth * 0.03)) / 160
	return vRA
end,

uncast = function(player)
	player:sendMinitext("The regeneration effect has worn off.")
end
}