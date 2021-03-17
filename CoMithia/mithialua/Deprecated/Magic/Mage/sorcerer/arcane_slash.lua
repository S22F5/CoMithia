arcane_slash = {
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

		if(player.registry["currentspecialization"]==2) then
			damage=math.ceil(damage/10)
		end

		target.attacker=player.ID
		target:removeHealthExtend(damage/2, 1, 1, 1, 1, 0)
        	target:sendAnimation(120)
        	player:playSound(90)
		player:sendAction(6,35)
        	player:addMana(math.ceil(-player.maxMagic/100))

		if(player.ID~=target.ID) then
   			target:sendMinitext(""..player.name .." casts Arcane slash on you.")
		end

        	player:sendMinitext("You cast Arcane slash.")
       		player:sendAction(6,35)               
	end,

	requirements=function(player)
		local l=7
		local i={0,"chestnut","control_rune","squirrel_fur"}
		local ia={150,25,5,1}
		local d={"Arcane slash\n\nUse your magical force to slash an enemy","You shall have to sacrifice (25) Chesnuts, (5) Control rune and (1) Squirrel fur and 150 coins to learn this ability"}
		return l,i,ia,d
	end       
}