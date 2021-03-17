bloodline = {
cast = function(player,target)
	player:sendMinitext("Bloodlines can not be cast.")
end,

passive_on_hit = function(player,target)
end,


passive_on_takedamage = function(player,attacker)
end,


while_passive = function(player)
	local a = player.registry["bloodline_a"]
	local b = player.registry["bloodline_b"]
	
	if (a == 0) and (b == 0) then
		return--No bloodline.
	end
	
	local level = player.level
	local bmight = player.baseMight
	local bwill = player.baseWill
	local bgrace = player.baseGrace
	local might = player.might
	local will = player.will
	local grace = player.grace
	local bhealth = player.baseHealth
	local bmagic = player.baseMagic
	local mhealth = player.maxHealth
	local mmagic = player.maxMagic
	local health = player.health
	local magic = player.magic
	local mightperc
	if (level >= 40) then
		mightperc = might / 96
	else
		mightperc = might / (2.4 * level)
	end	
	local willperc
	if (level >= 40) then
		willperc = will / 96
	else
		willperc = will / (2.4 * level)
	end
	local graceperc
	if (level >= 40) then
		graceperc = grace / 96
	else
		graceperc = grace / (2.4 * level)
	end
	local ds = player.dmgShield
	local pd = player.physDeduct
	local vRA = player.vRegenAmount
	local mRA = player.mRegenAmount
	
	
--[[End declarations]]--	
	
--[[Start bloodlines]]--
	if (a == 1) or (b == 1) then--Regenerative DS
		if (health/mhealth < 0.15) and (ds < mhealth * 0.15) then
			player.dmgShield = ds + math.floor(0.02084 * mhealth)
		end
	elseif (a == 2) or (b == 2) then--Regenerative DS Type 2
		if (health/mhealth < 0.15) and (ds < mhealth * 0.15) then
			player.dmgShield = ds + vRA
		end
	elseif (a == 3) or (b == 3) then--Regenerative DS Type 3
		if (health/mhealth < 0.15) and (ds < mhealth * 0.15) then
			player.dmgShield = ds + math.floor(0.02084 * mmagic)
		end
	elseif (a == 4) or (b == 4) then--Regenerative DS Type 4
		if (health/mhealth < 0.15) and (ds < mhealth * 0.15) then
			player.dmgShield = ds + mRA
		end
	elseif (a == 5) or (b == 5) then--Regenerative DS Type 5
		if (magic/mmagic < 0.15) and (ds < mmagic * 0.15) then
			player.dmgShield = ds + math.floor(0.02084 * mmagic)
		end
	elseif (a == 6) or (b == 6) then--Regenerative DS Type 6
		if (magic/mmagic < 0.15) and (ds < mmagic * 0.15) then
			player.dmgShield = ds + mRA
		end
	elseif (a == 7) or (b == 7) then--
	elseif (a == 8) or (b == 8) then--
	elseif (a == 9) or (b == 9) then--
	elseif (a == 10) or (b == 10) then--
	elseif (a == 11) or (b == 11) then--
	elseif (a == 12) or (b == 12) then--	
	end
end,


uncast=function(player)
end,


while_cast = function(player)
end
}