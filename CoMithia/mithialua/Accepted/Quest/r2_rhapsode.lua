r2_rhapsode = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	if (player.class == 13 and not player:hasLegend("subpath")) then
		player:addLegend("Studied the fine arts. "..curT(), "subpath", 30, 80)
	end
	
	if (player.class == 4) then
		table.insert(menuOptions, "About Rhapsode")
	end
	
	--[[if (player.class == 4 and player.level >= 25) then
		table.insert(menuOptions, "Become a Rhapsode")
	end]]--
	
	if (player.class == 0 or player.class == 4 or player.class == 13) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	local choice = player:menuString("How may I assist you, young poet?", menuOptions)
	if (choice == "About Rhapsode") then
		player:dialogSeq({npcG, "Ask me about the quest for more information."}, 1)
	--[[elseif (choice == "Become a Rhapsode") then
		player:addLegend("Studied the fine arts. "..curT(), "subpath", 30, 80)
		player.class = 13
		player:status()]]--
	elseif (choice == "Learn Spell") then
		player:learnSpell()
	elseif (choice == "Forget Spell") then
		player:forgetSpell()
	else
		player:dialogSeq({t, "You're not supposed to be here, call a GM."}, 0)
	end
	
	player:calcStat()
end),

say = function(player, npc)
	local lspeech = string.lower(player.speech)

	if (lspeech == "quest") then
		r2_rhapsode.quest(player, npc)
	end
end,

