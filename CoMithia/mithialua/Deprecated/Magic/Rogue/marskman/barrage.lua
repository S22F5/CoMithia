barrage = {

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

		if(player.magic<(player.maxMagic/8)) then
			player:sendMinitext("You do not have enough mana.")
			return
		end


		local xcheck=0
		local ycheck=0
		local damage=(player.health+(player.magic/4))*player.grace/130
		local counttargets=0

		if(player.health<=player.maxHealth/4) then
			player:sendMinitext("You are too weak to use this ability.")
			return
		end

		if(target.blType==BL_MOB) then

			player:playSound(94)
			player:talk(2,"~Suppressing fire~")

			local targetcheck = {}

			--Making a first pass to calculate the number of targets

			for x=target.x-5,target.x+5 do

				for y=target.y-5,target.y+5 do

					local xcheck=math.abs(target.x-x)
					local ycheck=math.abs(target.y-y)
					
					if((xcheck+ycheck)<=5) then

						targetcheck=player:getObjectsInCell(player.m,x,y,BL_MOB)
						if(#targetcheck>0) then
							counttargets=counttargets+#targetcheck
						end
					end
				end
			end

			if counttargets==0 then
				counttargets=1
			end

			--Divide overall Damage by number of targets
			damage=damage/counttargets


			--Making a second pass to actually deal damage

			for x=target.x-5,target.x+5 do

				for y=target.y-5,target.y+5 do

					local xcheck=math.abs(target.x-x)
					local ycheck=math.abs(target.y-y)
					
					if((xcheck+ycheck)<=5) then

						targetcheck=player:getObjectsInCell(player.m,x,y,BL_MOB)
						if(#targetcheck>0) then
							for z=1,#targetcheck do
								targetcheck[z].attacker=player.ID
								targetcheck[z]:sendAnimation(303)
								targetcheck[z]:removeHealthExtend(damage, 1, 1, 1, 1, 0)

							end
						end
					end
				end
			end


			player:sendAction(6,35)
			player:sendMinitext("You cast Barrage.")
			player:removeHealth(player.maxHealth/4)
			player:addMana(-player.maxMagic/8)


			if(player:hasDuration("suggestion")) then
				player:setAether("barrage",8000)
			else
				player:setAether("barrage",12000)
			end
		
		end

		if(target.blType==BL_PC) then
			player:sendMinitext("Something went wrong")
			return
		end

		end 
}