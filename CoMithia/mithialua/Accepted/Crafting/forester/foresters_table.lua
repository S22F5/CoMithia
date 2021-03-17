foresters_table = {
click = async(function(player,npc)
	local t = {graphic = convertGraphic(745, "monster"), color = 0}
	local tFail = {graphic = convertGraphic(3289, "item"), color = 0}
	local typeOpts = {"Craft shields", "Craft staffs", "Craft blades", "Forget Foresting"}
	local itemToCraft
	local craftLevel
	local levelBonus
	local shields = {}
	local staffs = {}
	local blades = {}
	local craftCount = 0
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
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
	
	if (player.registry["professionalForester"] == 0 and craftCount < 2) then
		local options = {"Yes", "No"}
		local choice = player:menuString("Would you like to become a forester?", options)
		
		if (choice == "Yes") then
			player.registry["professionalForester"] = 250
		else
			player:dialogSeq({t, "Very well then, maybe another time."}, 1)
			return
		end
	elseif (player.registry["professionalForester"] == 0) then
		player:removeLegendbyName("forester")
		player.registry["forester"] = 0
		player:dialogSeq({t, "I'm sorry, but you can only have a maximum of two crafts. Please forget one if you would like to start foresting."}, 1)
		return
	end
	
	if (player.registry["forester"] >= 0) then
		craftlevel = "Beginner"
		levelBonus = 0
		--spring level 8
		table.insert(shields, "Wooden buckler")
	end
	
	if (player.registry["forester"] >= 20) then
		craftlevel="Novice"
		levelBonus = 1
		--summer level 15
		table.insert(shields, "Forest buckler")
	end
	
	if (player.registry["forester"] >= 40) then
		craftlevel="Apprentice"
		levelBonus = 2
		--fall 22
		table.insert(shields, "Wild buckler")
		table.insert(staffs, "Conjurers staff")
		table.insert(blades, "Thorny saber")
	end
	
	if (player.registry["forester"] >= 80) then
		craftlevel="Accomplished"
		levelBonus = 3
		--winter 29
		table.insert(staffs, "Rune staff")
		table.insert(blades, "Forest shiv")
	end
	
	if (player.registry["forester"] >= 160) then
		craftlevel="Adept"
		levelBonus = 4
		--celestial 36
		table.insert(shields, "Studded shield")
		table.insert(shields, "Sleighted shield")
		table.insert(shields, "Starshine")
		table.insert(shields, "Fragment of time")
		table.insert(staffs, "Divination rod")
		table.insert(blades, "Woodlands blade")
	end
	
	if (player.registry["forester"] >= 320) then
		craftlevel="Talented"
		levelBonus = 5
		--lunar 43
		table.insert(shields, "Studded shield (Elite)")
		table.insert(shields, "Sleighted shield (Elite)")
		table.insert(shields, "Starshine (Elite)")
		table.insert(shields, "Fragment of time (Elite)")
		table.insert(staffs, "Meditation staff")
		table.insert(blades, "Gnarly branch")
	end
	
	if (player.registry["forester"] >= 640) then
		craftlevel="Skilled"
		levelBonus = 6
		--solar 50
	end
	
	if (player.registry["forester"] >= 1280) then
		craftlevel="Expert"
		levelBonus = 7
	end
	
	if (player.registry["forester"] >= 2560) then
		craftlevel="Master"
		levelBonus = 8
	end
	
	if (player.registry["forester"] >= 5120) then
		craftlevel="Grand Master"
		levelBonus = 9
	end
	
	if (player.registry["forester"] >= 10240) then
		craftlevel="Champion"
		levelBonus = 10
	end
	
	if (player.registry["forester"] >= 20480) then
		craftlevel="Legendary"
		levelBonus = 11
	end
	
	table.insert(shields, "Nevermind")
	table.insert(staffs, "Nevermind")
	table.insert(blades, "Nevermind")
	
	player:removeLegendbyName("forester")
	player:addLegend(""..craftlevel.." forester","forester",28,128)	
	
	local typeChoice = player:menuString("What will you craft?", typeOpts)
	
	if(typeChoice == "Craft shields") then
		itemToCraft = player:menuString("What type of shield would you like to carve?", shields)
	elseif(typeChoice == "Craft staffs") then
		itemToCraft = player:menuString("What type of staff would you like to carve?", staffs)
	elseif(typeChoice == "Craft blades") then
		itemToCraft = player:menuString("What type of blade would you like to construct?", blades)
	elseif (typeChoice == "Forget Foresting") then
		local options = {"Yes", "No"}
		local choice = player:menuString("Are you absolutely sure you wish to forget foresting? This will erase all skill you have earned thus far.", options)
		
		if (choice == "Yes") then
			player:dialogSeq({t, "Visit the Legendary Artisan.\n\nHe is usually around the market near East gate Areci Mesuv."}, 1)
			--[[player.registry["professionalForester"] = 0
			player.registry["forester"] = 0
			player:removeLegendbyName("forester")]]--
		else
			player:dialogSeq({t, "Not quite ready to give it up, eh?"}, 1)
			return
		end
	end
	
	--Shields should go here. Have similar rates as armor
	if(itemToCraft == "Wooden buckler") then
		local itemName = "wooden buckler"
		local itemNameY = "wooden_buckler"
		local itemNameRareY = "reinforced_wooden_buckler"
		local cost1 = 5
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 2
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 0
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Forest buckler") then
		local itemName = "forest buckler"
		local itemNameY = "forest_buckler"
		local itemNameRareY = "reinforced_forest_buckler"
		local cost1 = 6
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 2
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 1
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Wild buckler") then
		local itemName = "wild buckler"
		local itemNameY = "wild_buckler"
		local itemNameRareY = "reinforced_wild_buckler"
		local cost1 = 7
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 2
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 3
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Studded shield") then
		local itemName = "studded shield"
		local itemNameY = "studded_shield"
		local itemNameRareY = "studded_shield"
		local cost1 = 18
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 4
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 4
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Sleighted shield") then
		local itemName = "sleighted shield"
		local itemNameY = "sleighted_shield"
		local itemNameRareY = "sleighted_shield"
		local cost1 = 18
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 4
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 4
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Starshine") then
		local itemName = "starshine"
		local itemNameY = "starshine"
		local itemNameRareY = "starshine"
		local cost1 = 18
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 4
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 4
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Fragment of time") then
		local itemName = "fragment of time"
		local itemNameY = "fragment_of_time"
		local itemNameRareY = "fragment_of_time"
		local cost1 = 18
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 4
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 4
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Studded shield (Elite)") then
		local itemName = "studded shield (elite)"
		local itemNameY = "studded_shield_elite"
		local itemNameRareY = "studded_shield_elite"
		local cost1 = 27
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 6
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 5
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Sleighted shield (Elite)") then
		local itemName = "sleighted shield (elite)"
		local itemNameY = "sleighted_shield_elite"
		local itemNameRareY = "sleighted_shield_elite"
		local cost1 = 27
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 6
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 5
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Starshine (Elite)") then
		local itemName = "starshine (elite)"
		local itemNameY = "starshine_elite"
		local itemNameRareY = "starshine_elite"
		local cost1 = 27
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 6
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 5
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Fragment of time (Elite)") then
		local itemName = "fragment of time (elite)"
		local itemNameY = "fragment_of_time_elite"
		local itemNameRareY = "fragment_of_time_elite"
		local cost1 = 27
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 6
		local mat2 = "flaming ash board"
		local mat2y = "flaming_ash_board"
		local craftLevel = 5
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftPatternShield(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Conjurers staff") then
		local itemName = "conjurers staff"
		local itemNameY = "conjurers_staff"
		local itemNameRareY = "enchanted_conjurers_staff"
		local cost1 = 13
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 7
		local mat2 = "cloth"
		local mat2y = "cloth"
		local cost3 = 2
		local mat3 = "flaming ash board"
		local mat3y = "flaming_ash_board"
		local craftLevel = 0
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Rune staff") then
		local itemName = "rune staff"
		local itemNameY = "rune_staff"
		local itemNameRareY = "enchanted_rune_staff"
		local cost1 = 15
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 8
		local mat2 = "cloth"
		local mat2y = "cloth"
		local cost3 = 3
		local mat3 = "flaming ash board"
		local mat3y = "flaming_ash_board"
		local craftLevel = 1
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Divination rod") then
		local itemName = "divination rod"
		local itemNameY = "divination_rod"
		local itemNameRareY = "enchanted_divination_rod"
		local cost1 = 17
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 9
		local mat2 = "cloth"
		local mat2y = "cloth"
		local cost3 = 4
		local mat3 = "flaming ash board"
		local mat3y = "flaming_ash_board"
		local craftLevel = 2
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Meditation staff") then
		local itemName = "meditation staff"
		local itemNameY = "meditation_staff"
		local itemNameRareY = "enchanted_meditation_staff"
		local cost1 = 19
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 10
		local mat2 = "cloth"
		local mat2y = "cloth"
		local cost3 = 6
		local mat3 = "flaming ash board"
		local mat3y = "flaming_ash_board"
		local craftLevel = 3
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Thorny saber") then
		local itemName = "thorny saber"
		local itemNameY = "thorny_saber"
		local itemNameRareY = "sharp_thorny_saber"
		local cost1 = 13
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 7
		local mat2 = "steel ingots"
		local mat2y = "iron_ingot"
		local cost3 = 2
		local mat3 = "flaming ash board"
		local mat3y = "flaming_ash_board"
		local craftLevel = 0
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Forest shiv") then
		local itemName = "forest shiv"
		local itemNameY = "forest_shiv"
		local itemNameRareY = "sharp_forest_shiv"
		local cost1 = 15
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 8
		local mat2 = "steel ingots"
		local mat2y = "iron_ingot"
		local cost3 = 3
		local mat3 = "flaming ash board"
		local mat3y = "flaming_ash_board"
		local craftLevel = 0
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Woodlands blade") then
		local itemName = "woodlands blade"
		local itemNameY = "woodlands_blade"
		local itemNameRareY = "sharp_woodlands_blade"
		local cost1 = 17
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 9
		local mat2 = "steel ingots"
		local mat2y = "iron_ingot"
		local cost3 = 4
		local mat3 = "flaming ash board"
		local mat3y = "flaming_ash_board"
		local craftLevel = 0
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
	end
	
	if(itemToCraft == "Gnarly branch") then
		local itemName = "gnarly branch"
		local itemNameY = "gnarly_branch"
		local itemNameRareY = "sharp_gnarly_branch"
		local cost1 = 19
		local mat1 = "ash board"
		local mat1y = "ash_board"
		local cost2 = 10
		local mat2 = "steel ingots"
		local mat2y = "iron_ingot"
		local cost3 = 6
		local mat3 = "flaming ash board"
		local mat3y = "flaming_ash_board"
		local craftLevel = 0
		local tItem={graphic=convertGraphic(Item(itemNameY).look,"item"),color=Item(itemNameY).lookColor}
		local tItemRare={graphic=convertGraphic(Item(itemNameRareY).look,"item"),color=Item(itemNameRareY).lookColor}
		foresters_table.craftWeap(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
	end
	
end),

craftShield = function(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	local t={graphic=convertGraphic(745,"monster"),color=0}
	local tFail={graphic=convertGraphic(3289,"item"),color=0}
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
						player.registry["forester"] = player.registry["forester"] + math.ceil(cost1+(cost1/2))
						player:addItem(itemNameRareY, 1)
						player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tItem, "You successfully create a "..itemName..". Your work is of very high quality!"}, 1)
					else
						player:dialogSeq({tFail, "You incorporate the flaming board into your work"}, 1)
						player:removeItem(mat1y, cost1)
						player:removeItem(mat2y, cost2)
						player.registry["forester"] = player.registry["forester"] + math.ceil((cost1+(cost1/2))/2)
						player:addItem(itemNameY, 1)
						player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tItem, "You successfully create a "..itemName.."."}, 1)
					end
				elseif(addFlaming == "No") then
					player:removeItem(mat1y, cost1)
					player.registry["forester"] = player.registry["forester"] + math.ceil(cost1/2)
					player:addItem(itemNameY, 1)
					player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tItem, "You successfully create a "..itemName.."."}, 1)
				else
					player:removeItem(mat1y, cost1)
					player.registry["forester"] = player.registry["forester"] + math.ceil(cost1/2)
					player:addItem(itemNameY, 1)
					player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tItem, "You successfully create a "..itemName.."."}, 1)
				end
			else
				player:removeItem(mat1y, cost1)
				player.registry["forester"] = player.registry["forester"] + math.ceil(cost1/2)
				player:addItem(itemNameY, 1)
				player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tItem, "You successfully create a "..itemName.."."}, 1)
			end
		else
			player:removeItem(mat1y, cost1)
			player.registry["forester"] = player.registry["forester"] + math.ceil(cost1/8)
			player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tFail, "You failed to produce anything useable."}, 1)
		end
	elseif (player:hasItem(mat1, cost1) ~= true) then
		player:dialogSeq({t, "Hmm...You don't seem to have enough wood for the job. Dont worry plenty of guys have the same problem"}, 1)
	end
