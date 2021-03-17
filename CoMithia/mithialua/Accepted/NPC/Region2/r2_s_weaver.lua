r2_s_weaver = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(10, "monster"), color = 6}
	local thingsIBuy = {}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0
	
	local menu
	local quests = {}
	local options = {"Sell"}
	
	for i = 1, 168 do
		table.insert(thingsIBuy, 190000000 + i)
	end
	
	if ((player.quest["learnToSmelt"] >= 0 and player.quest["learnToSmelt"] < 250)
	or (player.quest["learnToMill"] >= 0 and player.quest["learnToMill"] < 250)
	or (player.quest["learnToWeave"] >= 0 and player.quest["learnToWeave"] < 250)) then
		table.insert(quests, "Crafting")
	end
	if (#quests > 0) then
		table.insert(options, "Quest")
	end
	menu = player:menuString("How may I help you?", options)
	if (menu == "Sell") then
		player:sellExtend("What do you have to sell?", thingsIBuy)
	elseif (menu == "Quest") then
		menu = player:menuString("Which quest?", quests)
		if (menu == "Crafting") then
			options = {}
			if (player.quest["learnToWeave"] >= 0 and player.quest["learnToWeave"] < 250) then
				table.insert(options, "Wool, Weave and Tailor.")
			end
			if (player.quest["learnToSmelt"] >= 0 and player.quest["learnToSmelt"] < 250) then
				table.insert(options, "Mine, Smelt and Smith.")
			end
			if (player.quest["learnToMill"] >= 0 and player.quest["learnToMill"] < 250) then
				table.insert(options, "Woodcut, Mill and Forestry.")
			end
			menu = player:menuString("What crafts would you like to learn?", options)
			if (menu == "Mine, Smelt and Smith.") then
				local r2_m_coalG = {graphic = convertGraphic(185, "monster"), color = 28}		
				player:dialogSeq({npcG, "You are in the wrong place for that!",
				r2_m_coalG, "Head to Iron Mine ((32,06)) in Minefield and talk to Mog!"}, 1)
			elseif (menu == "Woodcut, Mill and Forestry.") then
				local r2_lj_xiaxueG = {graphic = convertGraphic(226, "monster"), color = 0}		
				player:dialogSeq({npcG, "You are in the wrong place for that!",
				r2_lj_xiaxueG, "Head to Axefel ((32,33)) in Mithian Woods and talk to Xia Xue!"}, 1)
			elseif (menu == "Wool, Weave and Tailor.") then
				r2_s_weaver.quest(player, npc)
			end
		end
	end
end),

say = function(player, npc)
	local speech = player.speech
	local lspeech = string.lower(speech)

	if (lspeech == "quest") then
		npc:talk(0, npc.name..": Tap my shoulder.")
	end
end,

quest = function(player, npc)
	local quests = {}
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color

	local learnToWeave = player.quest["learnToWeave"]
	local shearsG = {graphic = Item("shears").icon, color = Item("shears").iconC}
	local woolG = {graphic = Item("wool").icon, color = Item("wool").iconC}
	local sheepG = {graphic = convertGraphic(173, "monster"), color = 8}
	local autoLoomG = {graphic = convertGraphic(742, "monster"), color = 0}
	local tailorTableG = {graphic = convertGraphic(744, "monster"), color = 0}
	local clothG = {graphic = Item("cloth").icon, color = Item("cloth").iconC}
	local springMantleG = {graphic = Item("spring_mantle").icon, color = Item("spring_mantle").iconC}
	
	if (learnToWeave == 0) then
		player:dialogSeq({npcG, "Sheering sheep isn't for everyone, and neither is the patience to make something from it.",
		"I am glad someone other than myself is interested in it.",
		shearsG, "Here, a pair of shears, go get some wool from the sheep southwest of Shepton, ten should be fine.",
		woolG, "Bring them back whenever you are done.\n\n((Equip the Sheers, walk up to a sheep and swing to sheer.))"}, 1)
		if (player:hasSpace("shears", 1)) then
			player:addItem("shears", 1)
			player.quest["learnToWeave"] = 1
		else
			player:dialogSeq({npcG, "You plan to sheer sheep and can't even hold the shears?"}, 1)
		end
	elseif (learnToWeave == 1) then
		if (player:hasItem("wool", 10) == true) then
			player:dialogSeq({sheepG, "Good job on collecting the Wool, they didn't bite too hard did they?\n\nHah!",
			woolG, "Anyway, lets move on.",
			autoLoomG, "Use the AutoLoom 2000 here sitting next to me to weave the wool you just brought."}, 1)
			player:addGold(100)
			player:dialogSeq({npcG, "That gold should cover the costs for using it, once you have woven a piece of cloth let me know."}, 1)
			player:giveXP(200)
			player.quest["learnToWeave"] = 2
		else
			player:dialogSeq({sheepG, "Go get some wool from the sheep southwest of Shepton, ten should be fine."}, 1)
		end
	elseif (learnToWeave == 2) then
		if (player:hasItem("cloth", 1) == true) then
			if (player:hasSpace("cloth", 9)) then
				player:dialogSeq({npcG, "Not bad for your first time, maybe you have a knack for this sort of thing!",
				clothG, "How about making something out of that cloth, here is some more so you can try."}, 1)
				player:addItem("cloth", 9)
				player.quest["learnToWeave"] = 3
				player:dialogSeq({tailorTableG, "Use that Tailoring table just below the counter.",
				springMantleG, "I am in need of a new mantle, so make me a Spring one please."}, 1)
				player:giveXP(300)
			else
				player:dialogSeq({npcG, "\n((You should always have inventory space available when doing quests.))"}, 1)
			end
		else
			player:dialogSeq({autoLoomG, "Use the AutoLoom 2000 here sitting next to me to weave the wool you just brought."}, 1)
		end
	elseif (learnToWeave == 3) then
		if (player:hasItem("spring_mantle", 1) == true) then
			player:removeItem("spring_mantle", 1)
			player.quest["learnToWeave"] = 250
			player:dialogSeq({npcG, "You have a touch for fabric after all!\n\nIt looks great! I can't wait to try it on!",
			"((Press F1 and use the Crafting Interface for more Information regarding crafting and progression tracking))"}, 1)
			player:giveXP(500)
		else
			player:dialogSeq({tailorTableG, "Use that Tailoring table just below the counter.",
			springMantleG, "I am in need of a new mantle, so make me a Spring one please."}, 1)
		end
	end
end
}