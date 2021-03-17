saw_mill = {
click = async(function(player, npc)
	local t = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	local bladeNum
	local paidSawTime
	local bladeInventory = player:hasItem("saw_blade", 9999999)
	local flamingAshLogInventory = player:hasItem("flaming_ash_log", 9999999)
	local ashLogInventory = player:hasItem("ash_log", 9999999)
	local woodInventory
	local woodToWork
	local sawMax
	local levelBonus = 0
	local woodOpts = {}
	local craftlevel = "Beginner"
	player.dialogType = 0
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	
	--CHECK AND UPDATE SKILL LEVEL
	if (player.registry["sawmiller"] >= 1 and player.registry["sawmiller"] < 25) then
		craftlevel = "Beginner"
		levelBonus = 0
	elseif (player.registry["sawmiller"] >= 25 and player.registry["sawmiller"] < 220) then
		craftlevel = "Novice"
		levelBonus = 1
	elseif (player.registry["sawmiller"] >= 220 and player.registry["sawmiller"] < 840) then
		craftlevel = "Apprentice"
		levelBonus = 2
	elseif (player.registry["sawmiller"] >= 840 and player.registry["sawmiller"] < 2200) then
		craftlevel = "Accomplished"
		levelBonus = 3
	elseif (player.registry["sawmiller"] >= 2200 and player.registry["sawmiller"] < 6400) then
		craftlevel = "Adept"
		levelBonus = 4
	elseif (player.registry["sawmiller"] >= 6400 and player.registry["sawmiller"] < 18000) then
		craftlevel = "Talented"
		levelBonus = 5
	elseif (player.registry["sawmiller"] >= 18000 and player.registry["sawmiller"] < 50000) then
		craftlevel = "Skilled"
		levelBonus = 6
	elseif (player.registry["sawmiller"] >= 50000 and player.registry["sawmiller"] < 124000) then
		craftlevel = "Expert"
		levelBonus = 7
	elseif (player.registry["sawmiller"] >= 124000 and player.registry["sawmiller"] < 237000) then
		craftlevel = "Master"
		levelBonus = 8
	elseif (player.registry["sawmiller"] >= 237000 and player.registry["sawmiller"] < 400000) then
		craftlevel = "Grand Master"
		levelBonus = 9
	elseif (player.registry["sawmiller"] >= 400000 and player.registry["sawmiller"] < 680000) then
		craftlevel = "Champion"
		levelBonus = 10
	elseif (player.registry["sawmiller"] >= 680000) then
		craftlevel = "Legendary"
		levelBonus = 12
	end
	
	player:removeLegendbyName("sawmiller")
	player:addLegend(craftlevel.." wood miller", "sawmiller", 208, 128)
	
	if (player.registry["sawTime"] == -1) then
		player.registry["sawTime"] = 0
	end
	
	if (player.registry["sawTime"] == 0) then
		player.registry["sawWoodNum"] = 0
		player.registry["sawWoodType"] = 0
	end

	if (player.registry["sawTime"] == 0) then
		local menu1 = player:menuString("-You brush saw dust off the top of the mill and remove the used dull blades-", {"Add new blades", "Nevermind"})
		
		if (menu1 == "Add new blades") then
			bladeNum = tonumber(player:input("How many blades would you like to load into the machine?"))
			
			if (bladeNum > bladeInventory) then
				bladeNum = bladeInventory
			end
			
			sawMax = bladeNum * 120
			
			local menu2 = player:menuString("That should be good for shaping "..sawMax.." logs into boards", {"Okay", "Nevermind"})
			
			if (menu2 == "Okay" and player:hasItem("saw_blade", 9999999) >= bladeNum and bladeNum > 0) then
				player:removeItem("saw_blade", bladeNum)
				npc:sendAnimationXY(122, npc.x, npc.y, 1)
				npc:playSound(1)
			else
				player.registry["sawTime"] = 0
				player:dialogSeq({t, "You do not have enough saw blades."}, 1)
				return
			end
		else
			return
		end
	
		if (player:hasItem("ash_log", 5) == true) then
			table.insert(woodOpts, "Process ash logs")
		end
		
		if (player:hasItem("flaming_ash_log", 5) == true) then
			table.insert(woodOpts, "Process flaming ash logs")
		end
		
		table.insert(woodOpts, "Nevermind")
		
		local menu3 = player:menuString("Adjust the machine for which boards?", woodOpts)
		
		if (menu3 == "Process ash logs") then
			woodToWork = tonumber(player:input("How many logs would you like to work into boards? The blades can handle up to "..sawMax.." and you have "..ashLogInventory, t))
			
			if (player:hasItem("ash_log", 9999999) < woodToWork) then
				player:dialogSeq({t, "You dont have that much wood..you remove your blades and reset the machine"}, 1)
				player:addItem("saw_blade", bladeNum)
				return
			elseif (woodToWork < 10) then
				player:dialogSeq({t, "The saw can not function without atleast 10 wood. You remove your blades."}, 1)
				player:addItem("saw_blade", bladeNum)
				return
			elseif (woodToWork > sawMax) then
				woodToWork = sawMax
			end
			
			player:removeItem("ash_log", woodToWork)
			player.registry["sawWoodNum"] = woodToWork
			player.registry["sawWoodType"] = 1
			player.registry["sawTime"] = os.time() + woodToWork * 5
			player:dialogSeq({t, "The blade accelerates and begins cutting into the wood"}, 1)
		elseif (menu3 == "Process flaming ash logs") then
			woodToWork = tonumber(player:input("How many logs would you like to work into boards? The blades can handle up to "..(sawMax / 2).." and you have "..flamingAshLogInventory, t))
			
			if (player:hasItem("flaming_ash_log", 9999999) < woodToWork) then
				player:dialogSeq({t, "You dont have that much wood..you remove your blades and reset the machine"}, 1)
				player:addItem("saw_blade", bladeNum)
				return
			elseif (woodToWork < 10) then
				player:dialogSeq({t, "The saw can not function without atleast 10 wood. You remove your blades."}, 1)
				player:addItem("saw_blade", bladeNum)
				return
			elseif (woodToWork > sawMax / 2) then
				woodToWork = sawMax
			end
			
			player:removeItem("flaming_ash_log", woodToWork)
			player.registry["sawWoodNum"] = woodToWork
			player.registry["sawWoodType"] = 2
			player.registry["sawTime"] = os.time() + woodToWork * 10
			player:dialogSeq({t, "The blade accelerates and begins cutting into the wood"}, 1)
		else
		end
	elseif (player.registry["sawTime"] > os.time()) then
		local timeRemaining = player.registry["sawTime"] - os.time()
		local minLeft = math.ceil(timeRemaining / 60)

		if (player.registry["sawWoodType"] == 1) then
			local totalTime = player.registry["sawWoodNum"] * 5
			local percentComplete = 100 - math.ceil(((totalTime - timeRemaining) / totalTime) * 100)
			
			player:dialogSeq({t, "There are "..player.registry["sawWoodNum"].." ash logs that are currently being milled", "Completion: "..percentComplete.."%\nTime remaining: "..minLeft.." minutes."}, 1)
		elseif (player.registry["sawWoodType"] == 2) then	
			local totalTime = player.registry["sawWoodNum"] * 10
			local percentComplete = 100 - math.ceil(((totalTime - timeRemaining) / totalTime) * 100)
			
			player:dialogSeq({t, "There are "..player.registry["sawWoodNum"].." flaming ash logs that are currently being milled", "Completion: "..percentComplete.."%\nTime remaining: "..minLeft.." minutes."}, 1)
		end
	elseif (player.registry["sawTime"] <= os.time() and player.registry["sawTime"] > 0) then
		local woodRecieved 
		local skillAdvance
		
		if (player.registry["sawWoodType"] == 1) then
			woodRecieved = math.floor(player.registry["sawWoodNum"] * math.random(20 + levelBonus * 10, 60 + levelBonus * 10) / 1000 + 0.4)
			skillAdvance =  math.floor(woodRecieved * math.random(300, 500) / 100 + 0.4)
			player.registry["sawWoodNum"] = 0
			player.registry["sawWoodType"] = 0
			player.registry["sawTime"] = 0
			player.registry["sawmiller"] = player.registry["sawmiller"] + skillAdvance
			if (woodRecieved > 0) then
				player:addItem("ash_board", woodRecieved)
				player:dialog("You crafted "..woodRecieved.." ash logs into boards", t)
			end
		elseif (player.registry["sawWoodType"] == 2) then
			woodRecieved = math.floor(player.registry["sawWoodNum"] * math.random(10 + levelBonus * 10, 40 + levelBonus * 10) / 1000 + 0.4)
			skillAdvance =  math.floor(woodRecieved * math.random(500, 700) / 100 + 0.4)
			player.registry["sawWoodNum"] = 0
			player.registry["sawWoodType"] = 0
			player.registry["sawTime"] = 0
			player.registry["sawmiller"] = player.registry["sawmiller"] + skillAdvance
			if (woodRecieved > 0) then
				player:addItem("flaming_ash_board", woodRecieved)
				player:dialog("You crafted "..woodRecieved.." flaming ash logs into boards", t)
			end
		else
		end
	end
end)
}