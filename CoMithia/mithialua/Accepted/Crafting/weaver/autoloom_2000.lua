autoloom_2000 = {

	click=async(function(player,npc)
		--SETUP
		local t={graphic=convertGraphic(742,"monster"),color=0}
		local loomCost = 0
		local paidLoomTime
		local woolInventory
		local woolToWeave
		local weaveMax
		local levelBonus = 0
		local weaveCap = 2200
		
		local woolOpts = { }
		player.dialogType = 0
		player.npcGraphic=t.graphic
		player.npcColor=t.color

		--[[
		player:dialogSeq({t, "Table is under maintenance."}, 1)
		return]]--
		
		if (player.registry["loomTime"] == -1) then
			player.registry["loomTime"] = 0
		end
		
		if (player.registry["loomTime"] == 0) then
			player.registry["loomWoolNum"] = 0
			player.registry["loomWoolType"] = 0
		end
		
		--CHECK AND UPDATE SKILL LEVEL
		local craftlevel="Beginner"
		
		if(player.registry["weaver"]<25) then
			craftlevel="Beginner"
			levelBonus = 0
		elseif(player.registry["weaver"]>=25 and player.registry["weaver"]<220) then
			craftlevel="Novice"
			levelBonus = 1
		elseif(player.registry["weaver"]>=220 and player.registry["weaver"]<840) then
			craftlevel="Apprentice"
			levelBonus = 2
		elseif(player.registry["weaver"]>=840 and player.registry["weaver"]<2200) then
			craftlevel="Accomplished"
			levelBonus = 3
		elseif(player.registry["weaver"]>=2200 and player.registry["weaver"]<6400) then
			craftlevel="Adept"
			levelBonus = 4
		elseif(player.registry["weaver"]>=6400 and player.registry["weaver"]<18000) then
			craftlevel="Talented"
			levelBonus = 5
		elseif(player.registry["weaver"]>=18000 and player.registry["weaver"]<50000) then
			craftlevel="Skilled"
			levelBonus = 6
		elseif(player.registry["weaver"]>=50000 and player.registry["weaver"]<124000) then
			craftlevel="Expert"
			levelBonus = 7
		elseif(player.registry["weaver"]>=124000 and player.registry["weaver"]<237000) then
			craftlevel="Master"
			levelBonus = 8
		elseif(player.registry["weaver"]>=237000 and player.registry["weaver"]<400000) then
			craftlevel="Grand Master"
			levelBonus = 9
		elseif(player.registry["weaver"]>=400000 and player.registry["weaver"]<680000) then
			craftlevel="Champion"
			levelBonus = 10
		elseif(player.registry["weaver"]>=680000) then
			craftlevel="Legendary"
			levelBonus = 12
		end
		player:removeLegendbyName("weaver")
		player:addLegend(""..craftlevel.." weaver","weaver",64,128)	
	
		
		if(player.registry["loomTime"] == 0) then
			
			local menu1 = player:menuString("<b>Autoloom 2000\n*Gears turn and switches click as the loom starts up*", {"Insert coins"})
			if (menu1 == "Insert coins") then
				loomCost = tonumber(player:input("Time on the autoloom is 15c per minute. How many minutes do you wish to purchase?"))
				loomCost = loomCost * 15
				weaveMax = loomCost * .8
				
				if(player.money >= loomCost) then
					local menu2 = player:menuString("This is enough time to weave "..weaveMax.." wool into cloth", {"Okay", "Nevermind"})
					if(menu2 == "Okay" and player:removeGold(loomCost) == true) then
						npc:sendAnimationXY(92,npc.x,npc.y,1)
						npc:playSound(86)
					else
						return
					end
				else
					player:dialog("You dont have enough gold", t)
				end
			end
		
			if(player:hasItem("wool", 5) == true) then
				table.insert(woolOpts, "Weave regular wool")
			end
			if(player:hasItem("golden_wool", 5) == true) then
				table.insert(woolOpts, "Weave golden wool")
			end
			table.insert(woolOpts, "I don't have enough to weave.")
			
			local menu3 = player:menuString("Which type of wool would you like to weave?", woolOpts)
			
			if(menu3 == "Weave regular wool") then
				woolInventory = player:hasItem("wool", 9999999)
				woolToWeave = tonumber(player:input("How many wool would you like to weave? The machine has time for up to "..weaveMax.." and you have "..woolInventory, t))
				if(woolInventory < woolToWeave) then
					player:dialogSeq({t, "You dont have that many wool. The machine clatters and shuts down."}, 0)
				elseif(woolToWeave < 5) then
					player:dialogSeq({t, "The loom can not function without atleast 5 wool. The machine clatters and shuts down."}, 0)
				elseif(woolToWeave > weaveMax) then
					woolToWeave = weaveMax
				end
				
				player:removeItem("wool", woolToWeave)
				player.registry["loomWoolNum"] = woolToWeave
				player.registry["loomWoolType"] = 1
				player.registry["loomTime"] = os.time() + woolToWeave * 5 
				player:dialogSeq({t, "The autoloom 2000 springs into action."}, 0)
			elseif(menu3 == "Weave golden wool") then
				if (weaveMax / 2 < 5) then
					player:dialog("You have not paid enough time to weave any golden wool.", npcG)
				end
				
				woolInventory = player:hasItem("golden_wool", 9999999)
				woolToWeave = tonumber(player:input("How many golden wool would you like to weave? The machine has time for up to "..(weaveMax / 2).." and you have "..woolInventory, t))
				if(woolInventory < woolToWeave) then
					player:dialogSeq({t, "You dont have that many wool. The machine clatters and shuts down."}, 0)
				elseif(woolToWeave < 5) then
					player:dialogSeq({t, "The loom can not function without atleast 5 wool. The machine clatters and shuts down."}, 0)
				elseif(woolToWeave > weaveMax / 2) then
					woolToWeave = weaveMax / 2
				end
				player:removeItem("golden_wool", woolToWeave)
				player.registry["loomWoolNum"] = woolToWeave
				player.registry["loomWoolType"] = 2
				player.registry["loomTime"] = os.time() + woolToWeave * 10 
				player:dialogSeq({t, "The autoloom 2000 springs into action."}, 0)
			end
		elseif(player.registry["loomTime"] > os.time()) then
			if(player.registry["loomWoolType"] == 1) then	
				local percentComplete = 100 - math.ceil((player.registry["loomTime"] - os.time()) / (player.registry["loomWoolNum"] * 5) * 100)
				local minLeft = math.ceil(-(os.time() - (player.registry["loomTime"]))/60)
				player:dialogSeq({t, "There are "..player.registry["loomWoolNum"].." regular wool that are currently being weaved",t ,"Completion: "..percentComplete.."%                                                     Time remaining: "..minLeft.." minutes."}, 1)
			elseif(player.registry["loomWoolType"] == 2) then
				local percentComplete = 100 - math.ceil((player.registry["loomTime"] - os.time()) / (player.registry["loomWoolNum"] * 10) * 100)
				local minLeft = math.ceil(-(os.time() - (player.registry["loomTime"]))/60)
				player:dialogSeq({t, "There are "..player.registry["loomWoolNum"].." golden wool that are currently being weaved",t ,"Completion: "..percentComplete.."%                                                     Time remaining: "..minLeft.." minutes."}, 1)                 
			else

			end
		elseif(player.registry["loomTime"] <= os.time() and player.registry["loomTime"] > 0) then
			local clothRecieved 
			local skillAdvance
			if(player.registry["loomWoolType"] == 1) then
				clothRecieved = math.floor( player.registry["loomWoolNum"] * math.random(20+levelBonus*10,60+levelBonus*10)/1000 +0.4)
				skillAdvance =  math.floor( clothRecieved * math.random(300,500)/100 + 0.4)
				player.registry["loomWoolNum"] = 0
				player.registry["loomWoolType"] = 0
				player.registry["loomTime"] = 0
				
				player.registry["weaver"] = player.registry["weaver"] + skillAdvance
				
				if (clothRecieved > 0) then
					player:addItem("cloth", clothRecieved)
					player:dialog("You produced "..clothRecieved.." bolts of cloth", t)
				end
			elseif(player.registry["loomWoolType"] == 2) then
				clothRecieved = math.floor( player.registry["loomWoolNum"] * math.random(10+levelBonus*10,40+levelBonus*10)/1000 +0.4)
				skillAdvance =  math.floor( clothRecieved * math.random(500,700)/100 + 0.4)
				player.registry["loomWoolNum"] = 0
				player.registry["loomWoolType"] = 0
				player.registry["loomTime"] = 0
				
				player.registry["weaver"] = player.registry["weaver"] + skillAdvance
				
				if (clothRecieved > 0) then
					player:addItem("golden_cloth", clothRecieved)
					player:dialog("You produced "..clothRecieved.." bolts of golden cloth", t)
				end
			end
		end
	end)

}