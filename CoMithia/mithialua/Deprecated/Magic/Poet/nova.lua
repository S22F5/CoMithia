nova = {
	cast=function(player,target)                     
		
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end


		if(player.magic<(player.maxMagic/10)) then
			player:sendMinitext("You do not have enough mana.")
			return
		end


		if(player.registry["currentspecialization"]==0) then
			player:sendMinitext("Only a poet with a Specialization may use this ability.")
			return
		end


		if(player.registry["currentspecialization"]==1) then

			if(player.group==nil) then
				player:sendMinitext("You must be in a group to use this ability")
				return
			end

			local absx=0
			local absy=0
			local dist=0
			local ta=player:getObjectsInArea(BL_PC)
			if(#ta>0) then
				for z=1,#ta do
					absx=math.abs(player.x-ta[z].x)
					absy=math.abs(player.y-ta[z].y)
					dist=absx+absy
		
					if(dist<=3) then
						if(ta[z].state~=1) then
							for g=1,#player.group do
								if(ta[z].ID==player.group[g]) then
									ta[z]:addHealth(player.magic*0.15)
									ta[z]:sendMinitext(player.name .." casts Nova on you.")
									ta[z]:sendAnimation(163)
								end
							end
						end
					end
				end
			end

		player:playSound(70)
		player:addMana(-player.maxMagic/10)
		player:setAether("nova",14000)
		player:sendMinitext("You cast Nova.")
                player:sendAction(6,45)  

		end



		if(player.registry["currentspecialization"]==2) then
			
			if(player.health<player.maxHealth/4) then
				player:sendMinitext("You are too weak to cast that")
				return
			end

			local targetcheck = {}

			local damage=(player.magic * .9)+(player.health*.2)
			damage=damage + (player.will * 50)
			local counttargets=0

			--Making a first pass to calculate the number of targets

			for x=player.x-5,player.x+5 do

				for y=player.y-5,player.y+5 do

					local xcheck=math.abs(player.x-x)
					local ycheck=math.abs(player.y-y)
					
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
			damage = damage / 2


			--Making a second pass to actually deal damage

			for x=player.x-5,player.x+5 do

				for y=player.y-5,player.y+5 do

					local xcheck=math.abs(player.x-x)
					local ycheck=math.abs(player.y-y)
					
					if((xcheck+ycheck)<=5) then

						targetcheck=player:getObjectsInCell(player.m,x,y,BL_MOB)
						if(#targetcheck>0) then
							for z=1,#targetcheck do
								targetcheck[z].attacker=player.ID
								targetcheck[z]:sendAnimation(344)
								targetcheck[z]:removeHealthExtend(damage, 1, 1, 1, 1, 0)

							end
						end
					end
				end
			end

			player:playSound(70)
			player:addMana(-player.maxMagic/10)
			player:removeHealth(player.maxHealth/4)

			if(player:hasDuration("suggestion")) then
				
				if(player.registry["currentspecialization"]==2) then
					player:setAether("nova",18000)
				else
					player:setAether("nova",10000)
				end
			else
				if(player.registry["currentspecialization"]==2) then
					player:setAether("nova",22000)
				else
					player:setAether("nova",14000)
				end
				
			end

			player:sendMinitext("You cast Nova.")
                	player:sendAction(6,45)  

		end





		            
        end,

	uncast=function(player)
	end,

	requirements=function(player)
		local l=87
		local i={0,464}
		local ia={5000,1}
		local d={"Healing blast\n\nCleric & Valkyr Spell\n\nA powerful area of effect ability. Will heal if you're a Cleric and Damage if you're a Valkyr.","You shall have to sacrifice (1) Focusing ring and 5000 coins to learn this ability"}
		return l,i,ia,d
	end       
}