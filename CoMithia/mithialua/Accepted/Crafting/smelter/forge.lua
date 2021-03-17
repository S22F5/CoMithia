forge = {
click=async(function(player,npc)
	--SETUP
	local npcG = {graphic = convertGraphic(827, "monster"), color=0}
	local coalTotal = 0
	local levelBonus = 0
	local smeltCap = 999999999999999
	local craftlevel="Beginner"
	player.dialogType = 0
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	
	--[[
	player:dialogSeq({npcG, "Table is under maintenance."}, 1)
	return]]--
	
	
	if (player.registry["forgeTime"] == -1) then
		player.registry["forgeTime"] = 0
	end
	
	if(player.registry["forgeTime"] == 0) then
		player.registry["forgeOreNum"] = 0
		player.registry["forgeOreType"] = 0
	end
	
	--CHECK AND UPDATE SKILL LEVEL
	if(player.registry["smelter"]<25) then
		craftlevel="Beginner"
		levelBonus = 0
	elseif(player.registry["smelter"]>=25 and player.registry["smelter"]<220) then
		craftlevel="Novice"
		levelBonus = 1
	elseif(player.registry["smelter"]>=220 and player.registry["smelter"]<840) then
		craftlevel="Apprentice"
		levelBonus = 2
	elseif(player.registry["smelter"]>=840 and player.registry["smelter"]<2200) then
		craftlevel="Accomplished"
		levelBonus = 3
	elseif(player.registry["smelter"]>=2200 and player.registry["smelter"]<6400) then
		craftlevel="Adept"
		levelBonus = 4
	elseif(player.registry["smelter"]>=6400 and player.registry["smelter"]<18000) then
		craftlevel="Talented"
		levelBonus = 5
	elseif(player.registry["smelter"]>=18000 and player.registry["smelter"]<50000) then
		craftlevel="Skilled"
		levelBonus = 6
	elseif(player.registry["smelter"]>=50000 and player.registry["smelter"]<124000) then
		craftlevel="Expert"
		levelBonus = 7
	elseif(player.registry["smelter"]>=124000 and player.registry["smelter"]<237000) then
		craftlevel="Master"
		levelBonus = 8
	elseif(player.registry["smelter"]>=237000 and player.registry["smelter"]<400000) then
		craftlevel="Grand Master"
		levelBonus = 9
	elseif(player.registry["smelter"]>=400000 and player.registry["smelter"]<680000) then
		craftlevel="Champion"
		levelBonus = 10
	elseif(player.registry["smelter"]>=680000) then
		craftlevel="Legendary"
		levelBonus = 12
	end
	
	player:removeLegendbyName("smelter")
	player:addLegend(""..craftlevel.." smelter","smelter",76,128)

	-- START OF MENU OPTIONS
	-- Registry info: forgeTime is the servertime the forge was lit. forgeOreType is the type of ore being smelted. forgeOreNum is the number of ore being smelted.
	if(player.registry["forgeTime"] == 0) then
		local forgeOpts = {}
		local forgeChoice = "blank"
		
		repeat 
			forgeOpts = {}
			forgeChoice = "blank"
			
			if(player:hasItem("coal", 1) == true) then
				table.insert(forgeOpts, "Add coal")
			end
			
			if(player:hasItem("mithian_ash_log", 1) == true) then
				table.insert(forgeOpts, "Add mithian ash log")
			end
			
			if (coalTotal > 0) then
				if(player:hasItem("iron_ore", 5) == true) then
					table.insert(forgeOpts, "Smelt iron ore")
				end
				if(player:hasItem("copper_ore", 5) == true and player.registry["smelter"] >= 220) then
					table.insert(forgeOpts, "Smelt copper ore")
				end
			end
				
			if(coalTotal == 0) then
				table.insert(forgeOpts, "I have nothing to add")
			end
			
			if(coalTotal == 0) then
				forgeChoice = player:menuString("The embers within the forge burn dimmly.", forgeOpts)
			elseif(coalTotal <  300) then
				forgeChoice = player:menuString("The forge is hot. The heat will last ".. coalTotal/60 .." minutes", forgeOpts)
			elseif(coalTotal <  1800) then
				forgeChoice = player:menuString("The forge is very hot. The heat will last ".. coalTotal/60 .." minutes", forgeOpts)
			elseif(coalTotal <  3600) then
				forgeChoice = player:menuString("The forge is extremely hot. The heat will last ".. coalTotal/60 .." minutes", forgeOpts)
			else
				forgeChoice = player:menuString("The fire of the forge rages. The heat will last ".. coalTotal/60 .." minutes", forgeOpts)
			end
			
			if(forgeChoice == "Add coal") then
				local howMany = tonumber(player:input("How many coal would you like to add to the forge?"))
				if(player:hasItem("coal", howMany) == true) then
					coalTotal = coalTotal + 20*60*howMany
					player:removeItem("coal", howMany)
					npc:sendAnimationXY(8,npc.x,npc.y,1)
					npc:playSound(82)
				else
					player:dialog("You do not have that many to add...", npcG)
				end
			elseif(forgeChoice == "Add mithian ash log") then
				local howMany = tonumber(player:input("How many logs would you like to add to the forge?"))
				if(player:hasItem("mithian_ash_log", howMany) == true) then
					coalTotal = coalTotal + 1*60*howMany
					player:removeItem("mithian_ash_log", howMany)
					npc:sendAnimationXY(8,npc.x,npc.y,1)
					npc:playSound(82)
				else
					player:dialog("You do not have that many to add...", npcG)
				end
			end
		
		until (forgeChoice ~= "Add coal" and forgeChoice ~= "Add mithian ash log")
		--coalTotal has been established
		
		if(coalTotal == 0) then
			return
		end
		
		if(forgeChoice == "Smelt iron ore") then
		
			if(coalTotal/5 < 5) then
				player:dialog("The forge is not hot enough to smelt any iron", npcG)
			end
			
			local ironInventory = 0
			ironInventoy = player:hasItem("iron_ore", 9999999)
			local howMany = tonumber(player:input("How many iron ore would you like to smelt? You have "..ironInventoy.." and forge is hot enough to smelt "..coalTotal/5))
			if(player:hasItem("iron_ore", howMany) == true and howMany <= coalTotal/5 and howMany >= 5) then
				player:removeItem("iron_ore",howMany)
				player.registry["forgeOreNum"] = howMany
				player.registry["forgeOreType"] = 1
				player.registry["forgeTime"] = 5*howMany + os.time()
				player:dialog("".. howMany .." iron ore have been added to the forge", npcG)
			elseif(howMany < 5) then
				player:dialog("You need to smelt atleast 5 ore. The forge has been extinguished.", npcG)
			elseif(howMany > coalTotal/5) then
				player:removeItem("iron_ore", coalTotal/5)
				player.registry["forgeOreNum"] = coalTotal/5
				player.registry["forgeOreType"] = 1
				player.registry["forgeTime"] = 5*coalTotal/5 + os.time()
				player:dialogSeq({npcG, "That is too many, but you smelt what you can.." ,npcG ,"".. coalTotal/5 .." iron ore have been added to the forge"}, 1)
			elseif(howMany > ironInventoy) then
				player:removeItem("iron_ore", ironInventoy)
				player.registry["forgeOreNum"] = ironInventoy
				player.registry["forgeOreType"] = 1
				player.registry["forgeTime"] = 5*ironInventoy + os.time()
				player:dialogSeq({npcG, "That is too many, but you smelt what you can.." ,npcG ,"".. ironInventoy .." iron ore have been added to the forge"}, 1)
			end
			
		elseif(forgeChoice == "Smelt copper ore") then
			if(coalTotal/10 < 5) then
				player:dialog("The forge is not hot enough to smelt any copper", npcG)
			end
			
			local copperInventory = 0
			copperInventory = player:hasItem("copper_ore", 9999999)
			local howMany = tonumber(player:input("How many copper ore would you like to smelt? You have "..copperInventory.." and forge is hot enough to smelt "..coalTotal/10))
			if(player:hasItem("copper_ore", howMany) == true and howMany <= coalTotal/10 and howMany >= 5) then
				player:removeItem("copper_ore",howMany)
				player.registry["forgeOreNum"] = howMany
				player.registry["forgeOreType"] = 2
				player.registry["forgeTime"] = 10*howMany + os.time()
				player:dialog("".. howMany .." copper ore have been added to the forge", npcG)
			elseif(howMany < 5) then
				player:dialog("You need to smelt atleast 5 ore. The forge has been extinguished.", npcG)
			elseif(howMany > coalTotal/10) then
				player:removeItem("copper_ore", coalTotal/10)
				player.registry["forgeOreNum"] = coalTotal/10
				player.registry["forgeOreType"] = 2
				player.registry["forgeTime"] = 10*coalTotal/10 + os.time()
				player:dialogSeq({npcG, "That is too many, but you smelt what you can.." ,npcG ,"".. coalTotal/10 .." copper ore have been added to the forge"}, 1)
			elseif(howMany > copperInventory) then
				player:removeItem("copper_ore", copperInventory)
				player.registry["forgeOreNum"] = copperInventoryy
				player.registry["forgeOreType"] = 2
				player.registry["forgeTime"] = 10*copperInventory + os.time()
				player:dialogSeq({npcG, "That is too many, but you smelt what you can.." ,npcG ,"".. copperInventory .." copper ore have been added to the forge"}, 1)
			end
		else
			player:dialog("something went wrong", npcG)
		end
		
	elseif(player.registry["forgeTime"] > os.time()) then
		if(player.registry["forgeOreType"] == 1) then	
			local percentComplete = 100 - math.ceil((player.registry["forgeTime"] - os.time()) / (player.registry["forgeOreNum"] * 5) * 100)
			local minLeft = math.ceil(-(os.time() - (player.registry["forgeTime"]))/60)
			player:dialogSeq({npcG, ""..player.registry["forgeOreNum"].." iron ore are being smelted",npcG ,"Compeition: "..percentComplete.."%                                                     Time remaining: "..minLeft.." minutes."}, 1)
		elseif(player.registry["forgeOreType"] == 2) then
			local percentComplete = 100 - math.ceil((player.registry["forgeTime"] - os.time()) / (player.registry["forgeOreNum"] * 10) * 100)
			local minLeft = math.ceil(-(os.time() - (player.registry["forgeTime"]))/60)
			player:dialogSeq({npcG, ""..player.registry["forgeOreNum"].." copper ore are being smelted",npcG ,"Completion: "..percentComplete.."%                                                     Time remaining: "..minLeft.." minutes."}, 1)   
		else

		end
	
	elseif(player.registry["forgeTime"] <= os.time() and player.registry["forgeTime"] > 0) then
		local ingotRecieved 
		local skillAdvance
		if(player.registry["forgeOreType"] == 1) then
			ingotRecieved = math.floor( player.registry["forgeOreNum"] * math.random(20+levelBonus*10,60+levelBonus*10)/1000 +0.4)
			skillAdvance =  math.floor( ingotRecieved * math.random(300,500)/100 + 0.4)
			player.registry["forgeOreNum"] = 0
			player.registry["forgeOreType"] = 0
			player.registry["forgeTime"] = 0
			if (player.registry["smelter"] < smeltCap) then
				player.registry["smelter"] = player.registry["smelter"] + skillAdvance
			else
				player:sendMinitext("You have reached the maximum skill level")
			end
			if (ingotRecieved > 0) then
				player:addItem("iron_ingot", ingotRecieved)
				player:dialog("You produced "..ingotRecieved.." steel ingots", npcG)
			end
		elseif(player.registry["forgeOreType"] == 2) then
			ingotRecieved = math.floor( player.registry["forgeOreNum"] * math.random(10+levelBonus*10,40+levelBonus*10)/1000 +0.4)
			skillAdvance =  math.floor( ingotRecieved * math.random(500,700)/100 + 0.4)
			player.registry["forgeOreNum"] = 0
			player.registry["forgeOreType"] = 0
			player.registry["forgeTime"] = 0
			if (player.registry["smelter"] < smeltCap) then
				player.registry["smelter"] = player.registry["smelter"] + skillAdvance
			else
				player:sendMinitext("You have reached the maximum skill level")
			end
			if (ingotRecieved > 0) then
				player:addItem("copper_ingot", ingotRecieved)
				player:dialog("You produced "..ingotRecieved.." copper ingots", npcG)
			end
		end
		
		--RESET FORGE REGISTIRES
		player.registry["forgeOreNum"] = 0
		player.registry["forgeOreType"] = 0
		player.registry["forgeTime"] = 0
	end
end)
}