end,

craftPatternShield = function(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, craftLevel, levelBonus)
	local t={graphic=convertGraphic(745,"monster"),color=0}
	local tFail={graphic=convertGraphic(3289,"item"),color=0}
	local confirmCraft = player:menuString("Crafting a "..itemName.." requires "..cost1.." "..mat1.." and a pattern. Proceed?", {"Yes", "No"})
	if (confirmCraft == "Yes" and player:hasItem(mat1y, cost1) == true and player:hasItem("pattern_"..itemNameY, 1) == true and math.random(100000) <= 85000) then
		if (string.find("pattern_"..itemNameY, "(.*)_elite") ~= nil and math.random(100000) <= 70000) then
			player:removeItem(mat1y, cost1)
			player:removeItem("pattern_"..itemNameY, 1)
			player.registry["forester"] = player.registry["forester"] + math.ceil(cost1/2)
			player:addItem(itemNameY, 1)
			player:dialogSeq({tItem, "You successfully create a "..itemName.."."}, 1)
		elseif (string.find("pattern_"..itemNameY, "(.*)_elite") == nil) then
			player:removeItem(mat1y, cost1)
			player:removeItem("pattern_"..itemNameY, 1)
			player.registry["forester"] = player.registry["forester"] + math.ceil(cost1/2)
			player:addItem(itemNameY, 1)
			player:dialogSeq({tItem, "You successfully create a "..itemName.."."}, 1)
		else
			player:removeItem(mat1y, cost1)
			player:removeItem("pattern_"..itemNameY, 1)
			player:dialogSeq({t, "Oops. You've completely mangled the recipe. There's no hope for this piece."}, 1)
		end
	elseif (player:hasItem(mat1, cost1) ~= true) then
		player:dialogSeq({t, "Hmm... You don't seem to have enough wood for the job. Dont worry plenty of guys have the same problem"}, 1)
	elseif (player:hasItem("pattern_"..itemNameY, 1) ~= true) then
		player:dialogSeq({t, "What are you going to pattern? Your hand..?"}, 1)
	else
		player:removeItem(mat1y, cost1)
		player:removeItem("pattern_"..itemNameY, 1)
		player:dialogSeq({t, "Oops. You've completely mangled the recipe. There's no hope for this piece."}, 1)
	end
