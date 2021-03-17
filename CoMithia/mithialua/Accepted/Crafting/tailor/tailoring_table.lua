tailoring_table = {

	click = async(function(player,npc)
		local t={graphic=convertGraphic(744,"monster"),color=0}
		local tFail={graphic=convertGraphic(36,"item"),color=0}
		local typeOpts = {"Tailor shields", "Tailor clothes", "Tailor skirts", "Tailor mantles", "Tailor draperies", "Tailor fans", "Forget Tailoring"}
		local itemToCraft
		local craftLevel
		local levelBonus
		local shields = { }
		local fans = { }
		local clothes = { }
		local skirts = { }
		local mantles = { }
		local draperies = { }
		local craftCount = 0
		
		player.npcGraphic=t.graphic
		player.npcColor=t.color
		player.dialogType = 0
		
		if (player.registry["professionalTailor"] == 250) then
			craftCount = craftCount + 1
		end
		
		if (player.registry["professionalForester"] == 250) then
			craftCount = craftCount + 1
		end
		
		if (player.registry["professionalSmith"] == 250) then
			craftCount = craftCount + 1
		end
	
		if (player.registry["professionalStylist"] == 250) then
			craftCount = craftCount + 1
		end
		
		if (player.registry["professionalTailor"] == 0 and craftCount < 2) then
			local options = {"Yes", "No"}
			local choice = player:menuString("Would you like to become a tailor?", options)
			
			if (choice == "Yes") then
				player.registry["professionalTailor"] = 250
			else
				player:dialogSeq({t, "Very well then, maybe another time."}, 1)
				return
			end
		elseif (player.registry["professionalTailor"] == 0) then
			player:removeLegendbyName("tailor")
			player.registry["tailor"] = 0
			player:dialogSeq({t, "I'm sorry, but you can only have a maximum of two crafts. Please forget one if you would like to start tailoring."}, 1)
			return
		end
		
		if(player.registry["tailor"]>=0) then
			craftlevel="Beginner"
			levelBonus = 0
			table.insert(clothes, "Spring clothes")
			table.insert(skirts, "Spring skirt")
			table.insert(mantles, "Spring mantle")
			table.insert(draperies, "Spring drapery")
		end
		
		if(player.registry["tailor"]>=20) then
			craftlevel="Novice"
			levelBonus = 1
			table.insert(clothes, "Summer clothes")
			table.insert(skirts, "Summer skirt")
			table.insert(mantles, "Summer mantle")
			table.insert(draperies, "Summer drapery")

		end
		
		if(player.registry["tailor"]>=40) then
			craftlevel="Apprentice"
			levelBonus = 2
			table.insert(clothes, "Autumn clothes")
			table.insert(skirts, "Autumn skirt")
			table.insert(mantles, "Autumn mantle")
			table.insert(draperies, "Autumn drapery")
			
			table.insert(fans, "Waxing moon fan") 

		end
		if(player.registry["tailor"]>=80) then
			craftlevel="Accomplished"
			levelBonus = 3
			table.insert(clothes, "Winter clothes")
			table.insert(skirts, "Winter skirt")
			table.insert(mantles, "Winter mantle")
			table.insert(draperies, "Winter drapery")

			table.insert(fans, "Dragon fan") 
		end
		if(player.registry["tailor"]>=160) then
			craftlevel="Adept"
			levelBonus = 4
			table.insert(shields, "Preservative")
			table.insert(shields, "Balance")
			table.insert(clothes, "Celestial clothes")
			table.insert(skirts, "Celestial skirt")
			table.insert(mantles, "Celestial mantle")
			table.insert(draperies, "Celestial drapery")
			
			table.insert(fans, "Gilded blade fan") 
		end
		if(player.registry["tailor"]>=320) then
			craftlevel="Talented"
			levelBonus = 5
			table.insert(shields, "Preservative (Elite)")
			table.insert(shields, "Balance (Elite)")
			table.insert(clothes, "Lunar clothes")
			table.insert(skirts, "Lunar skirt")
			table.insert(mantles, "Lunar mantle")
			table.insert(draperies, "Lunar drapery")
			table.insert(fans, "Deadly blade fan")
		end
		if(player.registry["tailor"]>=640) then
			craftlevel="Skilled"
			levelBonus = 6
			table.insert(clothes, "Solar clothes")
			table.insert(skirts, "Solar skirt")
			table.insert(mantles, "Solar mantle")
			table.insert(draperies, "Solar drapery")
			
		end
		if(player.registry["tailor"]>=1280) then
			craftlevel="Expert"
			levelBonus = 7
		end
		if(player.registry["tailor"]>=2560) then
			craftlevel="Master"
			levelBonus = 8
		end
		if(player.registry["tailor"]>=5120) then
			craftlevel="Grand Master"
			levelBonus = 9
		end
		if(player.registry["tailor"]>=10240) then
			craftlevel="Champion"
			levelBonus = 10
		end
		if(player.registry["tailor"]>=20480) then
			craftlevel="Legendary"
			levelBonus = 11
		end
		table.insert(shields, "Nevermind")
		table.insert(fans, "Nevermind")
		table.insert(clothes, "Nevermind")
		table.insert(skirts, "Nevermind")
		table.insert(mantles, "Nevermind")
		table.insert(draperies, "Nevermind")
		
		player:removeLegendbyName("tailor")
		player:addLegend(""..craftlevel.." tailor","tailor",63,128)	
		
		local typeChoice = player:menuString("What will you craft?", typeOpts)
		
		if (typeChoice == "Tailor shields") then
			itemToCraft = player:menuString("What type of shield would you like to craft?", shields)
		elseif(typeChoice == "Tailor fans") then
			itemToCraft = player:menuString("What type of fan would you like to tailor?", fans)
		elseif(typeChoice == "Tailor clothes") then
			itemToCraft = player:menuString("What type of clothes would you like to tailor?", clothes)
		elseif(typeChoice == "Tailor skirts") then
			itemToCraft = player:menuString("What type of skirt would you like to tailor?", skirts)
		elseif(typeChoice == "Tailor mantles") then
			itemToCraft = player:menuString("What type of mantle would you like to tailor?", mantles)
		elseif(typeChoice == "Tailor draperies") then
			itemToCraft = player:menuString("What type of drapery would you like to tailor?", draperies)
		elseif (typeChoice == "Forget Tailoring") then
			local options = {"Yes", "No"}
			local choice = player:menuString("Are you absolutely sure you wish to forget tailoring? This will erase all skill you have earned thus far.", options)
			
			if (choice == "Yes") then
				player:dialogSeq({t, "Visit the Legendary Artisan.\n\nHe is usually around the market near East gate Areci Mesuv."}, 1)
				--[[player.registry["professionalTailor"] = 0
				player.registry["tailor"] = 0
				player:removeLegendbyName("tailor")]]--
			else
				player:dialogSeq({t, "Not quite ready to give it up, eh?"}, 1)
				return
			end
		end
		
		
	--Shields	
	if(itemToCraft == "Preservative") then
		local itemName = "preservative"
		local itemNameY = "preservative"
		local itemNameRareY = "preservative"
		local cost1 = 18
		local mat1 = "cloth"
		local mat1y = "cloth"
		local cost2 = 4
		local mat2 = "golden cloth"
		local mat2y = "golden_cloth"
		local craftLevel = 4
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		tailoring_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Balance") then
		local itemName = "balance"
		local itemNameY = "balance"
		local itemNameRareY = "balance"
		local cost1 = 18
		local mat1 = "cloth"
		local mat1y = "cloth"
		local cost2 = 4
		local mat2 = "golden cloth"
		local mat2y = "golden_cloth"
		local craftLevel = 4
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		tailoring_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Preservative (Elite)") then
		local itemName = "preservative (elite)"
		local itemNameY = "preservative_elite"
		local itemNameRareY = "preservative_elite"
		local cost1 = 27
		local mat1 = "cloth"
		local mat1y = "cloth"
		local cost2 = 6
		local mat2 = "golden cloth"
		local mat2y = "golden_cloth"
		local craftLevel = 5
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		tailoring_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Balance (Elite)") then
		local itemName = "balance (elite)"
		local itemNameY = "balance_elite"
		local itemNameRareY = "balance_elite"
		local cost1 = 27
		local mat1 = "cloth"
		local mat1y = "cloth"
		local cost2 = 6
		local mat2 = "golden cloth"
		local mat2y = "golden_cloth"
		local craftLevel = 5
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		tailoring_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	--Armors
		if(itemToCraft == "Spring clothes") then
			local itemName = "spring clothes"
			local itemNameY = "spring_clothes"
			local itemNameRareY = "superior_spring_clothes"
			local cost1 = 10
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 0
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Summer clothes") then
			local itemName = "summer clothes"
			local itemNameY = "summer_clothes"
			local itemNameRareY = "superior_summer_clothes"
			local cost1 = 12
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 1
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Autumn clothes") then
			local itemName = "autumn clothes"
			local itemNameY = "autumn_clothes"
			local itemNameRareY = "superior_autumn_clothes"
			local cost1 = 14
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 2
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Winter clothes") then
			local itemName = "winter clothes"
			local itemNameY = "winter_clothes"
			local itemNameRareY = "superior_winter_clothes"
			local cost1 = 16
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 3
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Celestial clothes") then
			local itemName = "celestial clothes"
			local itemNameY = "celestial_clothes"
			local itemNameRareY = "superior_celestial_clothes"
			local cost1 = 18
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 4
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Lunar clothes") then
			local itemName = "lunar clothes"
			local itemNameY = "lunar_clothes"
			local itemNameRareY = "superior_lunar_clothes"
			local cost1 = 20
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 5
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Solar clothes") then
			local itemName = "solar clothes"
			local itemNameY = "solar_clothes"
			local itemNameRareY = "superior_solar_clothes"
			local cost1 = 22
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 6
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		
		
		
		if(itemToCraft == "Spring skirt") then
			local itemName = "spring skirt"
			local itemNameY = "spring_skirt"
			local itemNameRareY = "superior_spring_skirt"
			local cost1 = 10
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 0
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Summer skirt") then
			local itemName = "summer skirt"
			local itemNameY = "summer_skirt"
			local itemNameRareY = "superior_summer_skirt"
			local cost1 = 12
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 1
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Autumn skirt") then
			local itemName = "autumn skirt"
			local itemNameY = "autumn_skirt"
			local itemNameRareY = "superior_autumn_skirt"
			local cost1 = 14
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 2
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Winter skirt") then
			local itemName = "winter skirt"
			local itemNameY = "winter_skirt"
			local itemNameRareY = "superior_winter_skirt"
			local cost1 = 16
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 3
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Celestial skirt") then
			local itemName = "celestial skirt"
			local itemNameY = "celestial_skirt"
			local itemNameRareY = "superior_celestial_skirt"
			local cost1 = 18
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 4
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Lunar skirt") then
			local itemName = "lunar skirt"
			local itemNameY = "lunar_skirt"
			local itemNameRareY = "superior_lunar_skirt"
			local cost1 = 20
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 5
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Solar skirt") then
			local itemName = "solar skirt"
			local itemNameY = "solar_skirt"
			local itemNameRareY = "superior_solar_skirt"
			local cost1 = 22
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 6
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		
		
		if(itemToCraft == "Spring mantle") then
			local itemName = "spring mantle"
			local itemNameY = "spring_mantle"
			local itemNameRareY = "superior_spring_mantle"
			local cost1 = 10
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 0
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Summer mantle") then
			local itemName = "summer mantle"
			local itemNameY = "summer_mantle"
			local itemNameRareY = "superior_summer_mantle"
			local cost1 = 12
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 1
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Autumn mantle") then
			local itemName = "autumn mantle"
			local itemNameY = "autumn_mantle"
			local itemNameRareY = "superior_autumn_mantle"
			local cost1 = 14
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 2
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Winter mantle") then
			local itemName = "winter mantle"
			local itemNameY = "winter_mantle"
			local itemNameRareY = "superior_winter_mantle"
			local cost1 = 16
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 3
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Celestial mantle") then
			local itemName = "celestial mantle"
			local itemNameY = "celestial_mantle"
			local itemNameRareY = "superior_celestial_mantle"
			local cost1 = 18
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 4
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Lunar mantle") then
			local itemName = "lunar mantle"
			local itemNameY = "lunar_mantle"
			local itemNameRareY = "superior_lunar_mantle"
			local cost1 = 20
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 5
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Solar mantle") then
			local itemName = "solar mantle"
			local itemNameY = "solar_mantle"
			local itemNameRareY = "superior_solar_mantle"
			local cost1 = 22
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 6
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		
		
		
		
		if(itemToCraft == "Spring drapery") then
			local itemName = "spring drapery"
			local itemNameY = "spring_drapery"
			local itemNameRareY = "superior_spring_drapery"
			local cost1 = 10
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 0
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Summer drapery") then
			local itemName = "summer drapery"
			local itemNameY = "summer_drapery"
			local itemNameRareY = "superior_summer_drapery"
			local cost1 = 12
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 1
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Autumn drapery") then
			local itemName = "autumn drapery"
			local itemNameY = "autumn_drapery"
			local itemNameRareY = "superior_autumn_drapery"
			local cost1 = 14
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 2
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Winter drapery") then
			local itemName = "winter drapery"
			local itemNameY = "winter_drapery"
			local itemNameRareY = "superior_winter_drapery"
			local cost1 = 16
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 3
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Celestial drapery") then
			local itemName = "celestial drapery"
			local itemNameY = "celestial_drapery"
			local itemNameRareY = "superior_celestial_drapery"
			local cost1 = 18
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 4
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Lunar drapery") then
			local itemName = "lunar drapery"
			local itemNameY = "lunar_drapery"
			local itemNameRareY = "superior_lunar_drapery"
			local cost1 = 20
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 5
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Solar drapery") then
			local itemName = "solar drapery"
			local itemNameY = "solar_drapery"
			local itemNameRareY = "superior_solar_drapery"
			local cost1 = 22
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 2
			local mat2 = "golden cloth"
			local mat2y = "golden_cloth"
			local craftLevel = 6
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		
		---FANS
		
		if(itemToCraft == "Waxing moon fan") then
			local itemName = "waxing moon fan"
			local itemNameY = "waxing_moon_fan"
			local itemNameRareY = "fine_waxing_moon_fan"
			local cost1 = 15
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 5
			local mat2 = "ash board"
			local mat2y = "ash_board"
			local cost3 = 2
			local mat3 = "golden cloth"
			local mat3y = "golden_cloth"
			local craftLevel = 0
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Dragon fan") then
			local itemName = "dragon fan"
			local itemNameY = "dragon_fan"
			local itemNameRareY = "fine_dragon_fan"
			local cost1 = 17
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 6
			local mat2 = "ash board"
			local mat2y = "ash_board"
			local cost3 = 3
			local mat3 = "golden cloth"
			local mat3y = "golden_cloth"
			local craftLevel = 1
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Gilded blade fan") then
			local itemName = "gilded blade fan"
			local itemNameY = "gilded_blade_fan"
			local itemNameRareY = "fine_gilded_blade_fan"
			local cost1 = 19
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 7
			local mat2 = "ash board"
			local mat2y = "ash_board"
			local cost3 = 4
			local mat3 = "golden cloth"
			local mat3y = "golden_cloth"
			local craftLevel = 2
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Deadly blade fan") then
			local itemName = "deadly blade fan"
			local itemNameY = "deadly_blade_fan"
			local itemNameRareY = "fine_deadly_blade_fan"
			local cost1 = 21
			local mat1 = "cloth"
			local mat1y = "cloth"
			local cost2 = 8
			local mat2 = "ash board"
			local mat2y = "ash_board"
			local cost3 = 6
			local mat3 = "golden cloth"
			local mat3y = "golden_cloth"
			local craftLevel = 3
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			tailoring_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
		end
		
		
	end),

craftPatternShield = function(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	local t={graphic=convertGraphic(744,"monster"),color=0}
	local tFail={graphic=convertGraphic(36,"item"),color=0}
	local confirmCraft = player:menuString("Crafting a "..itemName.." requires "..cost1.." "..mat1.." and a pattern. Proceed?", {"Yes", "No"})
	if (confirmCraft == "Yes" and player:hasItem(mat1y, cost1) == true and player:hasItem("pattern_"..itemNameY, 1) == true and math.random(100000) <= 85000) then
		if (string.find("pattern_"..itemNameY, "(.*)_elite") ~= nil and math.random(100000) <= 70000) then
			player:removeItem(mat1y, cost1)
			player:removeItem("pattern_"..itemNameY, 1)
			player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1/2)
			player:addItem(itemNameY, 1)
			player:dialogSeq({tItem, "You successfully create a "..itemName.."."}, 1)
		elseif (string.find("pattern_"..itemNameY, "(.*)_elite") == nil) then
			player:removeItem(mat1y, cost1)
			player:removeItem("pattern_"..itemNameY, 1)
			player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1/2)
			player:addItem(itemNameY, 1)
			player:dialogSeq({tItem, "You successfully create a "..itemName.."."}, 1)
		else
			player:removeItem(mat1y, cost1)
			player:removeItem("pattern_"..itemNameY, 1)
			player:dialogSeq({t, "Oops. You've completely mangled the recipe. There's no hope for this piece."}, 1)
		end
	elseif (player:hasItem(mat1, cost1) ~= true) then
		player:dialogSeq({t, "Hmm... You don't seem to have enough cloth for the job. Dont worry plenty of guys have the same problem"}, 1)
	elseif (player:hasItem("pattern_"..itemNameY, 1) ~= true) then
		player:dialogSeq({t, "What are you going to pattern? Your hand..?"}, 1)
	else
		player:removeItem(mat1y, cost1)
		player:removeItem("pattern_"..itemNameY, 1)
		player:dialogSeq({t, "Oops. You've completely mangled the recipe. There's no hope for this piece."}, 1)
	end
