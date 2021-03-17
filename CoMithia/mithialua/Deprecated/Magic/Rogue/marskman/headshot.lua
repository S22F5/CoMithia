headshot = {

		cast=function(player,target)

			if(player.state==1) then
				player:sendMinitext("Spirits can't do that.")
				return
			end
			if(player.state==3) then
				player:sendMinitext("You can not cast this spell on a mount.")
				return
			end
			if(target.state==1) then
				player:sendMinitext("Something went wrong.")
				return
			end
	
			if(player.registry["currentspecialization"]~=2) then
				player:sendMinitext("Only Marksmen may use this ability.")
				return
			end
	
			if(player.magic<100) then
				player:sendMinitext("You do not have enough mana.")
				return
			end

			if(player.pvp==false and target.blType==BL_PC) then
				player:sendMinitext("Something went wrong")
				return
			end


			local damage=((player.health*0.5)+(player.magic))
			damage=damage+(damage*player.hit/100)
			damage=damage+(damage*player.dam/100)

			target.attacker=player.ID
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			target:sendAnimation(398)
			target:sendAnimation(405)
			player:sendAction(6,35)
			player:sendMinitext("You cast Headshot.")
			player:removeHealth(math.floor(player.health/2))
			player:addMana(-player.magic)


			if(player:hasDuration("manipulate")) then
				player:setAether("headshot",17000)
			else
				player:setAether("headshot",22000)
			end
		
		end

}