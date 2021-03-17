quake = {
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

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Sorcerers may use this ability.")
			return
		end

		if(player.magic<(player.maxMagic/16)) then
			player:sendMinitext("You do not have enough mana.")
			return
		end


		local xcheck=0
		local ycheck=0
		local damage=(player.magic*0.33)

		if(player.will>100) then
			damage=damage*player.will/100
		end

		local counttargets=0

		if(player.health<=player.maxHealth/8) then
			player:sendMinitext("You are too weak to use this ability.")
			return
		end

		if(target.blType==BL_MOB) then

			player:playSound(47)
			local targetcheck = {}

			--Making a first pass to calculate the number of targets

			for x=target.x-7,target.x+7 do

				for y=target.y-7,target.y+7 do

					local xcheck=math.abs(target.x-x)
					local ycheck=math.abs(target.y-y)
					
					if((xcheck+ycheck)<=7) then

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

			for x=target.x-7,target.x+7 do

				for y=target.y-7,target.y+7 do

					local xcheck=math.abs(target.x-x)
					local ycheck=math.abs(target.y-y)
					
					if((xcheck+ycheck)<=5) then

						targetcheck=player:getObjectsInCell(player.m,x,y,BL_MOB)
						if(#targetcheck>0) then
							for z=1,#targetcheck do
								targetcheck[z].attacker=player.ID
								targetcheck[z]:sendAnimation(400)
								targetcheck[z]:removeHealthExtend(damage, 1, 1, 1, 1, 0)

							end
						end
					end
				end
			end


			player:sendAction(6,35)
			player:sendMinitext("You cast Quake.")
			player:removeHealth(player.maxHealth/8)
			player:addMana(-player.maxMagic/16)


			if(player:hasDuration("suggestion")) then
				player:setAether("quake",4000)
			else
				player:setAether("quake",6000)
			end
		
		end

		if(target.blType==BL_PC) then
			player:sendMinitext("Something went wrong")
			return
		end




        end,
	requirements=function(player)
		local l=25
		local i={0,5,66,27}
		local ia={250,100,2,1}
		local d={"Quake\n\nSorcerer spell\n\nMake the Earth quake around your target, damaging enemies in the area and exhausting yourself","You shall sacrifice (100) Chestnut, (2) Amethyst, (1) Magical powder and 250 coins to learn this ability"}
		return l,i,ia,d
	end 
          
}