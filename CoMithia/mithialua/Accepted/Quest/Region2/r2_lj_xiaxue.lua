r2_lj_xiaxue = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(226, "monster"), color = 0}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0

	local menu
	local quests = {}
	local options = {}
	
	if ((player.quest["learnToSmelt"] >= 0 and player.quest["learnToSmelt"] < 250)
	or (player.quest["learnToMill"] >= 0 and player.quest["learnToMill"] < 250)
	or (player.quest["learnToWeave"] >= 0 and player.quest["learnToWeave"] < 250)) then
		table.insert(quests, "Crafting")
	end
	if (#quests > 0) then
		table.insert(options, "Quest")
	end
	menu = player:menuString("How may I help you?", options)
	if (menu == "Quest") then
		menu = player:menuString("Which quest?", quests)
		if (menu == "Crafting") then
			options = {}
			if (player.quest["learnToMill"] >= 0 and player.quest["learnToMill"] < 250) then
				table.insert(options, "Woodcut, Mill and Forestry.")
			end
			if (player.quest["learnToWeave"] >= 0 and player.quest["learnToWeave"] < 250) then
				table.insert(options, "Wool, Weave and Tailor.")
			end
			if (player.quest["learnToSmelt"] >= 0 and player.quest["learnToSmelt"] < 250) then
				table.insert(options, "Mine, Smelt and Smith.")
			end
			menu = player:menuString("What crafts would you like to learn?", options)
			if (menu == "Woodcut, Mill and Forestry.") then
				r2_lj_xiaxue.quest(player, npc)
			elseif (menu == "Mine, Smelt and Smith.") then
				local r2_m_coalG = {graphic = convertGraphic(185, "monster"), color = 28}		
				player:dialogSeq({npcG, "You are in the wrong place for that!",
				r2_m_coalG, "Head to Iron Mine ((32,06)) in Minefield and talk to Mog!"}, 1)
			elseif (menu == "Wool, Weave and Tailor.") then
				local r2_s_weaverG = {graphic = convertGraphic(10, "monster"), color = 6}		
				player:dialogSeq({npcG, "You are in the wrong place for that!",
				r2_s_weaverG, "Head to Shepton ((30,10)) in Sudden Valley and talk to Nidle!"}, 1)
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

	local learnToMill = player.quest["learnToMill"]
	local logging_axeG = {graphic = Item("logging_axe").icon, color = Item("logging_axe").iconC}
	local treeG = {graphic = convertGraphic(761, "monster"), color = 0}
	local logG = {graphic = Item("ash_log").icon, color = Item("ash_log").iconC}
	local grisslyG = {graphic = 0, color = 0}
	local sawmillG = {graphic = convertGraphic(743, "monster"), color = 0}
	local ashBoardG = {graphic = Item("ash_board").icon, color = Item("ash_board").iconC}
	local sawG = {graphic = Item("saw_blade").icon, color = Item("saw_blade").iconC}
	local foresterTableG = {graphic = convertGraphic(745, "monster"), color = 0}
	local woodenBucklerG = {graphic = Item("wooden_buckler").icon, color = Item("wooden_buckler").iconC}
	
	if (learnToMill == 0) then
		if (player:hasSpace("logging_axe", 1)) then
			player:dialogSeq({npcG, "So you think you have what it takes to work with wood hmm?\n\nIt's not as easy as yee think!",
			logging_axeG, "**Shoves an axe into your hands**"}, 1)
			player:addItem("logging_axe", 1)
			player.quest["learnToMill"] = 1
			player:dialogSeq({treeG, "Take yer axe and get out there and chop me some trees!",
			logG, "About 25 logs should do just fine, don't come back with any less!"}, 1)
		else
			player:dialogSeq({npcG, "You plan to cut wood and can't even hold an axe?"}, 1)
		end
	elseif (learnToMill == 1) then
		if (player:hasItem("ash_log", 25) == true) then
			if (player:hasSpace("saw_blade", 1)) then
				player:dialogSeq({npcG, "So you managed to do it without hurting yourself did yee?"}, 1)
				player.lastClick = NPC(20).ID
				player.dialogType = 1
				player:dialogSeq({grisslyG, "Head over to Grissly's Abode ((60,61)) in Mithian Woods."}, 1)
				player.dialogType = 0
				player:dialogSeq({sawmillG, "Place 'em over there on the Saw mill and cut 'em in to boards.\n\nDon't go hurtin' yerself.",
				ashBoardG, "And bring me back one good Ash Board.",
				sawG, "**Shoves a saw into your hands and pushes you along.**"}, 1)
				player:addItem("saw_blade", 1)
				player:giveXP(200)
				player.quest["learnToMill"] = 2
			else
				player:dialogSeq({npcG, "\n((You should always have inventory space available when doing quests.))"}, 1)			
			end
		else
			player:dialogSeq({treeG, "Go get some ash logs from the trees just outside Axefel, ten should be fine."}, 1)
		end
	elseif (learnToMill == 2) then
		if (player:hasItem("ash_board", 1) == true) then
			if (player:hasSpace("ash_board", 9)) then
				player:dialogSeq({ashBoardG, "Looks like you can manage it if you try after all! Completely intact too, how about we try to make something with this now hmm?",
				foresterTableG, "Head out of here and to the southeast over to the Foresters table.",
				woodenBucklerG, "Craft me a nice shield, those blasted wolves tore up my last one!",
				ashBoardG, "**Pushes you along the way, handing you 9 more Ash Board**"}, 1)
				player:addItem("ash_board", 9)
				player.quest["learnToMill"] = 3
				player:giveXP(300)
			else
				player:dialogSeq({npcG, "\n((You should always have inventory space available when doing quests.))"}, 1)
			end
		else
			player:dialogSeq({sawmillG, "Head over to Grissly's Abode ((60,61)) in Mithian Woods.",
			"Place 'em over there on the Saw mill and cut em into boards to easier with 'em.\n\nDon't go hurtin' yerself."}, 1)
		end
	elseif (learnToMill == 3) then
		if (player:hasItem("wooden_buckler", 1) == true) then
			player:removeItem("wooden_buckler", 1)
			player.quest["learnToMill"] = 250
			player:giveXP(500)
			player:dialogSeq({woodenBucklerG, "Not the best, but it'll do.\n\nNot bad at all for your first time.",
			npcG, "I'll put it to good use!\n\n((Press F1 and select Crafting Interface for more Information and Progression tracking))"}, 1)
		else
			player:dialogSeq({foresterTableG, "Head out of here and to the southeast over to the Foresters table.\n\n ((65,60))",
			woodenBucklerG, "Craft me a nice shield, those blasted wolves tore up my last one!"}, 1)
		end
	end
end
}