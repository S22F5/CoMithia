r2_m_researcher = {
click = async(function(player, npc)
	local options = {}
	local choice = ""
	local check = 0
	
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	if (player:hasItem("fox_fang", 1) == true) then
		player:dialogSeq({npcG, "Is that a fox fang you have there?",
		"This is...\n        ...this is what we've\n           been looking for!",
		"This fox fang might just be what we need to get the extra funding for our new research tools.",
		"I really need this fang, how about a trade? We've made fox skin boots out of the foxes that died during our research.",
		"We don't have many obviously since our goal is not to amass gold using their skin.\n\nBut I can make an exception for this fang."}, 1)
		
		options = {"Yes", "No"}
		choice = player:menuString("Will you trade me your fox fang for my fox skin boots?", options)
		if (choice == "Yes") then
			if (player:hasItem("fox_fang", 1) == true) then
				player:removeItem("fox_fang", 1)
				player:addItem("fox_skin_boots", 1, 1000, player.ID)
				player:dialogSeq({npcG, "They are a little worn down, so I suggest you get them repaired before using them."}, 1)
			else
				player:dialog("I thought you had a fox fang with you.", {})
			end
		elseif (choice == "No") then
			player:dialog("I don't even know why I let you in the cave in the first place.", {})
		end
	elseif (player:hasItem("fox_lure", 1, player.ID, ""..player.name.."'s fox lure") == true) then
		if (player.quest["fox_lure"] == 249) then
			if (player.level >= 50) then
				player:giveXP(10000000)
			end
			player.quest["fox_lure"] = 250
			player:dialogSeq({npcG, "Thank you so much for capturing them. This will certainly help us continue with our research",
			"Here, I'm going to give you a trained fox, call it anytime you need with the fox lure."}, 1)
		elseif (player.quest["fox_lure"] == 250) then
			player:dialogSeq({npcG, "Can you guess what my favorite pangram is?\n\nYou bet!",
			"The quick brown fox jumps over the lazy dog.",
			"Heh, I just love it!"}, 1)
		else
			player:gmMsg(""..player.name.." Error 666f785f6c757265.", 1)
			player:dialog("How did you get here?", {})
		end
	elseif (player:hasItem("fox_lure", 1, 0) == true) then
		player:dialogSeq({npcG, "Thanks for bringing back the research.\n\nThis will help us understand them better.",
		"Is that a fox lure? How did you get it!"}, 1)
		options = {"Of course!", "Why should I?"}
		choice = player:menuString("Can I have it? It's vital for our research.", options)
		
		if (choice == "Of course!") then
			player:dialogSeq({npcG, "Some of our foxes have recently escaped their cages.\n\nWith your help and that fox lure you could help us put them back in their cages."}, 1)
			options = {"I will do it", "Not interested"}
			choice = player:menuString("Will you help us?", options)
			if (choice == "I will do it") then
				player:dialogSeq({npcG, "Great!\n\nNow you just have to head to where we left the cages and try to lure the foxes into the cage's gate.",
				"It might not be easy as they know what the cage represents, but it's vital for our research.",
				"All you have to do is keep the lure on you and they will chase you.",
				"I will show you the way so you don't get lost."}, 1)
				if (player:hasItem("fox_lure", 1, 0) == true) then
					player:warp(227, math.random(1, 2), math.random(8, 12))
					player:sendMinitext("They shouldn't bite, don't worry!")
				else
					player:dialog("I thought you had some fox lure with you.", {})
				end
			elseif (choice == "Not interested") then
				player:dialog("I don't even know why I let you in the cave in the first place.", {})
			end
		elseif (choice == "Why should I?") then
			player:dialog("I don't even know why I let you in the cave in the first place.", {})
		end
		return
	end
	
	options = {"Yes", "No"}	
	choice = player:menuString("Would you like to help me complete my research where canidae dwell?", options)
	
	if (choice == "Yes") then
		if (#player.group > 16) then
			player:dialog("Your group is too big!\n\nIf all of you go in you will scare the fox away and my research won't be possible!", {})
		elseif (#player.group <= 1) then
			player:dialog("You're going to need a party for this trip, I won't trust my research to just one person.", {})
		else
			local mapStart = getFreeInstance(6)
			if (mapStart ~= false) then
				if (loadInstance(mapStart, "canidae") == true) then
					for i = 1, #player.group do
						groupedPlayer = Player(player.group[i])
						
						if (groupedPlayer.m == 27 and groupedPlayer.level >= 50) then
						
							groupedPlayer.registry["canidae1Spawned"] = 0
							groupedPlayer.registry["canidae2Spawned"] = 0
							groupedPlayer.registry["canidae3Spawned"] = 0
							groupedPlayer.registry["canidae4Spawned"] = 0
							groupedPlayer.registry["canidae5Spawned"] = 0
							groupedPlayer.registry["canidae6Spawned"] = 0
							groupedPlayer:warp(mapStart, math.random(1, 2), math.random(6, 8))
						end
					end
				else
					unloadInstance(mapStart, 6)
				end
			end
		end
	end
end)
}