end,

craftWeap = function(player, tItem, tItemRare, itemName, itemNameY, itemNameRareY, cost1, mat1, mat1y, cost2, mat2, mat2y, cost3, mat3, mat3y, craftLevel, levelBonus)
	local t={graphic=convertGraphic(745,"monster"),color=0}
	local tFail={graphic=convertGraphic(3289,"item"),color=0}
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
						player.registry["forester"] = player.registry["forester"] + math.ceil(cost1+(cost1/3))
						player:addItem(itemNameRareY, 1)
						player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tItem, "You successfully create a "..itemName..". Your work is of very high quality!"}, 1)
					else
						player:dialogSeq({tFail, "You incorporate the flaming board into your work"}, 1)
						player:removeItem(mat1y, cost1)
						player:removeItem(mat2y, cost2)
						player:removeItem(mat3y, cost3)
						player.registry["forester"] = player.registry["forester"] + math.ceil((cost1+(cost1/3))/2)
						player:addItem(itemNameY, 1)
						player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tItem, "You successfully create a "..itemName.."."}, 1)
					end
				elseif(addFlaming == "No") then
					player:removeItem(mat1y, cost1)
					player:removeItem(mat2y, cost2)
					player.registry["forester"] = player.registry["forester"] + math.ceil(cost1/3)
					player:addItem(itemNameY, 1)
					player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tItem, "You successfully create a "..itemName.."."}, 1)
				else
					player:removeItem(mat1y, cost1)
					player:removeItem(mat2y, cost2)
					player.registry["forester"] = player.registry["forester"] + math.ceil(cost1/3)
					player:addItem(itemNameY, 1)
					player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tItem, "You successfully create a "..itemName.."."}, 1)
				end
			else
				player:removeItem(mat1y, cost1)
				player:removeItem(mat2y, cost2)
				player.registry["forester"] = player.registry["forester"] + math.ceil(cost1/3)
				player:addItem(itemNameY, 1)
				player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tItem, "You successfully create a "..itemName.."."}, 1)
			end
		else
			player:removeItem(mat1y, cost1)
			player:removeItem(mat2y, cost2)
			player.registry["forester"] = player.registry["forester"] + math.ceil(cost1/12)
			player:dialogSeq({t, "*You chisle away the excess wood. Pieces are bound together and carefully carved. You sand the item until it is smooth*", tFail, "You failed to produce anything useable."}, 1)
		end
	elseif (player:hasItem(mat1y, cost1) ~= true or player:hasItem(mat2y, cost2) ~= true) then
		player:dialogSeq({t, "Hmm...You don't seem to have enough material for the job"}, 1)
	end
end
}