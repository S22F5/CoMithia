jewelcrafting_desk = {
	click=async(function(player,npc)

		local opts = {}
		local optscurrent = { }
		local t={graphic=convertGraphic(1093,"monster"),color=0}

                player.npcGraphic=t.graphic
		player.npcColor=t.color

	if(player.registry["jewelcrafteractive"]==0) then
			player:dialogSeq({t,"You are currently not a Jewelcrafter."})
			return
	end


	if(player:hasItem("shining_amethyst",5) == true) then
		table.insert(opts,"Shining amethyst")
	end
	if(player:hasItem("shining_chrysocolla",5) == true) then
		table.insert(opts,"Shining chrysocolla")
	end
	if(player:hasItem("shining_tigers_eye",5) == true) then
		table.insert(opts,"Shining tiger's eye")
	end
	
	
	
	
	
	if(player.registry["recipeamethystring"]==1) then
		table.insert(opts,"Amethyst ring")
	end
	if(player.registry["recipeamethysttrinket"]==1) then
		table.insert(opts,"Amethyst trinket")
	end
	if(player.registry["recipeamethystnecklace"]==1) then
		table.insert(opts,"Amethyst necklace")
	end
	if(player.registry["recipechrysocollaring"]==1) then
		table.insert(opts,"Chrysocolla ring")
	end
	if(player.registry["recipechrysocollatrinket"]==1) then
		table.insert(opts,"Chrysocolla trinket")
	end
	if(player.registry["recipechrysocollanecklace"]==1) then
		table.insert(opts,"Chrysocolla necklace")
	end
	if(player.registry["recipetigerseyering"]==1) then
		table.insert(opts,"Tiger's eye ring")
	end
	if(player.registry["recipetigerseyetrinket"]==1) then
		table.insert(opts,"Tiger's eye trinket")
	end
	if(player.registry["recipetigerseyenecklace"]==1) then
		table.insert(opts,"Tiger's eye necklace")
	end

	
	if(player.registry["recipemallysdesire"]==1) then
		table.insert(opts,"Mally's desire")
	end
	if(player.registry["recipeblackpendant"]==1) then
		table.insert(opts,"Black pendant")
	end
	if(player.registry["recipearchaicnecklace"]==1) then
		table.insert(opts,"Archaic necklace")
	end
	if(player.registry["recipebarbedchoker"]==1) then
		table.insert(opts,"Barbed choker")
	end

	table.insert(opts,"I do not have any processed gem to work on")

	local b=0
	local l=math.random(1,player.registry["gemcutter"]+1)
	local k=player.registry["gemcutter"]+1

	if(l/k>0.33) then b=1 end
	if(l/k>0.66) then b=2 end
	if(l/k>0.85) then b=3 end

		local craftlevel="Beginner"
		if(player.registry["jewelcrafter"]>=1 and player.registry["jewelcrafter"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["jewelcrafter"]>=25 and player.registry["jewelcrafter"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["jewelcrafter"]>=220 and player.registry["jewelcrafter"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["jewelcrafter"]>=840 and player.registry["jewelcrafter"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["jewelcrafter"]>=2200 and player.registry["jewelcrafter"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["jewelcrafter"]>=6400 and player.registry["jewelcrafter"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["jewelcrafter"]>=18000 and player.registry["jewelcrafter"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["jewelcrafter"]>=50000 and player.registry["jewelcrafter"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["jewelcrafter"]>=124000 and player.registry["jewelcrafter"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["jewelcrafter"]>=237000 and player.registry["jewelcrafter"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["jewelcrafter"]>=400000 and player.registry["jewelcrafter"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["jewelcrafter"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("jewelcrafter")
		player:addLegend(""..craftlevel.." jewelcrafter","jewelcrafter",106,128)	


	local choice=player:menuString2("Hello, "..player.name..", Which kind of processed gems do you wish to work on?",opts)
		
		if(choice=="Shining amethyst" and player:hasItem("shining_amethyst",5) == true) then
			local t=math.random(1,100)
			local r=math.random(1,3)
			r=r+b
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["jewelcrafter"]<220) then
				if(t<=75) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>75) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=220 and player.registry["jewelcrafter"]<840) then
				if(t<=70) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>70) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=840 and player.registry["jewelcrafter"]<2200) then
				if(t<=65) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>65) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=2200 and player.registry["jewelcrafter"]<6400) then
				if(t<=60) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>60) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=6400 and player.registry["jewelcrafter"]<18000) then
				if(t<=55) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>55) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=18000 and player.registry["jewelcrafter"]<50000) then
				if(t<=50) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>50) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=50000 and player.registry["jewelcrafter"]<124000) then
				if(t<=45) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>45) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=124000 and player.registry["jewelcrafter"]<237000) then
				if(t<=40) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>40) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=237000 and player.registry["jewelcrafter"]<400000) then
				if(t<=35) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>35) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=400000 and player.registry["jewelcrafter"]<680000) then
				if(t<=30) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>30) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=680000) then
				if(t<=25) then
					player:removeItem("shining_amethyst",5)
					player:dialogSeq({t,"Your attempt at working on the Shining amethyst crushed it to fine dust."})
					return
				elseif(t>25) then
					player:removeItem("shining_amethyst",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			end













		elseif(choice=="Shining chrysocolla" and player:hasItem("shining_chrysocolla",5) == true) then
			local t=math.random(1,100)
			local r=math.random(1,3)
			r=r+b
			if(player.registry["jewelcrafter"]<2200) then
				player:dialogSeq({t,"You are not experienced enough to work on Shining chrysocollas"})
				return
			end
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["jewelcrafter"]>=2200 and player.registry["jewelcrafter"]<6400) then
				if(t<=75) then
					player:removeItem("shining_chrysocolla",5)
					player:dialogSeq({t,"Your attempt at working on the Shining chrysocolla crushed it to fine dust."})
					return
				elseif(t>75) then
					player:removeItem("shining_chrysocolla",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=6400 and player.registry["jewelcrafter"]<18000) then
				if(t<=70) then
					player:removeItem("shining_chrysocolla",5)
					player:dialogSeq({t,"Your attempt at working on the Shining chrysocolla crushed it to fine dust."})
					return
				elseif(t>70) then
					player:removeItem("shining_chrysocolla",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=18000 and player.registry["jewelcrafter"]<50000) then
				if(t<=65) then
					player:removeItem("shining_chrysocolla",5)
					player:dialogSeq({t,"Your attempt at working on the Shining chrysocolla crushed it to fine dust."})
					return
				elseif(t>65) then
					player:removeItem("shining_chrysocolla",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=50000 and player.registry["jewelcrafter"]<124000) then
				if(t<=60) then
					player:removeItem("shining_chrysocolla",5)
					player:dialogSeq({t,"Your attempt at working on the Shining chrysocolla crushed it to fine dust."})
					return
				elseif(t>60) then
					player:removeItem("shining_chrysocolla",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=124000 and player.registry["jewelcrafter"]<237000) then
				if(t<=55) then
					player:removeItem("shining_chrysocolla",5)
					player:dialogSeq({t,"Your attempt at working on the Shining chrysocolla crushed it to fine dust."})
					return
				elseif(t>55) then
					player:removeItem("shining_chrysocolla",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=237000 and player.registry["jewelcrafter"]<400000) then
				if(t<=50) then
					player:removeItem("shining_chrysocolla",5)
					player:dialogSeq({t,"Your attempt at working on the Shining chrysocolla crushed it to fine dust."})
					return
				elseif(t>50) then
					player:removeItem("shining_chrysocolla",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=400000 and player.registry["jewelcrafter"]<680000) then
				if(t<=45) then
					player:removeItem("shining_chrysocolla",5)
					player:dialogSeq({t,"Your attempt at working on the Shining chrysocolla crushed it to fine dust."})
					return
				elseif(t>45) then
					player:removeItem("shining_chrysocolla",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=680000) then
				if(t<=40) then
					player:removeItem("shining_chrysocolla",5)
					player:dialogSeq({t,"Your attempt at working on the Shining chrysocolla crushed it to fine dust."})
					return
				elseif(t>40) then
					player:removeItem("shining_chrysocolla",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			end








		elseif(choice=="Shining tiger's eye" and player:hasItem("shining_tigers_eye",5) == true) then
			local t=math.random(1,100)
			local r=math.random(1,3)
			r=r+b
			if(player.registry["jewelcrafter"]<18000) then
				player:dialogSeq({t,"You are not experienced enough to work on Shining tiger's eyes"})
				return
			end
			player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
			player:sendStatus()
			if(player.registry["jewelcrafter"]>=18000 and player.registry["jewelcrafter"]<50000) then
				if(t<=75) then
					player:removeItem("shining_tigers_eye",5)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>75) then
					player:removeItem("shining_tigers_eye",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=50000 and player.registry["jewelcrafter"]<124000) then
				if(t<=70) then
					player:removeItem("shining_tigers_eye",5)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>70) then
					player:removeItem("shining_tigers_eye",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=124000 and player.registry["jewelcrafter"]<237000) then
				if(t<=65) then
					player:removeItem("shining_tigers_eye",5)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>65) then
					player:removeItem("shining_tigers_eye",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=237000 and player.registry["jewelcrafter"]<400000) then
				if(t<=60) then
					player:removeItem("shining_tigers_eye",5)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>60) then
					player:removeItem("shining_tigers_eye",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=400000 and player.registry["jewelcrafter"]<680000) then
				if(t<=55) then
					player:removeItem("shining_tigers_eye",5)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>55) then
					player:removeItem("shining_tigers_eye",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			elseif(player.registry["jewelcrafter"]>=680000) then
				if(t<=50) then
					player:removeItem("shining_tigers_eye",5)
					player:dialogSeq({t,"Your attempt at working on the Tiger's eye crushed it to fine dust."})
					return
				elseif(t>50) then
					player:removeItem("shining_tigers_eye",5)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+r
					player:addItem("experience_gem",1)
				end
			end







































		elseif(choice=="Amethyst ring") then
			player:dialogSeq({t,"Amethyst ring:\n\nA basic ring.",t,"Requires:\n\n-Novice Jewelcrafter\n-2 Shining amethyst\n-10 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=25 and player:hasItem("shining_amethyst",2) == true and player.money>=10) then
					player:removeItem("shining_amethyst",2)
					player.money=player.money-10
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("amethyst_ring",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end
		elseif(choice=="Amethyst trinket") then
			player:dialogSeq({t,"Amethyst trinket:\n\nA basic trinket.",t,"Requires:\n\n-Novice Jewelcrafter\n-2 Shining amethyst\n-10 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=25 and player:hasItem("shining_amethyst",2) == true and player.money>=10) then
					player:removeItem("shining_amethyst",2)
					player.money=player.money-10
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("amethyst_trinket",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end
		elseif(choice=="Amethyst necklace") then
			player:dialogSeq({t,"Amethyst necklace:\n\nA basic necklace.",t,"Requires:\n\n-Novice Jewelcrafter\n-2 Shining amethyst\n-10 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=25 and player:hasItem("shining_amethyst",2) == true and player.money>=10) then
					player:removeItem("shining_amethyst",2)
					player.money=player.money-10
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("amethyst_necklace",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end
				
				
		elseif(choice=="Chrysocolla ring") then
			player:dialogSeq({t,"Chrysocolla ring:\n\nA more powerful ring.",t,"Requires:\n\n-Apprentice Jewelcrafter\n-2 Shining chrysocolla\n-50 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=220 and player:hasItem("shining_chrysocolla",2) == true and player.money>=50) then
					player:removeItem("shining_chrysocolla",2)
					player.money=player.money-50
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("chrysocolla_ring",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end
		elseif(choice=="Chrysocolla trinket") then
			player:dialogSeq({t,"Chrysocolla trinket:\n\nA more powerful trinket.",t,"Requires:\n\n-Apprentice Jewelcrafter\n-2 Shining chrysocolla\n-50 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=220 and player:hasItem("shining_chrysocolla",2) == true and player.money>=50) then
					player:removeItem("shining_chrysocolla",2)
					player.money=player.money-50
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("chrysocolla_trinket",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end
		elseif(choice=="Chrysocolla necklace") then
			player:dialogSeq({t,"Chrysocolla necklace:\n\nA more powerful necklace.",t,"Requires:\n\n-Apprentice Jewelcrafter\n-2 Shining chrysocolla\n-50 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=220 and player:hasItem("shining_chrysocolla",2) == true and player.money>=50) then
					player:removeItem("shining_chrysocolla",2)
					player.money=player.money-50
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("chrysocolla_necklace",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end				

		elseif(choice=="Tiger's eye ring") then
			player:dialogSeq({t,"Tiger's eye ring:\n\nA powerful ring.",t,"Requires:\n\n-Accomplished Jewelcrafter\n-2 Shining tiger's eye\n-100 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=840 and player:hasItem("shining_tigers_eye",2) == true and player.money>=100) then
					player:removeItem("shining_tigers_eye",2)
					player.money=player.money-100
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("tigers_eye_ring",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end
		elseif(choice=="Tiger's eye trinket") then
			player:dialogSeq({t,"Tiger's eye trinket:\n\nA powerful trinket.",t,"Requires:\n\n-Accomplished Jewelcrafter\n-2 Shining tiger's eye\n-100 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=840 and player:hasItem("shining_tigers_eye",2) == true and player.money>=100) then
					player:removeItem("shining_tigers_eye",2)
					player.money=player.money-100
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("tigers_eye_trinket",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end				
		elseif(choice=="Tiger's eye necklace") then
			player:dialogSeq({t,"Tiger's eye necklace:\n\nA powerful necklace.",t,"Requires:\n\n-Accomplished Jewelcrafter\n-2 Shining tiger's eye\n-100 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=840 and player:hasItem("shining_tigers_eye",2) == true and player.money>=100) then
					player:removeItem("shining_tigers_eye",2)
					player.money=player.money-100
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("tigers_eye_necklace",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end				
				
				
		elseif(choice=="Mally's desire") then
			player:dialogSeq({t,"Mally's desire:\n\nA necklace representing Mally's love for Dhaar.",t,"Requires:\n\n-Accomplished Jewelcrafter\n-25 Soulstones\n-20 Shining Chrysocollas\n-10 Shining Amethysts\n-5 Experience gems\n-5000 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=840 and player:hasItem("soulstone",25) == true and player:hasItem("shining_amethyst",10) == true and player:hasItem("shining_chrysocolla",20) == true and player:hasItem("experience_gem",5) == true and player.money>=5000) then
					player:removeItem("soulstone",25)
					player:removeItem("shining_chrysocolla",20)
					player:removeItem("shining_amethyst",10)
					player:removeItem("experience_gem",5)
					player.money=player.money-5000
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("mallys_desire",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end
		elseif(choice=="Black pendant") then
			player:dialogSeq({t,"Black pendant:\n\nA rogue pendant infused with darkness.",t,"Requires:\n\n-Accomplished Jewelcrafter\n-25 Soulstones\n-20 Shining Chrysocollas\n-10 Shining Amethysts\n-5 Experience gems\n-5000 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=840 and player:hasItem("soulstone",25) == true and player:hasItem("shining_amethyst",10) == true and player:hasItem("shining_chrysocolla",20) == true and player:hasItem("experience_gem",5) == true and player.money>=5000) then
					player:removeItem("soulstone",25)
					player:removeItem("shining_chrysocolla",20)
					player:removeItem("shining_amethyst",10)
					player:removeItem("experience_gem",5)
					player.money=player.money-5000
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("black_pendant",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end
		elseif(choice=="Archaic necklace") then
			player:dialogSeq({t,"Archaic necklace:\n\nA archaic necklace for mages.",t,"Requires:\n\n-Accomplished Jewelcrafter\n-25 Soulstones\n-20 Shining Chrysocollas\n-10 Shining Amethysts\n-5 Experience gems\n-5000 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=840 and player:hasItem("soulstone",25) == true and player:hasItem("shining_amethyst",10) == true and player:hasItem("shining_chrysocolla",20) == true and player:hasItem("experience_gem",5) == true and player.money>=5000) then
					player:removeItem("soulstone",25)
					player:removeItem("shining_chrysocolla",20)
					player:removeItem("shining_amethyst",10)
					player:removeItem("experience_gem",5)
					player.money=player.money-5000
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("archaic_necklace",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end
		elseif(choice=="Barbed choker") then
			player:dialogSeq({t,"Barbed choker:\n\nA barbed warrior choker.",t,"Requires:\n\n-Accomplished Jewelcrafter\n-25 Soulstones\n-20 Shining Chrysocollas\n-10 Shining Amethysts\n-5 Experience gems\n-5000 coins\n\nto be crafted."},1)
				if(player.registry["jewelcrafter"]>=840 and player:hasItem("soulstone",25) == true and player:hasItem("shining_amethyst",10) == true and player:hasItem("shining_chrysocolla",20) == true and player:hasItem("experience_gem",5) == true and player.money>=5000) then
					player:removeItem("soulstone",25)
					player:removeItem("shining_chrysocolla",20)
					player:removeItem("shining_amethyst",10)
					player:removeItem("experience_gem",5)
					player.money=player.money-5000
					player:sendStatus()
					local r=math.random(1,2)
					player.registry["jewelcrafter"]=player.registry["jewelcrafter"]+(r*2)
					player:addItem("barbed_choker",1)
					player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
					player:sendStatus()
				else
					player:dialogSeq({t,"You do not meet the requirements!"})
				end







	

			


		--[[

			Put other Gems than amethyst here.
		--]]

	
								
		

		end
		player:sendAnimation(312)						
	
		
	end)
}
