r2_phantom = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic =  npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	if (player.class ~= 2) then
		if (player:hasItem("guard_costume", 1) == true) then
			player:removeItem("guard_costume", 1)
			player:dialogSeq({npcG, "Thanks for bringing this back."}, 1)
		end
		if (player:hasItem("emperors_golden_vase", 1) == true) then
			player:removeItem("emperors_golden_vase", 1)
			player:dialogSeq({npcG, "Thanks for bringing this back."}, 1)
		end
	end
	
	if (player.class == 9 and not player:hasLegend("subpath")) then
		player:addLegend("Mastered the art of deception. "..curT(), "subpath", 22, 80)
	end
	
	if (player.class == 2) then
		table.insert(menuOptions, "About Phantom")
	end
	
	--[[if (player.class == 2 and player.level >= 25) then
		table.insert(menuOptions, "Become a Phantom")
	end]]--
	
	if (player.class == 0 or player.class == 2 or player.class == 9) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	local choice = player:menuString("How may I assist you, rogue?", menuOptions)
	if (choice == "About Phantom") then
		player:dialogSeq({npcG, "Speak to me about the quest if you would like to learn more."}, 1)	
	--[[elseif (choice == "Become a Phantom") then
		player:addLegend("Mastered the art of deception. "..curT(), "subpath", 22, 80)
		player.class = 9
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
		r2_phantom.quest(player, npc)
	end
end,

quest = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local itemG = {}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	local masterOfDeception = player.quest["masterOfDeception"]
	local menu
	local options = {}
	local phantom = player.registry["r2_phantom"]

	if (player.class == 8) then--Remove items if went other SP.
		if (player:hasItem("guard_costume", 1) == true or player:hasItem("emperors_golden_vase", 1) == true) then
			player:dialogSeq({npcG, "I see you decided to become a Wanderer instead."}, 1)
			player:removeItem("guard_costume", 1)
			player:removeItem("emperors_golden_vase", 1)
			player.quest["masterOfDeception"] = 0
		end
	end
	
	if (masterOfDeception == 0) then--NOT STARTED
		if (phantom == 0) then
			player:dialogSeq({npcG, "..."}, 1)
			player.registry["r2_phantom"] = phantom + 1
		elseif (phantom == 1) then
			player:dialogSeq({npcG, "Get out of here, I'm busy."}, 1)
			player.registry["r2_phantom"] = phantom + 1
		elseif (phantom == 2) then
			player:dialogSeq({npcG, "I said beat it punk."}, 1)
			player.registry["r2_phantom"] = phantom + 1
		elseif (phantom == 3) then
			player:dialogSeq({npcG, "Trying to start something? Leave!"}, 1)
			player.registry["r2_phantom"] = phantom + 1
		elseif (phantom == 4) then
			if (player.class ~= 2) then
				player:dialogSeq({npcG, "You have no business here."}, 1)
				return
			end
			if (player.level < 25) then
				player:dialogSeq({npcG, "Come back when you're stronger."}, 1)
				return
			end
			player:dialogSeq({npcG, "Damnit..."}, 1)
			player.registry["r2_phantom"] = 0
			player.quest["masterOfDeception"] = 1
		end
	elseif (masterOfDeception == 1) then
		options = {"I would like to become a Phantom.",
		"...Nevermind!"}
		menu = player:menu("Where did you hear about that? Alright...", options)
		if (menu == 1) then
			player:dialogSeq({npcG, "Do you really think someone like you can just waltz in and ask to join a private group?",
			"Moreso with our enemies trying to infiltrate us?",
			"Really now..."}, 1)
			options = {"I am no enemy!", "S-sorry"}
			menu = player:menu("You should just become a guard like all others.", options)
			if (menu == 1) then
				player:dialogSeq({npcG, "Really now...\n\nWhy would I believe a stranger like you?",
				"Come to think of it; if we were being infiltrated, you probably wouldn't do something so stupid as to ask to "..'"become one of us"'.."."}, 1)
				options = {"I'm no fool!", "-turns and walks away-"}
				menu = player:menu("Maybe you are just an ignorant fool.", options)
				if (menu == 1) then
					player:dialogSeq({npcG, "What you are saying is farfetched, but we could still have common ground for now.",
					"If you prove to be untrustworthy, I will just wipe you from this earth.\n\nMoving forward; there are some corrupt guards around here who seem to be smuggling trade goods for their own benefit.",
					"Information these guards is crucial. Use this disguise to infiltrate their ranks and acquire the names of those within the operation."
					}, 1)
					if (player:hasSpace("guard_costume", 1)) then
						player:addItem("guard_costume", 1)
						player.quest["masterOfDeception"] = 2
					else
						player:dialogSeq({npcG, "\n((You should always have available inventory space when doing quests.))"
						}, 1)
					end
				elseif (menu == 2) then
				end
			elseif (menu == 2) then
				
			end
		elseif (menu == 2) then
			--exit
		end
	elseif (masterOfDeception == 2) then
		player:dialogSeq({npcG, "What are you doing back here?\n\nGo identify the guard!"
		}, 1)
	elseif (masterOfDeception == 3) then
		player:dialogSeq({npcG, "So they're stealing golden items?\n\nHow did you know to ask about that?",
		"Well done... but we still have to find out where they're keeping it.",
		"He did mention something about "..'"the hands"'..", I might just know who that is.",
		"We've recently found a traitor amongst us. Everybody agreed to let him live for our own amusement. His reputation is completely ruined.\n\nEven his own friends and family outcasted him.",
		"Who knows what he would do just to have a simple conversation now'adays.",
		"He still lurks the market, put back on the uniform and try talking to him."
		}, 1)
		player.quest["masterOfDeception"] = 4
	elseif (masterOfDeception == 4) then
		player:dialogSeq({npcG, "Go and find him, he should be at the market. Hurry up."
		}, 1)
	elseif (masterOfDeception == 5) then
		player:dialogSeq({npcG, "You got the location, and the password... you are beginning to impress me.",
		"Maybe I was wrong about you, but don't let that get to your head. The worst has yet to come.",
		"They keep it locked in a box inside the guard house. I will let you decide how to retrieve it for me.",
		"Don't let me down."
		}, 1)
		player.quest["masterOfDeception"] = 6
	elseif (masterOfDeception == 6) then
		player:dialogSeq({npcG, "Come back after you've got what we need."
		},1 )
	elseif (masterOfDeception == 7) then
		if (player:hasItem("emperors_golden_vase", 1) == true) then
			if (player.class == 2) then
				player:dialogSeq({npcG, "Good job youngblood. I can't lie, we all took bets on how long it woul dtake for you to turn up dead.\n\n-laughs-\n\nBut seriously; you've proven to be quite impressive.",
				"The vase is a worldly treasure. So valuable in fact, that a price cannot be put on it. We need to hand it over to the Knights; they are the only ones who can guard this precious artifact.",
				"The Knights and our government aren't my favorite people, but we have no choice in the matter. Those who are after the vase are even higher profile than myself.",
				"It's better if we leave this to the state.\n\n\nWelcome aboard."
				}, 1)
				player:removeItem("emperors_golden_vase", 1)
				player:removeItem("guard_costume", 1)
				player:addLegend("Mastered the art of deception. "..curT(), "subpath", 22, 80)
				player.class = 9
				if (player.clan == 1) then
					player.clan = 0
				end
				player:status()
			else
				player:dialogSeq({npcG, "You must be a rogue to become a Phantom."
				}, 1)
			end
		end
	end
end),

action = function(npc, player)

end
}

