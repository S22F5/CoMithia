susurrate = {--susurrus
cast = function(player)
	--Player state
	if (player.state~=0) then
		player:sendMinitext("You can not use this at this moment.")
		return
	end
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
	
	
	local health = player.health
	local mHealth = player.maxHealth
	local magic = player.magic
	local mMagic = player.maxMagic
	local tMagic = target.magic
	local will = player.will
	local twill = target.will
	local tmcost = (target.magic*0.025)
		if (tmcost > (mMagic * 0.9)) then
			tmcost = mMagic * 0.9
		end
	local sHealth = mHealth - health
	local vRegenAmount = player.vRegenAmount
	local mCost = math.floor(tmcost + (health * 0.01) + math.random(50,70))
	local vCost = math.floor((health * 0.095) + (sHealth * 0.015) + (vRegenAmount * 1.25) + (math.random(5,15)))

	if ((health < vCost) or (magic < mCost)) then
		player:sendMinitext("You lack the power to cast this.")
		return
	end
	
	local pProtect = player.protection
	local tProtect = target.protection
	local protect = tProtect - math.floor(pProtect/10)

	if (math.random(50) <= protect) then
		player:sendMinitext("The spell has been deflected.")
		player:setAether("susurrate",1000)
		return
	end
	
	local aether = 3000
	local dura = (12 + math.floor(will/25) - math.floor(twill/50))
		if (dura < 1) then
			dura = 1000
		else
			dura = dura * 1000
		end
	local famount = (mHealth * 0.01) + (sHealth * 0.10) + (magic * 0.0003 * will)


	
	player:setAether("susurrate",aether)
	if (target:hasDuration("susurrus")) then
		target.registry["spell_susurrus"] = target.registry["spell_susurrus"] + 10
	else
		target:setDuration("susurrus",dura,player.ID)
	end
	target.registry["spell_susurrus"] = target.registry["spell_susurrus"] + 10

	if ((target.blType == BL_PC) and (player.blType == BL_PC))then
		player:msg(0,''..player.name..'('..player.className..')" *murmurs*',target.ID)
	elseif (target.blType == BL_PC) then
		player:msg(0,''..player.name..' *murmurs*',target.ID)
	end
	
	local susurrus = math.floor(target.registry["spell_susurrus"] / 10)
	famount = famount + (famount * 0.25 * susurrus)
	
	if (susurrus == 5) then
		famount = famount + (famount * 0.25)
		target:sendAnimation(364)
	elseif (susurrus == 9) then
		famount = famount + (famount * 0.35)
		target:sendAnimation(364)
	end
	
--50 phrase, 90 sentence	
	--[[animations
	12 16 34 71 76 88 109 115 125 136 145 170 173(deflect)
	194(scream from hell) 205-220 258 291 294 295-297
	308 318 334 344 364-366 381 393
	]]--
	local ani = math.random(205,220)
	target:sendAnimation(ani)
	player:addMana(-mCost)
	player:removeHealth(vCost)
	--player:talk(1,"Player: "..vCost)
	--target:talk(1,"Target: "..famount)
	target.attacker = player.ID
	target:removeHealthExtend(famount, 1, 0, 0, 1, 0)
end,


uncast = function(player)
end
}