curative_salve = {
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
			player:sendMinitext("Only Clerics may use this ability.")
			return
		end

		if(player.magic<(player.maxMagic/10)) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		if(player.group==nil) then
			player:sendMinitext("You must be in a group to use this ability")
			return
		end

		local ratio=1
		local idsave=0
		local absx=0
		local absy=0
		local dist=0



		for k=1,3 do

		
			ratio=1
			idsave=0


			local ta=player:getObjectsInArea(BL_PC)
			if(#ta>0) then
				for z=1,#ta do
					absx=math.abs(player.x-ta[z].x)
					absy=math.abs(player.y-ta[z].y)
					dist=absx+absy

					if(dist<=7) then
						if(ta[z].state~=1) then
							for g=1,#player.group do
								if(ta[z].ID==player.group[g]) then
									if((ta[z].health/ta[z].maxHealth)<ratio) then
										ratio=(ta[z].health/ta[z].maxHealth)
										idsave=ta[z].ID
									end
			
								end
							end
						end
					end
				end
			end

			if(idsave==0) then
				idsave=player.ID
			end

			
			Player(idsave):addHealth((player.maxMagic/4)/k)
			Player(idsave):sendAnimation(425)
		end


		player:addMana(-player.maxMagic/10)
		player:playSound(70)


		local aether = 12000

		if(player.level<80) then
			aether=12000
		end

		if(player.level>=80 and player.level<99) then
			aether=10000
		end

		if(player.level>=99) then
			aether=8000
		end


		player:setAether("curative_salve",aether)
		player:sendMinitext("You cast Curative salve.")
                player:sendAction(6,45)   

            
        end,


	uncast=function(player)
	end,


	requirements=function(player)
		local l=64
		local i={0,"chestnut","vial_of_blood"}
		local ia={3000,50,5}
		local d={"Curative salve\n\nCleric Spell\n\nA healing spell that will automatically target your weakest party member(s).","You shall have to sacrifice (50) Chestnut, (5) Vials of Blood and 3000 coins to learn this ability"}
		return l,i,ia,d
	end       
}