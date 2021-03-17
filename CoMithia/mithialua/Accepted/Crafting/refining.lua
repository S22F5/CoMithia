refining = {
	--materialTable contains: [1]-yname of craftable [2]yname of product [3]amount crafted per token [4]seconds for each to craft [5]sucess rate 0-100 [6]skill advance [7] materialID [8] amount in inventory
	refine = function(player, graphicTable, skillName, legendIcon, token, materialTable, materialMinimum, dialogTable)
		--ONLY CHANGE THESE
		
		
		--END
		local materialInventory = { }
		local levelBonus = refining.setSkill(player, skillName, legendIcon)
		--fill materialInventory. If the player has the min amount to craft, add that amount to materialTable, and then move that into a second table. This culls unneeded materials from future menus
		for i=1, #materialTable,1 do
			if(player:hasItem(materialTable[i][1],99999) >= materialMinimum) then
				table.insert(materialTable[i], player:hasItem(materialTable[i][1],99999))
				table.insert(materialInventory,materialTable[i][1])
			end
		end
		
		--This runs the first time the player clicks in a lifetime
		if(player.registry[skillName.."Time"] == 0) then
			player.registry[skillName.."Number"] = 0
			player.registry[skillName.."Type"] = 0
			player.registry[skillName.."Time"] = -1
		end
		
		--Determine what state of the crafting process we are in and choose the right function.
		if(player.registry[skillName.."Time"] == -1) then --start
			refining.beginCraft(player, graphicTable, skillName, token, materialInventory, dialogTable)
		elseif(player.registry[skillName.."Time"] > os.time()) then --in progress
			refining.inProgress(player, graphicTable, skillName, materialTable, dialogTable, levelBonus)
		elseif(player.registry[skillName.."Time"] <= os.time()) then --finished
			refining.finished(player, graphicTable, skillName, materialTable, dialogTable)
		end
	end,
	
	setSkill = function(player, skillName, legendIcon)
	local craftlevel="Beginner"
		
		if(player.registry[skillName]>=1 and player.registry[skillName]<25) then
			craftlevel="Beginner"
			levelBonus = 0
		end
		if(player.registry[skillName]>=25 and player.registry[skillName]<220) then
			craftlevel="Novice"
			levelBonus = 1
		end
		if(player.registry[skillName]>=220 and player.registry[skillName]<840) then
			craftlevel="Apprentice"
			levelBonus = 2
		end
		if(player.registry[skillName]>=840 and player.registry[skillName]<2200) then
			craftlevel="Accomplished"
			levelBonus = 3
		end
		if(player.registry[skillName]>=2200 and player.registry[skillName]<6400) then
			craftlevel="Adept"
			levelBonus = 4
		end
		if(player.registry[skillName]>=6400 and player.registry[skillName]<18000) then
			craftlevel="Talented"
			levelBonus = 5
		end
		if(player.registry[skillName]>=18000 and player.registry[skillName]<50000) then
			craftlevel="Skilled"
			levelBonus = 6
		end
		if(player.registry[skillName]>=50000 and player.registry[skillName]<124000) then
			craftlevel="Expert"
			levelBonus = 7
		end
		if(player.registry[skillName]>=124000 and player.registry[skillName]<237000) then
			craftlevel="Master"
			levelBonus = 8
		end
		if(player.registry[skillName]>=237000 and player.registry[skillName]<400000) then
			craftlevel="Grand Master"
			levelBonus = 9
		end
		if(player.registry[skillName]>=400000 and player.registry[skillName]<680000) then
			craftlevel="Champion"
			levelBonus = 10
		end
		if(player.registry[skillName]>=680000) then
			craftlevel="Legendary"
			levelBonus = 12
		end
		player:removeLegendbyName(skillName)
		player:addLegend(""..craftlevel.." "..skillName,skillName,legendIcon,128)
		return levelBonus
	end,
	
	beginCraft = function(player, graphicTable, skillName, token, materialInventory, dialogTable)
		local tokenNumber = player:hasItem(token, 999999)
		local selectionOpts = { }
		local selection
		local menu1Opts
		local menu2
		local menu3
		local tokensRequired
		for i=1,#materialInventory,1 do
			table.insert(selectionOpts,Item(materialInventory[1]).name)
		end
		table.insert(selectionOpts,"Nevermind")
		selection = player:menu("What would you like to craft?", selectionOpts)
		--debug shit
		player:talk(2,""..selection)
		player:talk(2,""..materialInventory[selection][1])
		player:talk(2,""..materialInventory[selection][8])
		--
		if(selection == #materialInventory+1) then
			player:dialog("Very well..", graphicTable)
		else
			menu2 = toNumber(player:input("You have "..materialInventory[selection][8].." "..Item(materialInventory[selection][1]).name..". How many would you like to craft?"))
			if(menu2 > materialInventory[selection][8] or menu2 < 25) then
				player:dialog("You can not refine that many.", graphicTable)
			else
				tokensRequired = math.ceil(menu2 / materialInventory[selection][3])
				menu3 = player:menuString("Refining that many requires "..tokensRequired.." "..Item(token).name.."s. Do you wish to proceed?", {"Yes", "No"})
				if(menu3 == "No") then
					player:dialog("Very well..")
				else
					if((tokenInventory >= tokensRequired) and (materialInventory[selection][8] >= menu2)) then
						player:removeItem(materialInventory[selection][1], menu2)
						player:removeItem(token, tokensRequired)
						player.registry[skillName.."Number"] = menu2
						player.registry[skillName.."Type"] = materialInventory[selection][7]
						player.registry[skillName.."Time"] = os.time() + materialInventory[selection][8]*materialInventory[selection][4]
						player:dialog("Great. All is well.", graphicTable)
					elseif(materialInventory[selection][8] < menu2 or tokenInventory < tokensRequired) then
						player:dialog("You do not have the required materials", graphicTable)
					end
				end
			end
		end
	end,
	
	inProgress = function(player, graphicTable, skillName, materialTable, dialogTable, levelBonus)
		local timeLeft = player.registry[skillName.."Time"] - os.time()
		local totalTime = materialTable[player.registry[skillName.."Type"]][4]*player.registry[skillName.."Number"]
		local percentComplete = math.floor(timeLeft / totalTime * 100)
		player:dialogSeq({{}, "There are "..player.registry[skillName.."Number"].." "..Item(materialTable[player.registry[skillName.."Type"]][1]).name.." that are currently being refined",t ,"Complition: "..percentComplete.."%                                                     Time remaining: "..math.floor(timeLeft/60).." minutes."}, 1)
	end,
	
	finished = function(player, graphicTable, skillName, materialTable, dialogTable)	
		local produced = refining.normalize(player.registry[skillName.."Number"] * materialTable[skillName.."Type"][5]/100+levelBonus*3, 1)
		local skillIncrease = produced * 2
		player.addItem(materialTable[player.registry[skillName.."Type"]][1],produced)
		player.registry[skillName.."Number"] = 0
		player.registry[skillName.."Type"] = 0
		player.registry[skillName.."Time"] = -1
		player.registry[skillName] = player.registry[skillName] + skillIncrease
		player:dialogSeq({{}, "You produced "..produced}, 1)
	end,
	
	normalize = function(average, std)
		local a = math.random()
		local b = math.random()
		return average + (math.sqrt(-2*math.log(a)*math.cos(2*3.14159*b)) * std)
	end
}