quest = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID

	local fineArts = player.quest["fineArts"]
	local menu
	local options = {}
	local menuStr
	local rand
	
	local sheetG = {graphic = Item("music_sheet").icon, color = Item("music_sheet").iconC}
	local fluteG = {graphic = Item("music_flute").icon, color = Item("music_flute").iconC}
	local harpG = {graphic = Item("music_harp").icon, color = Item("music_harp").iconC}
	local drumG = {graphic = Item("music_drum").icon, color = Item("music_drum").iconC}
	local chapelG = {graphic = convertGraphic(1143, "monster"), color = 0}
	
	
	if (fineArts == 0) then--NOT STARTED
		player:dialogSeq({npcG, "*She looks up from a pile of sheet music*",
		"Oh, hello there little one."}, 1)
		options = {"I'd like to join the rhapsodes!",
		"Oops! I walked in the wrong room."}
		menu = player:menu("Is there something I can help you with?", options)
		if (menu == 1) then
			player:dialogSeq({npcG, "Oh is that so?",
			"Do you feel the music pumping through your blood?",
			"Notes coursing through your veins?"}, 1)
			options = {"I do!",
			"Now that you put it that way..."}
			menu = player:menu("Do you wish to inspire all those in this kingdom through your craft?", options)
			if (menu == 1) then
				if (player.class ~= 4) then
					player:dialogSeq({npcG, "The first step to joining the rhapsodes is being a poet."}, 1)
					return
				end
				if (player.level < 25) then
					player:dialogSeq({npcG, "You are not ready."}, 1)
					return
				end
				player:dialogSeq({npcG, "Well we don't just take anyone, you must be skilled in the arts, you must have charisma, you must be willing to be in the eye of the public!",
				"I'll have to test you to see if you're rhapsode material.",
				sheetG, "But first I need you to deliver this music to the chapel for me.",
				"Play it to get her attention.\n\nOff you go!"}, 1)
				if (player:hasSpace("music_sheet", 1)) then
					player:addItem("music_sheet", 1)
					player.quest["fineArts"] = 1
				else
					player:dialogSeq({sheetG, "You can't hold the music sheet."}, 1)
				end
			elseif (menu == 2) then
			
			end
		elseif (menu == 2) then
			--exit
		end
	elseif (fineArts == 1) then
		player:dialogSeq({chapelG, "Get going!",
		sheetG, "She's expecting this!"}, 1)
	elseif (fineArts == 2) then
		player:dialogSeq({npcG, "Thanks for running that errand for me!",
		chapelG, "Y'know she's a great rhapsode too, if you're lucky enough to join us you'll have networked already! \n\n *Laughs*",
		npcG, "Well, ready for your test?",
		"I'm going to give you three instruments, I want you to find the other 7 leaders of the subpaths and play them a song that they like.\n\n((simply use the instrument in the same room as them))",
		"Hopefully you choose the right instrument!",
		"Return to me once you've found out who likes what."}, 1)
		if (player:hasSpace("music_flute", 1) == true and
		player:hasSpace("music_harp", 1) == true and
		player:hasSpace("music_drum", 1)) then
			player:addItem("music_flute", 1)
			player:addItem("music_harp", 1)
			player:addItem("music_drum", 1)
			player.quest["fineArts"] = 3
		else
			player:dialogSeq({npcG, "You lack inventory space."}, 1)
		end
	elseif (fineArts == 3) then
		local halcyon = player.registry["instrument_halcyon"]
		local knight = player.registry["instrument_knight"]
		local gladiator = player.registry["instrument_gladiator"]
		local phantom = player.registry["instrument_phantom"]
		local wanderer = player.registry["instrument_wanderer"]
		local astral = player.registry["instrument_astral"]
		local timesage = player.registry["instrument_timesage"]
		if (halcyon == 250 and knight == 250 and gladiator == 250 and phantom == 250 and
		wanderer == 250 and astral == 250 and timesage == 250) then
			player:dialogSeq({npcG, "Ah you're back! Well, let's see what you've learned."}, 1)
			--tests
			player.lastClick = NPC(89).ID
			menuStr = player:menuString("What instrument did "..NPC(89).name.." enjoy?", r2_rhapsode.randOpts())
			if (string.lower(menuStr) == "flute") then
				player.lastClick = NPC(90).ID
				menuStr = player:menuString("What instrument did "..NPC(90).name.." enjoy?", r2_rhapsode.randOpts())
				if (string.lower(menuStr) == "drum") then
					player.lastClick = NPC(91).ID
					menuStr = player:menuString("What instrument did "..NPC(91).name.." enjoy?", r2_rhapsode.randOpts())
					if (string.lower(menuStr) == "harp") then
						player.lastClick = NPC(92).ID
						menuStr = player:menuString("What instrument did "..NPC(92).name.." enjoy?", r2_rhapsode.randOpts())
						if (string.lower(menuStr) == "flute") then
							player.lastClick = NPC(93).ID
							menuStr = player:menuString("What instrument did "..NPC(93).name.." enjoy?", r2_rhapsode.randOpts())
							if (string.lower(menuStr) == "harp") then
								player.lastClick = NPC(94).ID
								menuStr = player:menuString("What instrument did "..NPC(94).name.." enjoy?", r2_rhapsode.randOpts())
								if (string.lower(menuStr) == "harp") then
									player.lastClick = NPC(95).ID
									menuStr = player:menuString("What instrument did "..NPC(95).name.." enjoy?", r2_rhapsode.randOpts())
									if (string.lower(menuStr) == "drum") then
										if (player.class == 4) then
											player.lastClick = npc.ID
											player:dialogSeq({npcG, "\n\nImpressive!",
											"Not only could you play these well but you were able to remember the songs they liked.",
											"You have a lot to learn but you clearly have the heart of an artist.\n\nI'd like to welcome you in to our family, congratulations "..player.name.."."}, 1)
											--become rhapsode
											--clear registries
											player.registry["instrument_halcyon"] = 0
											player.registry["instrument_timesage"] = 0
											player.registry["instrument_astral"] = 0
											player.registry["instrument_wanderer"] = 0
											player.registry["instrument_phantom"] = 0
											player.registry["instrument_knight"] = 0
											player.registry["instrument_gladiator"] = 0
											player.registry["instrument_timer"] = 0
											--remove quest items
											player:removeItem("music_flute", 1)
											player:removeItem("music_harp", 1)
											player:removeItem("music_drum", 1)
											player:addLegend("Studied the fine arts. "..curT(), "subpath", 30, 80)
											player.class = 13
											player.quest["fineArts"] = 250
											if (player.clan == 1) then
												player.clan = 0
											end
											player:status()
										else
											player:dialogSeq({npcG, "You can only become a Rhapsode if you're still a poet."}, 1)
										end
									else
										player:dialogSeq({npcG, "No, no, no. This won't do. That's not what they like!"}, 1)
										return
									end
								else
									player:dialogSeq({npcG, "No, no, no. This won't do. That's not what they like!"}, 1)
									return
								end
							else
								player:dialogSeq({npcG, "No, no, no. This won't do. That's not what they like!"}, 1)
								return
							end
						else
							player:dialogSeq({npcG, "No, no, no. This won't do. That's not what they like!"}, 1)
							return
						end
					else
						player:dialogSeq({npcG, "No, no, no. This won't do. That's not what they like!"}, 1)
						return
					end
				else
					player:dialogSeq({npcG, "No, no, no. This won't do. That's not what they like!"}, 1)
					return
				end
			else
				player:dialogSeq({npcG, "No, no, no. This won't do. That's not what they like!"}, 1)
				return
			end
		else
			local spStr = "You have yet to ask "
			if (halcyon < 250) then
				spStr = spStr..NPC(89).name..", "
			end
			if (knight < 250) then
				spStr = spStr..NPC(94).name..", "
			end
			if (gladiator < 250) then
				spStr = spStr..NPC(95).name..", "
			end
			if (phantom < 250) then
				spStr = spStr..NPC(93).name..", "
			end
			if (wanderer < 250) then
				spStr = spStr..NPC(92).name..", "
			end
			if (astral < 250) then
				spStr = spStr..NPC(91).name..", "
			end
			if (timesage < 250) then
				spStr = spStr..NPC(90).name..", "
			end
			
			spStr = string.sub(spStr, 0, -3)
			spStr = spStr.."."
			player:dialogSeq({npcG, "Make sure you get to all the subpath leaders before you come back here!",
			spStr}, 1)
		end
	elseif (fineArts == 250) then
		--quests after becoming rhapsode
	end
