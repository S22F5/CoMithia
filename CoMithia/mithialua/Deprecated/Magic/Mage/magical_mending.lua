magical_mending = {

		cast=function(player,target)

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.magic<50) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		if(player:hasDuration("magical_mending")) then
			player:sendMinitext("Magical mending is already active")
			return
		end

		player:sendAction(6,35)
		player:sendAnimation(107)
                player:playSound(40)
                player:setAether("magical_mending",25000)
                player:setDuration("magical_mending",12000)
		player:sendMinitext("You cast Magical mending.")
		end,

		while_cast=function(player)
			if(player.state==1) then
				return
			end
		local vit
		vit=player.maxMagic*0.03
		player:sendAnimation(107)
		player:addHealth2(vit)
		end,


		on_takedamage=function(target)
			target:setDuration("magical_mending",0)
			target:sendMinitext("Magical mending ends.")
                end     
}

