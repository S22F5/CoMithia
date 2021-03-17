heavens_kiss = {
	cast=function(player,target)         
                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
                if(target.state~=1) then
			player:sendMinitext("The target is already alive.")
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

		if(player.magic<150) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		player:addMana(-150)
		if(target.state==1) then
			target.state=0
			target:addHealth2(target.maxHealth/10)
			target:updateState()
			target:sendStatus()
			target:sendMinitext(player.name .." casts Heaven's kiss and ressucitates you.")
			player:sendMinitext("You cast Heaven's kiss.")
		end

		target:sendAnimation(96)
		target:playSound(112)
		player:sendAction(6,35)
		player:setAether("heavens_kiss",600000)

	end


}