emperor_golden_vase_chest = {
click = async(function(player, npc)
	local npcG = {}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color	
	player.dialogType = 0
	player:dialog("Turn all tiles to either color to unlock.", npcG)
end),

open = async(function(player, npc)
	local npcG = {graphic = convertGraphic(809, "monster"), color = 9}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0
	local emperors_golden_vaseG = {graphic = Item("emperors_golden_vase").icon, color = Item("emperors_golden_vase").iconC}
	
	if (player.quest["masterOfDeception"] == 6) then
		player:dialogSeq({npcG, "((You hear a click sound.))",
		"((As you approach the wall, you see an open chest.))",
		emperors_golden_vaseG, "((You find a golden vase and run for it.))"
		}, 1)
		if (player:hasSpace("emperors_golden_vase", 1)) then
			player.quest["masterOfDeception"] = 7
			player:addItem("emperors_golden_vase", 1)
		else
			player:dialogSeq({npcG, "\n((You should always have available inventory space when doing quests.))"
			}, 1)
		end
	end
end)
}

guard_costume = {
use = async(function(player)
	local itemG = {graphic = Item("guard_costume").icon, color = Item("guard_costume").iconC}
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = itemG.graphic
	player.npcColor = itemG.color
	player.lastClick = NPC(44).ID
	player.dialogType = 1
	
	if (player:hasItem("guard_costume", 1) == true and player.m == 40 and player.quest["masterOfDeception"] >= 2) then
		player:dialogSeq({itemG, "**You opened the box...**",
		npcG, "**You wear the costume.**"
		}, 1)
		local guards = player:getObjectsInMap(player.m, BL_MOB)
		if (#guards > 0) then
			for i = 1, #guards do
				if (guards[i].yname == "r2_c_guard") then
					player:setDuration("copycat", 15000, guards[i].ID)
					player:calcStat()
					break					
				end
			end
		end
	else
		player:sendMinitext("You can't do that. Perhaps try near another guard to use him as a mirror."
		)
	end
end)
}