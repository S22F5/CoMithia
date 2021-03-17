arcane_bomb = {
	cast=function(player,target)

                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
                end
		if(player.state==3) then
			player:sendMinitext("You cannot cast this spell on a mount.")
			return
		end
		if(target.state==1) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Sorcerers may use this ability.")
			return
		end

		if(target:hasDuration("arcane_bomb")==true) then
			player:sendMinitext("The spell is already active")
			return
		end

		if(target.blType==BL_PC and player.pvp==false) then
			player:sendMinitext("Something went wrong")
			return
		end
		if(player.magic<=player.maxMagic/4) then
			player:sendMinitext("You do not have enough Mana.")
			return
		end


		target:setDuration("arcane_bomb",8000,player.ID)
		target:sendAnimation(208)

        	player:sendAction(6,35)

	        player:playSound(48)
	        player:addMana(-player.maxMagic/4)
	        player:setAether("arcane_bomb",8000)


        end,

	uncast=function(player,caster)

		local damage= caster.maxMagic * 0.4

		if(caster.will>100) then
			damage=damage*caster.will/100
		end

		if(player.blType==BL_MOB and caster.m~=player.m) then
			return
		end

		player.attacker=caster.ID
		player:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		player:sendAnimation(195)

	end,

	while_cast = function(player,caster)

		player:talk(2,"~pssschhhh...~")

	end,


	requirements=function(player)
		local l=75
		local i={0,"chestnut","control_rune","vial_of_blood"}
		local ia={3500,50,5,1}
		local d={"Arcane bomb\n\nSorcerer Spell\n\nCreate an Arcane bomb and attach it to a foe. The bomb will charge then detonate.","You shall sacrifice (50) Chestnut, (5) Control rune, (1) Vial of blood and 3500 coins to learn this ability"}
		return l,i,ia,d
	end 
          
}
