bandage = {
	cast=function(player,target)

		if(player.magic<player.maxMagic/3) then
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

		if(player.registry["currentspecialization"]~=2) then
			player:sendMinitext("Only Champions may use this ability.")
			return
		end

		
		local healamount = 0
		local calcac = 1

		if(player.ac<0) then
			calcac = math.abs(player.ac)
		end

		if(calcac>1) then
			healamount = (player.maxMagic/2) * (calcac/100)
		else
			healamount = (player.maxMagic/4)
		end

		player:sendAction(6,35)
		player:addMana(-player.maxMagic/3)
		player:sendAnimation(63)
		player:addHealth()
		player:setAether("bandage",26000)
		player:sendMinitext("You apply a bandage on your wounds.")

	end,

	requirements=function(player)
		local l=31
		local i={0,5,27}
		local ia={1000,100,1}
		local d={"Bandage\n\nChampion spell\n\n Use magic to heal one's wounds","You shall sacrifice (100) Chestnut, (1) Magical powder and 1000 coins to learn this ability."}
		return l,i,ia,d
	end
}