second_wind = {
	cast=function(player,target)
       
                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		if(target.state==1) then
			player:sendMinitext("The injuries are too deep to be healed this way.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Clerics may use this ability.")
			return
		end


		if(player.magic<player.maxMagic/3) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		if(target:hasDuration("second_wind")==true) then
			player:sendMinitext("Second wind is already running.")
			return
		end

		player:setAether("second_wind",45000)
                target:sendAnimation(194)
                player:playSound(83)
                player:addMana(-player.maxMagic/3)

		if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Second wind on you.")
		end  

                player:sendMinitext("You cast Second wind.")
		target:setDuration("second_wind",10000,player.ID)
                player:sendAction(6,35)               
        end,


	while_cast = function(player,caster)

		if(player.health<=(player.maxHealth*0.20)) then

			player:addHealth(player.maxHealth/2)
			caster:addMana(caster.maxMagic/6)
			player:sendAnimation(173)
			caster:sendAnimation(166)
			player:setDuration("second_wind",0,player.ID)
			player:sendStatus()

		end

	end,

	requirements=function(player)
		local l=92
		local i={0,"shackles"}
		local ia={5000,1}
		local d={"Second wind\n\nCleric Spell\n\nSpecicially made to heal your target in critical conditions","You shall have to sacrifice (1) Shackles and 5000 coins to learn this ability"}
		return l,i,ia,d
	end       
}