end,
	
	craftArmor = function(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		local t={graphic=convertGraphic(744,"monster"),color=0}
		local tFail={graphic=convertGraphic(36,"item"),color=0}
		local dumbDialog = "*You lay out the material to measure and cut. The cloth pieces are then sewn together with the finest thread*"
		local confirmCraft = player:menuString("Crafting a "..itemName.." requires "..cost1.." "..mat1..". Proceed?", {"Yes", "No"})
		if (confirmCraft == "Yes" and player:hasItem(mat1y, cost1) == true) then
			if(math.random(0,100) <= 60 + (levelBonus - craftLevel) * 4) then
				if(math.random(0,100) <= 15 + (levelBonus - craftLevel) * 2) then
					local addFlaming = player:menuString("This piece is taking form nicely. Add "..cost2.." "..mat2.."?", {"Yes", "No"})
					if(addFlaming == "Yes" and player:hasItem(mat2y, cost2) == true) then
						local rand = math.random(3)
						if (rand == 1) then
							player:dialogSeq({tFail, "You incorporate the "..mat2.." into your work"}, 1)
							player:removeItem(mat1y, cost1)
							player:removeItem(mat2y, cost2)
							player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1+(cost1/2))
							player:addItem(itemNameRareY, 1)
							player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName..". Your work is of very high quality!"}, 1)
						else
							player:dialogSeq({tFail, "You incorporate the "..mat2.." into your work"}, 1)
							player:removeItem(mat1y, cost1)
							player:removeItem(mat2y, cost2)
							player.registry["tailor"] = player.registry["tailor"] + math.ceil((cost1+(cost1/2))/2)
							player:addItem(itemNameY, 1)
							player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
						end
					elseif(addFlaming == "No") then
						player:removeItem(mat1y, cost1)
						player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1/2)
						player:addItem(itemNameY, 1)
						player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
					else
						player:removeItem(mat1y, cost1)
						player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1/2)
						player:addItem(itemNameY, 1)
						player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
					end
				else
					player:removeItem(mat1y, cost1)
					player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1/2)
					player:addItem(itemNameY, 1)
					player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
				end
			else
				player:removeItem(mat1y, cost1)
				player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1/8)
				player:dialogSeq({t, dumbDialog, tFail, "You failed to produce anything useable."}, 1)
			end
		elseif (player:hasItem(mat1, cost1) ~= true) then
			player:dialogSeq({t, "Hmm...You don't seem to have enough material for the job"}, 1)
		end
	end,
	
	craftWeap = function(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
		local t={graphic=convertGraphic(744,"monster"),color=0}
		local tFail={graphic=convertGraphic(36,"item"),color=0}
		local dumbDialog = "*You lay out the material to measure and cut. The clothpieces are then sewn together with the finest thread*"
		local confirmCraft = player:menuString("Crafting a "..itemName.." requires "..cost1.." "..mat1.." and "..cost2.." "..mat2..". Proceed?", {"Yes", "No"})
		if (confirmCraft == "Yes" and player:hasItem(mat1y, cost1) == true and player:hasItem(mat2y, cost2) == true) then
			if(math.random(0,100) <= 75 + (levelBonus - craftLevel) * 2) then
				if(math.random(0,100) <= 20 + (levelBonus - craftLevel) * 2) then
					local addFlaming = player:menuString("This piece is taking form nicely. Add "..cost3.." "..mat3.."?", {"Yes", "No"})
					if(addFlaming == "Yes" and player:hasItem(mat3y, cost3) == true) then
						local rand = math.random(3)
						if (rand == 1) then
							player:dialogSeq({tFail, "You incorporate the "..mat3.." into your work"}, 1)
							player:removeItem(mat1y, cost1)
							player:removeItem(mat2y, cost2)
							player:removeItem(mat3y, cost3)
							player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1+(cost1/3))
							player:addItem(itemNameRareY, 1)
							player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName..". Your work is of very high quality!"}, 1)
						else
							player:dialogSeq({tFail, "You incorporate the "..mat3.." into your work"}, 1)
							player:removeItem(mat1y, cost1)
							player:removeItem(mat2y, cost2)
							player:removeItem(mat3y, cost3)
							player.registry["tailor"] = player.registry["tailor"] + math.ceil((cost1+(cost1/3))/2)
							player:addItem(itemNameY, 1)
							player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
						end
					elseif(addFlaming == "No") then
						player:removeItem(mat1y, cost1)
						player:removeItem(mat2y, cost2)
						player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1/3)
						player:addItem(itemNameY, 1)
						player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
					else
						player:removeItem(mat1y, cost1)
						player:removeItem(mat2y, cost2)
						player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1/3)
						player:addItem(itemNameY, 1)
						player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
					end
				else
					player:removeItem(mat1y, cost1)
					player:removeItem(mat2y, cost2)
					player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1/3)
					player:addItem(itemNameY, 1)
					player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
				end
			else
				player:removeItem(mat1y, cost1)
				player:removeItem(mat2y, cost2)
				player.registry["tailor"] = player.registry["tailor"] + math.ceil(cost1/12)
				player:dialogSeq({t, dumbDialog, tFail, "You failed to produce anything useable."}, 1)
			end
		elseif (player:hasItem(mat1y, cost1) ~= true or player:hasItem(mat2y, cost2) ~= true) then
			player:dialogSeq({t, "Hmm...You don't seem to have enough material for the job"}, 1)
		end
	end
}