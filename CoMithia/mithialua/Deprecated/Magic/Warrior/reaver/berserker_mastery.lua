berserker_mastery = {
	cast=function(player,target)
	
		if(player.magic<(player.maxMagic/3)) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
		if(player:hasDuration("berserker_mastery")) then
			player:sendMinitext("Berserker Mastery is already running.")
			return
		end
		if(player.rage>1) then
			player:sendMinitext("A rage spell is already running.")
			return
		end


		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Reavers may use this ability.")
			return
		end

		player:sendAction(6,35)
		player:playSound(31)
		player:sendAnimation(172)
		player:sendAnimation(349)
		player:addMana(-player.maxMagic/3)

		player.rage=3

		player.ac=player.ac+25

		if(player:hasDuration("suggestion")) then
			player:setDuration("berserker_mastery",15000)
		else
			player:setDuration("berserker_mastery",12000)
		end

		player:setAether("berserker_mastery",120000)	
		
		player:sendMinitext("You enter in a Berserker stance.")

	end,
	recast=function(player)
		player.rage=4
		player.ac=player.ac+25
	end,

	while_cast=function(player)
		local vita=player.maxHealth*5/100
		player:removeHealth(vita)
		player:sendAnimation(172)
	end,	

	uncast=function(player)
		player.rage=1
		player.ac=player.ac-25
		player:sendStatus()
	end,

	fix=function(player)
		player.ac=player.ac+25
		player.rage=4
	end
}
