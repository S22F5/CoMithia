r2_astral = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	if (player.class ~= 3) then
		if (player:hasItem("meteorite_rock", 1) == true) then
			player:removeItem("meteorite_rock", 1)
			player:dialogSeq({npcG, "Thanks for bringing this back."}, 1)
		end
		if (player:hasItem("sample_rock", 1) == true) then
			player:removeItem("sample_rock", 1)
			player:dialogSeq({npcG, "Thanks for bringing this back."}, 1)
		end
	end
	
	if (player.class == 10 and not player:hasLegend("subpath")) then
		player:addLegend("Guided home by the stars. "..curT(), "subpath", 24, 80)
	end
	
	if (player.class == 3) then
		table.insert(menuOptions, "About Astral")
	end
	
	--[[if (player.class == 3 and player.level >= 25) then
		table.insert(menuOptions, "Become an Astral")
	end]]--
	
	if (player.class == 0 or player.class == 3 or player.class == 10) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	local choice = player:menuString("How may I assist you, young mage?", menuOptions)
	
	if (choice == "About Astral") then
		player:dialogSeq({npcG, "Ask me about the quest for more information."}, 1)
	--[[elseif (choice == "Become an Astral") then
		player:addLegend("Guided home by the stars. "..curT(), "subpath", 24, 80)
		player.class = 10
		player:status()]]--
	elseif (choice == "Learn Spell") then
		player:learnSpell()
	elseif (choice == "Forget Spell") then
		player:forgetSpell()
	end
	
	player:calcStat()
end),

action = function(npc, player)

end,

say = function(player, npc)
	local lspeech = string.lower(player.speech)

	if (lspeech == "quest") then
		r2_astral.quest(player, npc)
	end
end,

