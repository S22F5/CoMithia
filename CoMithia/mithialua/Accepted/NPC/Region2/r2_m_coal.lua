r2_m_coal = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
		
	local options = {"Buy"}
	local quests = {}
	local menu
	
	if (player.class == 1 and player.quest["greatProtector"] >= 0 and player.quest["greatProtector"] < 250) then
		table.insert(quests, "Great Protector")
	end
	if ((player.quest["learnToSmelt"] >= 0 and player.quest["learnToSmelt"] < 250)
	or (player.quest["learnToMill"] >= 0 and player.quest["learnToMill"] < 250)
	or (player.quest["learnToWeave"] >= 0 and player.quest["learnToWeave"] < 250)) then
		table.insert(quests, "Crafting")
	end	

	if (#quests > 0) then
		table.insert(options, "Quest")
	end
	menu = player:menuString("*Wipes sweat from his brow*", options)
	if (menu == "Buy") then
		player:buyExtend("Urg sell you what you need", {1000000100, 1000000150})
	elseif (menu == "Quest") then
		r2_m_coal.questSelection(player, npc)
	end
end),

say = function(player, npc)
	local speech = player.speech
	local lspeech = string.lower(speech)

	if (lspeech == "quest") then
		npc:talk(0, npc.name..": tap my shoulder.")
	end
end,

questSelection = function(player, npc)
	local npcGraphics = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	local quests = {}
	
	player.npcGraphic = npcGraphics.graphic
	player.npcColor = npcGraphics.color
	player.dialogType = 0
	player.lastClick = npc.ID
	
	if (player.class == 1 and player.quest["greatProtector"] >= 0 and player.quest["greatProtector"] < 250) then
		table.insert(quests, "Great Protector")
	end
	if ((player.quest["learnToSmelt"] >= 0 and player.quest["learnToSmelt"] < 250)
	or (player.quest["learnToMill"] >= 0 and player.quest["learnToMill"] < 250)
	or (player.quest["learnToWeave"] >= 0 and player.quest["learnToWeave"] < 250)) then
		table.insert(quests, "Crafting")
	end
	
	if (#quests > 0) then
		local menu = player:menuString("Which quest?", quests)
		
		if (menu == "Great Protector") then
			greatProtector.questIndex(player, npc)
		elseif (menu == "Crafting") then
			options = {}
			if (player.quest["learnToSmelt"] >= 0 and player.quest["learnToSmelt"] < 250) then
				table.insert(options, "Mine, Smelt and Smith.")
			end
			if (player.quest["learnToMill"] >= 0 and player.quest["learnToMill"] < 250) then
				table.insert(options, "Woodcut, Mill and Forestry.")
			end
			if (player.quest["learnToWeave"] >= 0 and player.quest["learnToWeave"] < 250) then
				table.insert(options, "Wool, Weave and Tailor.")
			end
			menu = player:menuString("What crafts would you like to learn?", options)
			if (menu == "Mine, Smelt and Smith.") then
				r2_m_coal.quest(player, npc)
			elseif (menu == "Woodcut, Mill and Forestry.") then
				local r2_lj_xiaxueG = {graphic = convertGraphic(226, "monster"), color = 0}		
				player:dialogSeq({npcG, "You are in the wrong place for that!",
				r2_lj_xiaxueG, "Head to Axefel ((32,33)) in Mithian Woods and talk to Xia Xue!"}, 1)
			elseif (menu == "Wool, Weave and Tailor.") then
				local r2_s_weaverG = {graphic = convertGraphic(10, "monster"), color = 6}		
				player:dialogSeq({npcG, "You are in the wrong place for that!",
				r2_s_weaverG, "Head to Shepton ((30,10)) in Sudden Valley and talk to Nidle!"}, 1)
			end
		end
	else
		player:dialogSeq({"No quests available."}, 1)
	end
end,

quest = function(player, npc)
	local quests = {}
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color

	local learnToSmelt = player.quest["learnToSmelt"]
	local ironIngotG = {graphic = Item("iron_ingot").icon, color = Item("iron_ingot").iconC}
	local forgeG = {graphic = convertGraphic(827, "monster"), color = 0}
	local anvilG = {graphic = convertGraphic(828, "monster"), color = 0}
	local springArmorG = {graphic = Item("spring_armor").icon, color = Item("spring_armor").iconC}
	
	if (learnToSmelt == 0) then
		player:dialogSeq({npcG, "So you want to learn how to Mine?\n\nThink you have what it takes?",
		"Here is a Pick, go get me 10 Iron Ore.\n\n((Equip the Pickaxe, walk up to an Iron vein and swing to mine.))"}, 1)
		if (player:hasSpace("mining_pick", 1)) then
			player:addItem("mining_pick", 1)
			player.quest["learnToSmelt"] = 1
		else
			player:dialogSeq({npcG, "You plan to mine and can't even hold a pick?"}, 1)
		end
	elseif (learnToSmelt == 1) then
		if (player:hasItem("iron_ore", 10) == true) then
			player:dialogSeq({npcG, "Thanks a lot, that's going to help quite a bit.",
			ironIngotG, "How about smelting it into some ingots so we can smith something."}, 1)
			if (player:hasSpace("coal", 1)) then
				player:removeItem("iron_ore", 10)
				player:addItem("coal", 1)
				player.quest["learnToSmelt"] = 2
				player:giveXP(200)
			else
				player:dialogSeq({npcG, "\n((You should always have inventory space available when doing quests.))"}, 1)
			end
		else
			player:dialogSeq({npcG, "Here is a Pick, go get me 10 Iron Ore.\n\n((Equip the Pickaxe, walk up to an Iron vein and swing to mine.))"}, 1)
		end
	elseif (learnToSmelt == 2) then
		if (player:hasItem("iron_ingot", 1) == true) then
			if (player:hasSpace("iron_ingot", 9)) then
				player:dialogSeq({npcG, "About time you got back!\n\nI was getting impatient.",
				anvilG, "Nevermind that, go craft me some new armor at the Anvils in Sweating Rocks ((42,07)).",
				springArmorG, "Craft me a Spring armor and bring it back to me.",
				ironIngotG, "Here, this will help you."}, 1)
				player:addItem("iron_ingot", 9)
				player.quest["learnToSmelt"] = 3
				player:giveXP(300)
			else
				player:dialogSeq({npcG, "\n((You should always have inventory space available when doing quests.))"}, 1)
			end
		else
			player:dialogSeq({forgeG, "Head over to the Forge in Sweating Rocks ((37,04)).",
			ironIngotG, "Put that piece of Coal in, then put the ore in.\n\nBring me back one Steel Ingot."}, 1)
		end
	elseif (learnToSmelt == 3) then
		if (player:hasItem("spring_armor", 1) == true) then
			player:dialogSeq({npcG, "Alright! Now you can show those pests who's who around here!\n\nThanks for the help!"}, 1)
			player.quest["learnToSmelt"] = 250
			player:giveXP(500)
		else
			player:dialogSeq({anvilG, "Go craft me some new armor at the Anvils in Sweating Rocks ((42,07)).",
			springArmorG, "Craft me a Spring armor and bring it back to me."}, 1)
		end
	end
end,

action = function(npc, player)
	if (math.random(0,3) == 0) then
		if(math.random(0,1) == 0) then
			if(npc.side == 0) then
				npc.side = 3
			else
				npc.side = npc.side - 1
			end
		else
			if(npc.side == 3) then
				npc.side = 0
			else
				npc.side = npc.side + 1
			end
		end
	end
	npc:sendSide()
	if (math.random(0,4) == 0) then
		npc:move()
	end
end
}