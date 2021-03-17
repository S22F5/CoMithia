tenebrae = {

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

		if(player.magic<100) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		if(player.registry["currentspecialization"]~=2) then
			player:sendMinitext("Only Valkyrs may use this ability.")
			return
		end
		
		local damage = ((player.magic))
		

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
				player:setAether("tenebrae",24000-(player.will/20*1000))
			else
				player:setAether("tenebrae",28000-(player.will/20*1000))
			end

			player:sendAction(6,35)
			player:playSound(81)
			target:sendAnimation(198)
			player:sendMinitext("You cast Tenebrae.")
			target.attacker=player.ID
			target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			player:addMana(-player.magic*0.9)
			
			if(player.health<player.magic*0.2) then
				player:removeHealth2(player.health-100)
			else
				player:removeHealth2(player.magic*0.2)
			end
		end






		if(target.blType==BL_PC) then
			if(player.pvp==true) then

				target.attacker=player.ID
				if(player:hasDuration("manipulate")) then
					player:setAether("tenebrae",18000)
				else
					player:setAether("tenebrae",22000)
				end
				target:sendMinitext(player.name .. " casts Tenebrae on you.")
				player:sendAction(6,35)
				player:playSound(81)
                		target:sendAnimation(198)
				player:sendMinitext("You cast Tenebrae.")
				if(player.registry["currentspecialization"]==1) then
					damage = damage / 3
				end
				target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				player:addMana(-player.magic*0.8)
				

				if(player.health<player.magic*0.2) then
					player:removeHealth2(player.health-100)
				else
					player:removeHealth2(player.magic*0.2)
				end
			else
				player:sendMinitext("Something went wrong.")
			end
		end
	end,


	requirements=function(player)
		local l=99
		local i={0,"wisdom_of_gods"}
		local ia={10000,1}
		local d={"Tenebrae\n\nValkyr Spell\n\nConjure your strengths to unleash a devastating attack on a foe","You shall have to sacrifice (1) Wisdom of gods and 10000 coins to learn this ability"}
		return l,i,ia,d
	end       
}