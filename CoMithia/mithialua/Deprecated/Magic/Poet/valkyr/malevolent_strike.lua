malevolent_strike = {
	cast=function(player,target)        

                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		if(target.blType==BL_PC and target.state==1) then
			player:sendMinitext("Your target is already dead.")
			return
		end

		if(target.blType==BL_PC and player.pvp==false) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end


		if(player.magic<math.ceil(player.maxMagic/100)) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
         
		damage = player.maxMagic * .062
		damage = damage + player.will * 5
		damage = damage * 1.2

		if(player.registry["currentspecialization"]==1) then
			damage=math.ceil(damage/10)
		end

		target.attacker=player.ID
		target:removeHealthExtend(damage/2, 1, 1, 1, 1, 0)
        	target:sendAnimation(395)
        	player:playSound(90)
			player:sendAction(6,35)
        	player:addMana(math.ceil(-player.maxMagic/100))

		if(player.ID~=target.ID) then
   			target:sendMinitext(""..player.name .." casts Malevolent strike on you.")
		end

        	player:sendMinitext("You cast Malevolent strike.")
       		player:sendAction(6,35)               
	end,

	requirements=function(player)
		local l=8
		local i={0,"chestnut","fox_fur"}
		local ia={150,50,1}
		local d={"Malevolent strike\n\nUses great magic to strike a foe","You shall have to sacrifice (50) Chesnuts, (1) Fox fur and 150 coins to learn this ability"}
		return l,i,ia,d
	end       
}