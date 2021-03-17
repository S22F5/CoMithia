zap = {
cast=function(player,target)

	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end

	player:setDuration("zap",120000,player.ID)
	local zap = math.floor(player.registry["zap"] / 3)
	local rand = math.random(zap,(1+player.registry["zap"]))
	local damage = 20 + (player.registry["zap"] * math.random(5,7))
	damage = damage + (zap * 11) --changed player.registry["zap"] to zap
	damage = damage + (rand * (player.will/13)) 
	damage = damage + (rand * (player.will/7))
	local mana_cost
	if (player.registry["zap"] == 0) then
		mana_cost = math.ceil(player.will/2)
	else
		mana_cost = (player.will * player.registry["zap"])
	end
	
	if(player.magic < math.abs(mana_cost)) then
		player:sendMinitext("You do not have enough Mana.")
		return
	end
	
	if(player:hasDuration("zap")) then
		--player:talk(0,"True")
	else
		--player:talk(0,"False")
		--player:setDuration("zap",12000,0,player.ID)
		if (player:hasDuration("zap")==true) then
			--player:talk(0,"Duration true")
		else
			--player:talk(0,"Duration false")
		end
		player:sendAnimation(12)
	end
	
	if(target.blType==BL_PC and player.pvp==0) then
		player:sendMinitext("Something went wrong")
		return
	end
	
	player:sendAction(6,35)
	player:playSound(55)
	
	if (zap >= 10) then
		target:sendAnimation(4)
		target:sendAnimationXY(290,target.x+1,target.y)
		target:playSound(59)
		target:playSound(7)
	elseif ((zap >= 100) and (zap <= 200)) then	
		target:sendAnimation(4)
		target:sendAnimationXY(290,target.x+1,target.y)
		target:playSound(58)
		target:playSound(7)
	elseif ((zap >= 74) and (zap <= 99)) then	
		target:sendAnimation(30)
		target:sendAnimation(290)
		target:playSound(57)
		target:playSound(7)
	elseif ((zap >= 49) and (zap <= 73)) then	
		target:sendAnimation(29)
		target:sendAnimation(290)
		target:playSound(56)
		target:playSound(7)
	elseif ((zap >= 24) and (zap <= 48)) then	
		target:sendAnimation(29)
		target:sendAnimation(290)
		target:playSound(55)
		target:playSound(7)
	elseif ((zap >= 13) and (zap <= 23)) then	
		target:sendAnimation(28)
		target:sendAnimation(290)
		target:playSound(55)
		target:playSound(7)
	elseif ((zap >= 6) and (zap <= 12)) then	
		target:sendAnimation(4)
		target:playSound(58)
	elseif ((zap == 4) or (zap == 5)) then	
		target:sendAnimation(30)
		target:playSound(57)
	elseif ((zap == 2) or (zap == 3)) then	
		target:sendAnimation(29)
		target:playSound(56)
	elseif (zap == 1 ) then	
		target:sendAnimation(28)
		target:playSound(55)	else--0
		target:sendAnimation(27)
	end

	player:removeMagic(mana_cost)
	player:setAether("zap",1000)
	
	player.registry["zap"] = math.floor(player.registry["zap"] / 3)
	zap = math.floor(player.registry["zap"] / 3)
	player:sendMinitext("You cast zap. Charges left: "..zap)

	target.attacker=player.ID
	target:removeHealthExtend(damage, 0, 0, 0, 1, 0)
	
end,

uncast=function(player,caster)
	local damage = player.registry["zap"] * 3

	if (player.registry["zap"] >= 300) then
		player:sendAnimation(143)
	elseif (player.registry["zap"] > 6) then
		player:sendAnimation(27)
	else
		return
	end
		player:removeHealthExtend(damage, 0, 0, 0, 1, 0)
end,

while_cast = function(player,caster)
	--player:talk(2,"Zap "..player.registry["zap"])
	local zap = math.floor(caster.registry["zap"] / 3)
	
	if ((player.maxMagic/2) <= (player.will * (player.registry["zap"] + 1))) then--changed 5 to will
		player:sendAnimation(290)
	end
	
	if (player.magic >= (player.will * (player.registry["zap"] + 1))) then
		player.registry["zap"] =  player.registry["zap"] + 1
		if (math.floor(caster.registry["zap"] / 3)%3 == 0) then
			player:sendMinitext("Zap charges: "..zap)
		end
	else
		if (player.registry["zap"] > 0) then
			player.registry["zap"] =  player.registry["zap"] - 1
		end
		if (os.time()%2 == 0) then
			player:sendMinitext("Maximum Zap charges: "..math.floor(player.registry["zap"] / 3))
		end
	end
end          
}
