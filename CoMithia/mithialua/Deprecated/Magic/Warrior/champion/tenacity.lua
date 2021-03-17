tenacity = {
	cast=function(player,target)
	if(player:hasDuration("tenacity")) then
		player:sendMinitext("You already cast that.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end

	if(player.registry["currentspecialization"]~=2) then
		player:sendMinitext("Only Champions may use this ability.")
		return
	end

	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	
		player:sendAction(6,35)
		player:addMana(-90)
		player:playSound(31)
		player:sendAnimation(416)
		player.maxHealth=player.maxHealth*1.25
		player:sendStatus()	
		player:addHealth(player.maxHealth*0.25)
		player:setDuration("tenacity",22000)
		player:setAether("tenacity",160000)
		player:sendMinitext("You cast Tenacity.")
	end,
	recast=function(player)
		player.maxHealth=player.maxHealth*1.25
		player:sendStatus()
	end,
	uncast=function(player)
		player.maxHealth=player.maxHealth/1.25
		player:sendStatus()
	end,
	fix=function(player)
		player.maxHealth=player.maxHealth*1.25
		player:sendStatus()
	end
}