quest = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	local guidedByStar = player.quest["guidedByStars"]
	local menu
	local options = {}
	
	if (guidedByStar == 0) then--NOT STARTED
		table.insert(options, "'I am so tired;")
		table.insert(options, "I have forgotten why I'm here.'")
		if (player.class == 3 and player.level >= 25) then
			table.insert(options, "'I have sought you out")
			table.insert(options, "in hopes of becoming")
			table.insert(options, "an Astral.'")
		end
		menu = player:menu("Hello there, I saw you climbing up the stairs for quite a while. How can I help you?", options)
		if (menu >= 1 and menu <= 2) then--EXIT
			player:dialogSeq({npcG, "You should enjoy the view of the sky before heading down."}, 1)
		elseif (menu >= 3 and menu <= 5 and #options > 2) then--The #options > 1 check is for packet editors
			options = {"I would like to learn.",
			"Of course I do,"}
			menu = player:menu("Ah I see, well then; you must know about Kronos.", options)
			if (menu == 1) then--LEARN MORE
				player:dialogSeq({npcG, "Well, let me tell you then. Kronos was one of the two gods, along with Genesis, who manifested themselves in a human body and created the world we live in.",
				"Before that they lived amongst the other gods as sentinent celestial beings, creating the universe through their radiance.",
				"We Astrals believe that through connecting ourselves to the astral beings, the primordial essences of our universe, we can derive a greater power. In order to bind you to the universe I have a task for you.",
				"I need you to find some meteorite samples from an ancient meteor landing site that we believe to be where Kronos landed when he came to this planet.",
				"Once you have found those samples take them to the Alchemist in town so he can harness the energy from them."}, 1)
				player.quest["guidedByStars"] = 1
				player.quest["meteoriteExtraction"] = 1
			elseif (menu == 2) then
				player:dialogSeq({npcG, "Then I have a task for you, in order for you to be bound to the stars and become an Astral I need you to find some meteorite samples from an ancient meteor landing site.",
				"We believe that to be where Kronos landed when he came to this planet because the area hasn't aged from what we have on record.",
				"Once you have found those samples take them to the Alchemist in town so he can harness the energy from them."}, 1)
				player.quest["guidedByStars"] = 1
				player.quest["meteoriteExtraction"] = 1
			end
		end
	elseif(guidedByStar == 1) then
		local meteoriteExtraction = player.quest["meteoriteExtraction"]
		if (meteoriteExtraction == 250) then
			if (player.state ~= 0) then
				player:dialogSeq({npcG, "In order to proceed you must be alive and not on a mount."}, 1)
				return
			end
			local itemG = {graphic = Item("meteorite_rock").icon, color = Item("meteorite_rock").iconC}
			
			player:dialogSeq({npcG, "Ah you're back! What have you brought me?",
			itemG, "Aha! Perfect. This is a material that isn't naturally produced on this planet, means you've stumbled across something quite special.",
			"Now that you have in your posession this primordial and powerful element we will fuse it with you so you can become an Astral.",
			"You will dedicate your energy, spirit, and life to connecting with the celestial beings above."}, 1)
			options = {"Yes, I am ready.",
			"Maybe I'm not ready."}
			menu = player:menu("Keep in mind this is a decision you can not go back on. Are you ready?", options)
			if (menu == 1) then
				if (player.class == 3) then
					player:dialogSeq({npcG, "Then let us begin.",
					"Come with me."}, 1)
					player:removeItem("meteorite_rock", 1)
					player:addLegend("Guided home by the stars. "..curT(), "subpath", 24, 80)
					player.class = 10
					if (player.clan == 1) then
						player.clan = 0
					end
					player:status()
					player.quest["guidedByStars"] = 249
					npc:sendAction(6, 80)
					guidedByStars.cast(player)
				else
					player:dialogSeq({npcG, "You can only become an Astral if you're still a mage."}, 1)
				end
			elseif (menu == 2) then
				player:dialogSeq({npcG, "Come back to me when you are. I will be waiting."}, 1)
			end
		elseif (meteoriteExtraction > 0) then
			player:dialogSeq({npcG, "You'd better take them to the alchemist so he can help you identify them."}, 1)
		end
	elseif (guidedByStar == 249 or guidedByStar == 250) then
		options = {"Yes.", "No."}
		menu = player:menu("Heading up?", options)
		if (menu == 1) then
			npc:talk(0, "Bomi: Later "..player.name..".")
			npc:sendAction(6, 80)
			guidedByStars.cast(player)
		elseif (menu == 2) then
			player:dialogSeq({npcG, "Let me know when you want to head up."}, 1)
		end
	end
end)
}

r2_astral_2 = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	local options = {}
	local menu
	
	local guidedByStar = player.quest["guidedByStars"]
	
	if (guidedByStar == 249) then
		player:dialogSeq({npcG, "You should now be able to feel your power has improved.",
		"I look forward to seeing you again young mage, may Kronos guide you.",
		"Tap my shoulder when you want to head back."}, 1)
		player.quest["guidedByStars"] = 250
	elseif (guidedByStar == 250) then
		options = {"Yes.", "No."}
		menu = player:menu("Heading back?", options)
		if (menu == 1) then
			npc:talk(0, "Bomi: Later "..player.name..".")
			npc:sendAction(6, 80)
			guidedByStars.cast(player)
		elseif (menu == 2) then
			player:dialogSeq({npcG, "Let me know when you want to head back."}, 1)
		end
	end
end)
}

guidedByStars = {
cast = function(player)
	if (player.quest["meteoriteExtraction"] == 250 or player.quest["guidedByStars"] == 250 or player.gmLevel > 0) then
		--player:sendAnimation(378)
		player:sendAnimationXY(378, player.x, player.y)
		player:setDuration("guidedByStars", 2000)
		player.gfxName = ""
		player.gfxClone = 1
		player.state = -1
		player:updateState()
	else
		broadcast(-1, "Player "..player.name.." is hacking, gBS")
	end
end,

uncast = function(player)
	player.state = 0
	player.gfxClone = 0
	player:updateState()
	if (player.m == 216) then
		player:warp(131, 9, 13)
	else
		player.side = 0
		player:sendSide()
		player:warp(216, 11, 13)
	end
end
}