thor_wrath = {

	cast=function(player,target)

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Sorcerers may use this ability.")
			return
		end

		if(target.state==1) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(player.magic<100) then
			player:sendMinitext("You do not have enough mana.")
			return
		end


		local damage = ((player.magic*0.9)+(player.health*0.1))

		local xabscheck=math.abs(player.x-target.x)
		local yabscheck=math.abs(player.y-target.y)


		local distcheck=xabscheck+yabscheck
		local extrarange=1
	
		if(distcheck>6) then
			extrarange=distcheck-6
			extrarange=extrarange*10
			damage=damage-(damage*extrarange/100)

			if(damage<1) then
				damage=1
			end
			
		end

		if(target.blType==BL_MOB) then

			if(player:hasDuration("manipulate")) then
				player:setAether("thor_wrath",20000)
			else
				player:setAether("thor_wrath",25000)
			end

			player:sendAction(6,35)
			player:playSound(81)
			target:sendAnimation(346)
			player:sendMinitext("You cast Thor's wrath.")
			target.attacker=player.ID
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			player:addMana(-player.magic*0.9)
			
			if(player.health<player.magic*0.1) then
				player:removeHealth2(player.health-100)
			else
				player:removeHealth2(player.magic*0.1)
			end
		end






		if(target.blType==BL_PC) then
			if(player.pvp==true) then

				target.attacker=player.ID
				if(player:hasDuration("manipulate")) then
					player:setAether("thor_wrath",20000)
				else
					player:setAether("thor_wrath",25000)
				end
				target:sendMinitext(player.name .. " casts Thor's wrath on you.")
				player:sendAction(6,35)
				player:playSound(81)
                		target:sendAnimation(346)
				player:sendMinitext("You cast Thor's wrath.")
				target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				player:addMana(-player.magic*0.9)


				if(player.health<player.magic*0.1) then
					player:removeHealth2(player.health-100)
				else
					player:removeHealth2(player.magic*0.1)
				end
			else
				player:sendMinitext("Something went wrong.")
			end
		end
	end 
}