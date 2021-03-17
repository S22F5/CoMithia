magic_shield = {
cast=function(player,target)

	if (player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if (player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end
	
	if (player:hasDuration("magic_shield")) then
		player:flushDuration(303)
		return
	end	

	local mMana = player.maxMagic
	local will = player.will
	local mana_cost = math.floor(50 + (mMana * 0.05) + (3.5 * will/5))
	local dura = 5 + math.floor(1.5 * will)
	local aether = 5 - math.floor(will/60)
	
	mana_cost = -1 * mana_cost
	
	dura = dura * 1000
	
	if (aether < 2) then
		aether = 2
	end

	aether = aether * 1000
		
	if(player.magic < math.abs(mana_cost)) then
		player:sendMinitext("You do not have enough Mana.")
		return
	end
	player:sendAction(6,35)
	--player:playSound(55)
	
	player:addMana(mana_cost)
	player:setAether("magic_shield",aether)
	player:setDuration("magic_shield",dura)
	if (player.dmgShield < (player.maxHealth * 0.75)) then
		player.dmgShield = math.floor(player.dmgShield + (will / 5))
	end
	player:sendMinitext("You enabled magic shield.")
	player:sendAnimation(323)--56 66 90 98 110 251 295 323
end,

uncast=function(player,caster)
	local ds = player.dmgShield
	player.dmgShield = ds - math.floor(ds * 0.1)
	player:setAether("magic_shield",2000)
	player:sendMinitext("Your magic shield is at: "..math.floor(player.dmgShield))
	player:sendAnimation(323,-1)
end,

while_cast = function(player,caster)
	local mana = player.magic
	local mMana = player.maxMagic
	local will = player.will
	local vita = player.health
	local mVita = player.maxHealth
	local ds = player.dmgShield
	local mana_cost = 2 + (mana * 0.01) + (mMana * 0.02) + (will / 12)
	mana_cost = mana_cost + (mVita * 0.007)
	mana_cost = -1 * math.floor(mana_cost)

	if(player.magic < math.abs(mana_cost)) then
		player:flushDuration(303)
		return
	end

	ds = math.floor(ds + (vita * 0.07)+(mVita * 0.03)+(will / 25))
	
	if (ds >= math.floor(mVita * 0.75)) then
		player.dmgShield = math.floor(mVita * 0.75)
		if (os.time() % 4 == 0) then
			player:sendMinitext("Magic shield has reached it's limit. ("..player.dmgShield..")")
		end
	elseif (ds < math.floor(mVita*0.75)) then
		player.dmgShield = ds
		player:addMana(mana_cost)
		player:sendAnimation(323,2)--56 66 90 98 110 251 295 323
		if (os.time() % 2 == 0) then
			player:sendMinitext("Magic shield: "..player.dmgShield)
		end
	end
	--player:talk(2,""..player.dmgShield.." "..mana_cost)
end,


on_aethers = function(player)
	player:sendMinitext("Magic Shield: "..player.dmgShield)
end
}