end),

randOpts = function()
	local rand = math.random(3)
	local options
	if (rand == 1) then
		options = {"Flute", "Harp", "Drum"}
	elseif (rand == 2) then
		options = {"Harp", "Drum", "Flute"}
	elseif (rand == 3) then
		options = {"Drum", "Flute", "Harp"}
	end
	return options
end,

action = function(npc, player)

end
}

music_sheet = {
use = function(player)
	if (player.registry["instrument_timer"] + 5 >= os.time()) then
		player:sendMinitext("You can't play several songs at the same time.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that")
		return
	elseif (player.state == 3) then
		player:sendMinitext("That would be somewhat difficult, don't you think?")
		return
	end
	
	local blocksNPC = player:getObjectsInArea(BL_NPC)
	local i

	if (#blocksNPC > 0) then
		for i = 1, #blocksNPC do
			if (blocksNPC[i].yname == "r2_c_chapel") then	
				blocksNPC[i]:talk(0, ""..blocksNPC[i].name..": Thanks for bringing the music sheet.")
				player:removeItem("music_sheet", 1)
				player.quest["fineArts"] = 2
			end
		end
	end
	
	player.registry["instrument_timer"] = os.time()
	
end	
}

music_flute = {
use = function(player)
	if (player.class ~= 4) then
		player:removeItem("music_flute", 1)
		player:popUp("The item vanishes.")
	end
	if (player.registry["instrument_timer"] + 5 >= os.time()) then
		player:sendMinitext("You can't play several songs at the same time.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that")
		return
	elseif (player.state == 3) then
		player:sendMinitext("That would be somewhat difficult, don't you think?")
		return
	end
	
	
	
	local blocksNPC = player:getObjectsInArea(BL_NPC)
	local i

	if (#blocksNPC > 0) then
		local emo = {11,12,13,14,15,16,17,18,19,20,21,23}
		local randEmo = math.random(#emo)
		for i = 1, #blocksNPC do
			if (blocksNPC[i].yname == "r2_halcyon") then
				blocksNPC[i]:sendAction(22, 80)
				player.registry["instrument_halcyon"] = 250
				player:sendMinitext("Looks like they enjoyed that tune.")
			elseif (blocksNPC[i].yname == "r2_knight") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_gladiator") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_phantom") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_wanderer") then
				blocksNPC[i]:sendAction(22, 80)
				player.registry["instrument_wanderer"] = 250
				player:sendMinitext("Looks like they enjoyed that tune.")
			elseif (blocksNPC[i].yname == "r2_astral") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_timesage") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			end
		end
	end
	
	--cooldown
	player.registry["instrument_timer"] = os.time()
	
end
}

music_harp = {
use = function(player)
	if (player.class ~= 4) then
		player:removeItem("music_harp", 1)
		player:popUp("The item vanishes.")
	end
	if (player.registry["instrument_timer"] + 5 >= os.time()) then
		player:sendMinitext("You can't play several songs at the same time.")
		return
	end

	if(player.state==1) then
		player:sendMinitext("Spirits can't do that")
		return
	elseif (player.state == 3) then
		player:sendMinitext("That would be somewhat difficult, don't you think?")
		return
	end
	
	local blocksNPC = player:getObjectsInArea(BL_NPC)
	local i

	if (#blocksNPC > 0) then
		local emo = {11,12,13,14,15,16,17,18,19,20,21,23}
		local randEmo = math.random(#emo)
		for i = 1, #blocksNPC do
			if (blocksNPC[i].yname == "r2_halcyon") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_knight") then
				blocksNPC[i]:sendAction(22, 80)
				player.registry["instrument_knight"] = 250
				player:sendMinitext("Looks like they enjoyed that tune.")
			elseif (blocksNPC[i].yname == "r2_gladiator") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_phantom") then
				blocksNPC[i]:sendAction(22, 80)
				player.registry["instrument_phantom"] = 250
				player:sendMinitext("Looks like they enjoyed that tune.")
			elseif (blocksNPC[i].yname == "r2_wanderer") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_astral") then
				blocksNPC[i]:sendAction(22, 80)
				player.registry["instrument_astral"] = 250
				player:sendMinitext("Looks like they enjoyed that tune.")
			elseif (blocksNPC[i].yname == "r2_timesage") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			end
		end
	end
	
	player.registry["instrument_timer"] = os.time()
	
end
}

music_drum = {
use = function(player)
	if (player.class ~= 4) then
		player:removeItem("music_drum", 1)
		player:popUp("The item vanishes.")
	end

	if (player.registry["instrument_timer"] + 5 >= os.time()) then
		player:sendMinitext("You can't play several songs at the same time.")
		return
	end

	if(player.state==1) then
		player:sendMinitext("Spirits can't do that")
		return
	elseif (player.state == 3) then
		player:sendMinitext("That would be somewhat difficult, don't you think?")
		return
	end
	
	local blocksNPC = player:getObjectsInArea(BL_NPC)
	local i

	if (#blocksNPC > 0) then
		local emo = {11,12,13,14,15,16,17,18,19,20,21,23}
		local randEmo = math.random(#emo)
		for i = 1, #blocksNPC do
			if (blocksNPC[i].yname == "r2_halcyon") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_knight") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_gladiator") then
				blocksNPC[i]:sendAction(22, 80)
				player.registry["instrument_gladiator"] = 250
				player:sendMinitext("Looks like they enjoyed that tune.")
			elseif (blocksNPC[i].yname == "r2_phantom") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_wanderer") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_astral") then
				blocksNPC[i]:sendAction(emo[randEmo], 80)
			elseif (blocksNPC[i].yname == "r2_timesage") then
				blocksNPC[i]:sendAction(22, 80)
				player.registry["instrument_timesage"] = 250
				player:sendMinitext("Looks like they enjoyed that tune.")
			end
		end
	end
	
	player.registry["instrument_timer"] = os.time()
		
end
}