anvil = {

	click = async(function(player,npc)
		local t={graphic=convertGraphic(828,"monster"),color=0}
		local tFail={graphic=convertGraphic(36,"item"),color=0}
		local typeOpts = {"Smith shields", "Smith platemail", "Smith plate dress", "Smith armor", "Smith armor dress", "Smith weapons", "Forget Smithing"}
		local itemToCraft
		local craftLevel
		local levelBonus
		local shields = { }
		local weapons = { }
		local platemails = { }
		local platedresses = { }
		local armors = { }
		local armordresses = { }
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
		
		if (player.registry["professionalSmith"] == 0 and craftCount < 2) then
			local options = {"Yes", "No"}
			local choice = player:menuString("Would you like to become a smith?", options)
			
			if (choice == "Yes") then
				player.registry["professionalSmith"] = 250
			else
				player:dialogSeq({t, "Very well then, maybe another time."}, 1)
				return
			end
		elseif (player.registry["professionalSmith"] == 0) then
			player:removeLegendbyName("smith")
			player.registry["smith"] = 0
			player:dialogSeq({t, "I'm sorry, but you can only have a maximum of two crafts. Please forget one if you would like to start smithing."}, 1)
			return
		end
		
		if(player.registry["smith"]>=0) then
			craftlevel="Beginner"
			levelBonus = 0
			table.insert(platemails, "Spring platemail")
			table.insert(platedresses, "Spring plate dress")
			table.insert(armors, "Spring armor")
			table.insert(armordresses, "Spring armor dress")
		end
		
		if(player.registry["smith"]>=20) then
			craftlevel="Novice"
			levelBonus = 1
			table.insert(platemails, "Summer platemail")
			table.insert(platedresses, "Summer plate dress")
			table.insert(armors, "Summer armor")
			table.insert(armordresses, "Summer armor dress")

		end
		
		if(player.registry["smith"]>=40) then
			craftlevel="Apprentice"
			levelBonus = 2
			table.insert(platemails, "Autumn platemail")
			table.insert(platedresses, "Autumn plate dress")
			table.insert(armors, "Autumn armor")
			table.insert(armordresses, "Autumn armor dress")
			
			table.insert(weapons, "Steelforge blade") 

		end
		if(player.registry["smith"]>=80) then
			craftlevel="Accomplished"
			levelBonus = 3
			table.insert(platemails, "Winter platemail")
			table.insert(platedresses, "Winter plate dress")
			table.insert(armors, "Winter armor")
			table.insert(armordresses, "Winter armor dress")

			table.insert(weapons, "Gladiator saber") 
		end
		if(player.registry["smith"]>=160) then
			craftlevel="Adept"
			levelBonus = 4
			table.insert(shields, "Cowhide")
			table.insert(shields, "Bulwark")
			table.insert(platemails, "Celestial platemail")
			table.insert(platedresses, "Celestial plate dress")
			table.insert(armors, "Celestial armor")
			table.insert(armordresses, "Celestial armor dress")
			
			table.insert(weapons, "Hackblade") 
		end
		if(player.registry["smith"]>=320) then
			craftlevel="Talented"
			levelBonus = 5
			table.insert(shields, "Cowhide (Elite)")
			table.insert(shields, "Bulwark (Elite)")
			table.insert(platemails, "Lunar platemail")
			table.insert(platedresses, "Lunar plate dress")
			table.insert(armors, "Lunar armor")
			table.insert(armordresses, "Lunar armor dress")
			table.insert(weapons, "Darksteel sword")
		end
		if(player.registry["smith"]>=640) then
			craftlevel="Skilled"
			levelBonus = 6
			table.insert(platemails, "Solar platemail")
			table.insert(platedresses, "Solar plate dress")
			table.insert(armors, "Solar armor")
			table.insert(armordresses, "Solar armor dress")
			
		end
		if(player.registry["smith"]>=1280) then
			craftlevel="Expert"
			levelBonus = 7
		end
		if(player.registry["smith"]>=2560) then
			craftlevel="Master"
			levelBonus = 8
		end
		if(player.registry["smith"]>=5120) then
			craftlevel="Grand Master"
			levelBonus = 9
		end
		if(player.registry["smith"]>=10240) then
			craftlevel="Champion"
			levelBonus = 10
		end
		if(player.registry["smith"]>=20480) then
			craftlevel="Legendary"
			levelBonus = 11
		end
		table.insert(shields, "Nevermind")
		table.insert(weapons, "Nevermind")
		table.insert(platemails, "Nevermind")
		table.insert(platedresses, "Nevermind")
		table.insert(armors, "Nevermind")
		table.insert(armordresses, "Nevermind")
		
		player:removeLegendbyName("smith")
		player:addLegend(""..craftlevel.." smith","smith",149,128)	
		
		local typeChoice = player:menuString("What will you craft?", typeOpts)
		
		if (typeChoice == "Smith shields") then
			itemToCraft = player:menuString("What type of shield do you wish to forge?", shields)
		elseif(typeChoice == "Smith weapons") then
			itemToCraft = player:menuString("What type of weapon do you wish to forge?", weapons)
		elseif(typeChoice == "Smith platemail") then
			itemToCraft = player:menuString("What type of platemail would you like to forge?", platemails)
		elseif(typeChoice == "Smith plate dress") then
			itemToCraft = player:menuString("What type of plate dress would you like to forge?", platedresses)
		elseif(typeChoice == "Smith armor") then
			itemToCraft = player:menuString("What type of armor would you like to forge?", armors)
		elseif(typeChoice == "Smith armor dress") then
			itemToCraft = player:menuString("What type of armor dress would you like to forge?", armordresses)
		elseif (typeChoice == "Forget Smithing") then
			local options = {"Yes", "No"}
			local choice = player:menuString("Are you absolutely sure you wish to forget smithing? This will erase all skill you have earned thus far.", options)
			
			if (choice == "Yes") then
				player:dialogSeq({t, "Visit the Legendary Artisan.\n\nHe is usually around the market near East gate Areci Mesuv."}, 1)
				--[[player.registry["professionalSmith"] = 0
				player.registry["smith"] = 0
				player:removeLegendbyName("smith")]]--
			else
				player:dialogSeq({t, "Not quite ready to give it up, eh?"}, 1)
				return
			end
		end
		
		
	--Shields	
	if(itemToCraft == "Cowhide") then
		local itemName = "cowhide"
		local itemNameY = "cowhide"
		local itemNameRareY = "cowhide"
		local cost1 = 18
		local mat1 = "steel ingot"
		local mat1y = "iron_ingot"
		local cost2 = 4
		local mat2 = "bronze ingot"
		local mat2y = "copper_ingot"
		local craftLevel = 4
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		anvil.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Bulwark") then
		local itemName = "bulwark"
		local itemNameY = "bulwark"
		local itemNameRareY = "bulwark"
		local cost1 = 18
		local mat1 = "steel ingot"
		local mat1y = "iron_ingot"
		local cost2 = 4
		local mat2 = "bronze ingot"
		local mat2y = "copper_ingot"
		local craftLevel = 4
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		anvil.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Cowhide (Elite)") then
		local itemName = "cowhide (elite)"
		local itemNameY = "cowhide_elite"
		local itemNameRareY = "cowhide_elite"
		local cost1 = 27
		local mat1 = "steel ingot"
		local mat1y = "iron_ingot"
		local cost2 = 6
		local mat2 = "bronze ingot"
		local mat2y = "copper_ingot"
		local craftLevel = 5
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		anvil.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Bulwark (Elite)") then
		local itemName = "bulwark (elite)"
		local itemNameY = "bulwark_elite"
		local itemNameRareY = "bulwark_elite"
		local cost1 = 27
		local mat1 = "steel ingot"
		local mat1y = "iron_ingot"
		local cost2 = 6
		local mat2 = "bronze ingot"
		local mat2y = "copper_ingot"
		local craftLevel = 5
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		anvil.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	--Armors
		if(itemToCraft == "Spring platemail") then
			local itemName = "spring platemail"
			local itemNameY = "spring_platemail"
			local itemNameRareY = "superior_spring_platemail"
			local cost1 = 10
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 0
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Summer platemail") then
			local itemName = "summer platemail"
			local itemNameY = "summer_platemail"
			local itemNameRareY = "superior_summer_platemail"
			local cost1 = 12
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 1
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Autumn platemail") then
			local itemName = "autumn platemail"
			local itemNameY = "autumn_platemail"
			local itemNameRareY = "superior_autumn_platemail"
			local cost1 = 14
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 2
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Winter platemail") then
			local itemName = "winter platemail"
			local itemNameY = "winter_platemail"
			local itemNameRareY = "superior_winter_platemail"
			local cost1 = 16
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 3
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Celestial platemail") then
			local itemName = "celestial platemail"
			local itemNameY = "celestial_platemail"
			local itemNameRareY = "superior_celestial_platemail"
			local cost1 = 18
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 4
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Lunar platemail") then
			local itemName = "lunar platemail"
			local itemNameY = "lunar_platemail"
			local itemNameRareY = "superior_lunar_platemail"
			local cost1 = 20
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 5
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Solar platemail") then
			local itemName = "solar platemail"
			local itemNameY = "solar_platemail"
			local itemNameRareY = "superior_solar_platemail"
			local cost1 = 22
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 6
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		
		
		
		if(itemToCraft == "Spring plate dress") then
			local itemName = "spring plate dress"
			local itemNameY = "spring_plate_dress"
			local itemNameRareY = "superior_spring_plate_dress"
			local cost1 = 10
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 0
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Summer plate dress") then
			local itemName = "summer plate dress"
			local itemNameY = "summer_plate_dress"
			local itemNameRareY = "superior_summer_plate_dress"
			local cost1 = 12
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 1
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Autumn plate dress") then
			local itemName = "autumn plate dress"
			local itemNameY = "autumn_plate_dress"
			local itemNameRareY = "superior_autumn_plate_dress"
			local cost1 = 14
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 2
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Winter plate dress") then
			local itemName = "winter plate dress"
			local itemNameY = "winter_plate_dress"
			local itemNameRareY = "superior_winter_plate_dress"
			local cost1 = 16
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 3
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Celestial plate dress") then
			local itemName = "celestial plate dress"
			local itemNameY = "celestial_plate_dress"
			local itemNameRareY = "superior_celestial_plate_dress"
			local cost1 = 18
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 4
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Lunar plate dress") then
			local itemName = "lunar plate dress"
			local itemNameY = "lunar_plate_dress"
			local itemNameRareY = "superior_lunar_plate_dress"
			local cost1 = 20
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 5
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Solar plate dress") then
			local itemName = "solar plate dress"
			local itemNameY = "solar_plate_dress"
			local itemNameRareY = "superior_solar_plate_dress"
			local cost1 = 22
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 6
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		
		
		if(itemToCraft == "Spring armor") then
			local itemName = "spring armor"
			local itemNameY = "spring_armor"
			local itemNameRareY = "superior_spring_armor"
			local cost1 = 10
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 0
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Summer armor") then
			local itemName = "summer armor"
			local itemNameY = "summer_armor"
			local itemNameRareY = "superior_summer_armor"
			local cost1 = 12
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 1
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Autumn armor") then
			local itemName = "autumn armor"
			local itemNameY = "autumn_armor"
			local itemNameRareY = "superior_autumn_armor"
			local cost1 = 14
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 2
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Winter armor") then
			local itemName = "winter armor"
			local itemNameY = "winter_armor"
			local itemNameRareY = "superior_winter_armor"
			local cost1 = 16
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 3
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Celestial armor") then
			local itemName = "celestial armor"
			local itemNameY = "celestial_armor"
			local itemNameRareY = "superior_celestial_armor"
			local cost1 = 18
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 4
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Lunar armor") then
			local itemName = "lunar armor"
			local itemNameY = "lunar_armor"
			local itemNameRareY = "superior_lunar_armor"
			local cost1 = 20
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 5
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Solar armor") then
			local itemName = "solar armor"
			local itemNameY = "solar_armor"
			local itemNameRareY = "superior_solar_armor"
			local cost1 = 22
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 6
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		
		
		
		
		if(itemToCraft == "Spring armor dress") then
			local itemName = "spring armor dress"
			local itemNameY = "spring_armor_dress"
			local itemNameRareY = "superior_spring_armor_dress"
			local cost1 = 10
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 0
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Summer armor dress") then
			local itemName = "summer armor dress"
			local itemNameY = "summer_armor_dress"
			local itemNameRareY = "superior_summer_armor_dress"
			local cost1 = 12
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 1
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Autumn armor dress") then
			local itemName = "autumn armor dress"
			local itemNameY = "autumn_armor_dress"
			local itemNameRareY = "superior_autumn_armor_dress"
			local cost1 = 14
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 2
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Winter armor dress") then
			local itemName = "winter armor dress"
			local itemNameY = "winter_armor_dress"
			local itemNameRareY = "superior_winter_armor_dress"
			local cost1 = 16
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 3
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Celestial armor dress") then
			local itemName = "celestial armor dress"
			local itemNameY = "celestial_armor_dress"
			local itemNameRareY = "superior_celestial_armor_dress"
			local cost1 = 18
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 4
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Lunar armor dress") then
			local itemName = "lunar armor dress"
			local itemNameY = "lunar_armor_dress"
			local itemNameRareY = "superior_lunar_armor_dress"
			local cost1 = 20
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 5
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Solar armor dress") then
			local itemName = "solar armor dress"
			local itemNameY = "solar_armor_dress"
			local itemNameRareY = "superior_solar_armor_dress"
			local cost1 = 22
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 2
			local mat2 = "bronze ingot"
			local mat2y = "copper_ingot"
			local craftLevel = 6
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftArmor(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
		end
		
		
		---FANS
		
		if(itemToCraft == "Steelforge blade") then
			local itemName = "steelforge blade"
			local itemNameY = "steelforge_blade"
			local itemNameRareY = "balanced_steelforge_blade"
			local cost1 = 15
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 5
			local mat2 = "ash board"
			local mat2y = "ash_board"
			local cost3 = 2
			local mat3 = "bronze ingot"
			local mat3y = "copper_ingot"
			local craftLevel = 0
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Gladiator saber") then
			local itemName = "gladiator saber"
			local itemNameY = "gladiator_saber"
			local itemNameRareY = "balanced_gladiator_saber"
			local cost1 = 17
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 6
			local mat2 = "ash board"
			local mat2y = "ash_board"
			local cost3 = 3
			local mat3 = "bronze ingot"
			local mat3y = "copper_ingot"
			local craftLevel = 1
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Hackblade") then
			local itemName = "hackblade"
			local itemNameY = "hackblade"
			local itemNameRareY = "balanced_hackblade"
			local cost1 = 19
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 7
			local mat2 = "ash board"
			local mat2y = "ash_board"
			local cost3 = 4
			local mat3 = "bronze ingot"
			local mat3y = "copper_ingot"
			local craftLevel = 2
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
		end
		
		if(itemToCraft == "Darksteel sword") then
			local itemName = "darksteel sword"
			local itemNameY = "darksteel_sword"
			local itemNameRareY = "balanced_darksteel_sword"
			local cost1 = 21
			local mat1 = "steel ingot"
			local mat1y = "iron_ingot"
			local cost2 = 8
			local mat2 = "ash board"
			local mat2y = "ash_board"
			local cost3 = 6
			local mat3 = "bronze ingot"
			local mat3y = "copper_ingot"
			local craftLevel = 3
			local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
			local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
			anvil.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
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
			player.registry["smith"] = player.registry["smith"] + math.ceil(cost1/2)
			player:addItem(itemNameY, 1)
			player:dialogSeq({tItem, "You successfully create a "..itemName.."."}, 1)
		elseif (string.find("pattern_"..itemNameY, "(.*)_elite") == nil) then
			player:removeItem(mat1y, cost1)
			player:removeItem("pattern_"..itemNameY, 1)
			player.registry["smith"] = player.registry["smith"] + math.ceil(cost1/2)
			player:addItem(itemNameY, 1)
			player:dialogSeq({tItem, "You successfully create a "..itemName.."."}, 1)
		else
			player:removeItem(mat1y, cost1)
			player:removeItem("pattern_"..itemNameY, 1)
			player:dialogSeq({t, "Oops. You've completely mangled the recipe. There's no hope for this piece."}, 1)
		end
	elseif (player:hasItem(mat1, cost1) ~= true) then
		player:dialogSeq({t, "Hmm... You don't seem to have enough iron for the job. Dont worry plenty of guys have the same problem"}, 1)
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
		local dumbDialog = "*Sparks fly and you hammer the ingots into shape*"
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
							player.registry["smith"] = player.registry["smith"] + math.ceil(cost1+(cost1/2))
							player:addItem(itemNameRareY, 1)
							player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName..". Your work is of very high quality!"}, 1)
						else
							player:dialogSeq({tFail, "You incorporate the "..mat2.." into your work"}, 1)
							player:removeItem(mat1y, cost1)
							player:removeItem(mat2y, cost2)
							player.registry["smith"] = player.registry["smith"] + math.ceil((cost1+(cost1/2))/2)
							player:addItem(itemNameY, 1)
							player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
						end
					elseif(addFlaming == "No") then
						player:removeItem(mat1y, cost1)
						player.registry["smith"] = player.registry["smith"] + math.ceil(cost1/2)
						player:addItem(itemNameY, 1)
						player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
					else
						player:removeItem(mat1y, cost1)
						player.registry["smith"] = player.registry["smith"] + math.ceil(cost1/2)
						player:addItem(itemNameY, 1)
						player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
					end
				else
					player:removeItem(mat1y, cost1)
					player.registry["smith"] = player.registry["smith"] + math.ceil(cost1/2)
					player:addItem(itemNameY, 1)
					player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
				end
			else
				player:removeItem(mat1y, cost1)
				player.registry["smith"] = player.registry["smith"] + math.ceil(cost1/8)
				player:dialogSeq({t, dumbDialog, tFail, "You failed to produce anything useable."}, 1)
			end
		elseif (player:hasItem(mat1, cost1) ~= true) then
			player:dialogSeq({t, "Hmm...You don't seem to have enough material for the job"}, 1)
		end
	end,
	
	craftWeap = function(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
		local t={graphic=convertGraphic(744,"monster"),color=0}
		local tFail={graphic=convertGraphic(36,"item"),color=0}
		local dumbDialog = "*Sparks fly and you hammer the ingots into shape*"
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
							player.registry["smith"] = player.registry["smith"] + math.ceil(cost1+(cost1/3))
							player:addItem(itemNameRareY, 1)
							player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName..". Your work is of very high quality!"}, 1)
						else
							player:dialogSeq({tFail, "You incorporate the "..mat3.." into your work"}, 1)
							player:removeItem(mat1y, cost1)
							player:removeItem(mat2y, cost2)
							player:removeItem(mat3y, cost3)
							player.registry["smith"] = player.registry["smith"] + math.ceil((cost1+(cost1/3))/2)
							player:addItem(itemNameY, 1)
							player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
						end
					elseif(addFlaming == "No") then
						player:removeItem(mat1y, cost1)
						player:removeItem(mat2y, cost2)
						player.registry["smith"] = player.registry["smith"] + math.ceil(cost1/3)
						player:addItem(itemNameY, 1)
						player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
					else
						player:removeItem(mat1y, cost1)
						player:removeItem(mat2y, cost2)
						player.registry["smith"] = player.registry["smith"] + math.ceil(cost1/3)
						player:addItem(itemNameY, 1)
						player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
					end
				else
					player:removeItem(mat1y, cost1)
					player:removeItem(mat2y, cost2)
					player.registry["smith"] = player.registry["smith"] + math.ceil(cost1/3)
					player:addItem(itemNameY, 1)
					player:dialogSeq({t, dumbDialog, tItem, "You successfully create a "..itemName.."."}, 1)
				end
			else
				player:removeItem(mat1y, cost1)
				player:removeItem(mat2y, cost2)
				player.registry["smith"] = player.registry["smith"] + math.ceil(cost1/12)
				player:dialogSeq({t, dumbDialog, tFail, "You failed to produce anything useable."}, 1)
			end
		elseif (player:hasItem(mat1y, cost1) ~= true or player:hasItem(mat2y, cost2) ~= true) then
			player:dialogSeq({t, "Hmm...You don't seem to have enough material for the job"}, 1)
		end
	end
}