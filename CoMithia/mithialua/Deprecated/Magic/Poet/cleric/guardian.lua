guardian = {
	cast=function(player,target)
                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.magic<player.maxMagic/20) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Clerics may use this ability.")
			return
		end
		
		if(target.state==1) then
			player:sendMinitext("He's dead, you creep.")
			return
		end

		if(target:hasDuration("guardian")==true) then
			player:sendMinitext("Guardian is already running")
			return
		end		

		if(target:hasDuration("runic")==true or target:hasDuration("empower")==true or target:hasDuration("evade")==true or target:hasDuration("will")==true or target:hasDuration("ice_ward")==true or target:hasDuration("magical_ward")==true or target:hasDuration("minor_shielding")==true or target:hasDuration("holy_protection")==true) then
			player:sendMinitext("Single buffs are already running.")
			return
		end

			target.deduction=0.7
			target:sendAnimation(71)
			target:sendAnimation(110)
			player:playSound(77)
			player:addMana(-player.maxMagic/20)
			player:sendMinitext("You cast Guardian.")
			target:sendMinitext(""..player.name.." casts Guardian on you.")
			target:setDuration("guardian",600000)
			target:sendStatus()
			return


             
        end,

	uncast=function(player)

		if(player:hasDuration("stone_skin")) then
			player.deduction=0.01
	        else
			player.deduction=0
		end

		player:sendStatus()
		
	end,

	recast=function(player)
		player.deduction=0.7
		player:sendStatus()
	end,
	fix=function(player)
		player.deduction=0.7
		player:sendStatus()
	end     
}