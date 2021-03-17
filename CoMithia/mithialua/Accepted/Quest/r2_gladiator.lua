r2_gladiator = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	if (player.class == 6 and not player:hasLegend("subpath")) then
		player:addLegend("Found inner strength. "..curT(), "subpath", 18, 80)
	end
	
	if (player.class == 1) then
		table.insert(menuOptions, "About Gladiator")
	end
	
	--[[if (player.class == 1 and player.level >= 25) then
		table.insert(menuOptions, "Become a Gladiator")
	end]]--
	
	if (player.class == 0 or player.class == 1 or player.class == 6) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	local choice = player:menuString("How may I assist you, young warrior?", menuOptions)
	if (choice == "About Gladiator") then
		player:dialogSeq({npcG, "Ask me about the quest for more information."}, 1)	
	--[[elseif (choice == "Become a Gladiator") then
		player:addLegend("Found inner strength. "..curT(), "subpath", 18, 80)
		player.class = 6
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
		r2_gladiator.quest(player, npc)
	end
end,

action = function(npc, player)

end,

quest = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID

	local innerStrength = player.quest["innerStrength"]
	local menu
	local options = {}
	--MENTAL PART

	if (innerStrength == 0) then--NOT STARTED
		player:dialogSeq({npcG, "\n*Kang looks you square in the eyes*"}, 1)
		options = {"My name is "..player.name..".", "I..."}
		menu = player:menu("Who dares come into my training area to bother me?", options)
		if (menu == 1) then
			if (player.class ~= 1) then
				player:dialogSeq({npcG, "You have no business here."}, 1)
				return
			elseif (player.level < 25) then
				player:dialogSeq({npcG, "Talk to me when you're stronger."}, 1)
				return
			end
			player:dialogSeq({npcG, player.name..". Hmm...",
			"I have heard your name through some people. You are a new fighter who's come to the kingdoms.",
			"I've heard you already have an impressive strength. I will forgive you for interupting me."}, 1)
			options = {"To become a gladiator.", "I am in the wrong place."}
			menu = player:menu("What did you come here for?", options)
			if (menu == 1) then
				player:dialogSeq({npcG, "Ha! you may be trying to make a name for yourself, but don't act as if that's somethign you can just ask for.",
				"This isn't some club, this is a dedication to sanctity and the art of fighting, this is a lifestyle."}, 1)
				options = {"Test me and find out.", "Maybe I'm not..."}
				menu = player:menu("What makes you think you're worthy of that?", options)
				if (menu == 1) then
					player:dialogSeq({npcG, "Test you?",
					"You come in here and ask me to test you, like I should have to do you a favor?"}, 1)
					options = {"I meant no disrespect sir.", "I'm sorry! I'll leave!"}
					menu = player:menu("That is some arrogance you have, but that takes some guts to say to my face. I'm conflicted.", options)
					if (menu == 1) then
						local spiritOfG = {graphic = convertGraphic(838, "monster"), color = 0}
						player:dialogSeq({npcG, "Very well. I will give you a test.",
						"To win a battle, one must know the enemy as well as they know themselves.",
						"I am going to give a book to you, I want you to find out the vital statistics of many of the foes around these parts.",
						"The angry wolf pup, small mouse, hoarder, bat, bear.",
						"Once you have gotten them all, return to me.",
						spiritOfG, "<b>"..player.f1Name..":\n\n    ((To get the vital\n    statistics use the\n    book while facing\n    the creature.))"}, 1)
						if (player:hasSpace("mobs_for_dummies", 1)) then
							player:addItem("mobs_for_dummies", 1)
							player.quest["innerStrength"] = 1
						end
					end
				elseif (menu == 2) then
				end
			elseif (menu == 2) then
			end
		elseif (menu == 2) then
			player:dialogSeq({npcG, "*You run away*"}, 1)
		end
	elseif (innerStrength == 1) then
		--12, 23, 82, 111, 112, 113, 114
		local mob12 = player.registry["mobs_for_dummies_12"]
		local mob23 = player.registry["mobs_for_dummies_23"]
		local mob82 = player.registry["mobs_for_dummies_82"]
		local mob67 = player.registry["mobs_for_dummies_67"]
		local mob68 = player.registry["mobs_for_dummies_68"]
		if (mob12 == 250 and mob23 == 250 and mob82 == 250
		and	mob67 == 250 and mob68 == 250) then
			player:dialogSeq({npcG, "Hmm..\n\nVery good.",
			"You've survived that journey and were able to assess the strength of each enemy.",
			"You have potential.\n\nHowever, you can know everything in the world and still not be able to take a fight on.",
			"If you're ready to take on your last test, come talk to me again."}, 1)
			player.quest["innerStrength"] = 2
		else
			player:dialogSeq({npcG, "Stop wasting my time!",
			"Get the info for the angry wolf pup, small mouse, hoarder, bat and bear!"}, 1)
		end
	elseif (innerStrength == 2) then
		local duration = 120 * 1000
		player:dialogSeq({npcG, "You will be faced with fighting 3 different hoards of enemies that you've encountered prior.",
		"If you are able to prove your strength and focus by defeating them all I will agree to train you."}, 1)
		options = {"Yes.", "No."}
		menu = player:menu("Are you ready?", options)
		if (menu == 1) then
			player:dialogSeq({npcG, "Then let's begin.\n\n((Press [Next] to continue..))"}, 1)
			local objsMap = player:getObjectsInMap(218, BL_PC)
			if (#objsMap == 0) then
				player:warp(218, 8, 8)
				player:setTimer(2, 120)
				player:flushDuration(1)
				player.mapRegistry["activePC"] = player.ID
				player.mapRegistry["start_time"] = os.time()
				player.mapRegistry["current_wave"] = 1
				player.mapRegistry["wave_started"] = 0
				player:setDuration("gladiator_arena", duration)
			else
				if (objsMap[1].mapRegistry["activePC"] ~= objsMap[1].ID) then
					objsMap[1]:warp(128, 8, 8)
				end
				player:dialogSeq({npcG, "Someone is currently using the arena, please wait a while and try again."}, 1)
			end
		end
	elseif (innerStrength == 3) then--failed
		player:dialogSeq({npcG, "It seems you're not yet ready to begin devoting your life to our craft.",
		"Come back when you're stronger."}, 1)
		player.quest["innerStrength"] = 2
	elseif (innerStrength == 4) then--success
		if (player.class == 1) then
			player:dialogSeq({npcG, "Very impressive.\n\nI am surprised a young one such as yourself was able to handle these tests and because of that I will keep my promise.",
			"You begin training as a gladiator today.\n\nStay focused in mind and body.\n\nWelcome!"}, 1)
			player:addLegend("Found inner strength. "..curT(), "subpath", 18, 80)
			player.class = 6
			if (player.clan == 1) then
				player.clan = 0
			end
			player:status()
			player.quest["innerStrength"] = 250
			player.registry["mobs_for_dummies_12"] = 0
			player.registry["mobs_for_dummies_23"] = 0
			player.registry["mobs_for_dummies_82"] = 0
			player.registry["mobs_for_dummies_67"] = 0
			player.registry["mobs_for_dummies_68"] = 0
		else
			player:dialogSeq({npcG, "You can only become a gladiator if you're a warrior."}, 1)
		end
	end
end)
}

gladiator_arena = {
cast = function(player)
end,

while_cast = function(player)
	if (player.m == 218) then
		local objsMap = player:getObjectsInMap(218, BL_PC)
		if (#objsMap > 1) then
			if (player.mapRegistry["activePC"] ~= player.ID) then
				player:flushDuration(1)
				return
			end
		end
		--
		local wave = player.mapRegistry["current_wave"]
		local startT = player.mapRegistry["start_time"]
		local waveStarted = player.mapRegistry["wave_started"]
		local xRange, yRange
		if (wave == 1) then
			if (waveStarted == 0) then
			--spawn
				player.quest["innerStrength"] = 3
				for i = 1, 20 do
					xRange = math.random(5,11)
					yRange = math.random(5,11)
					player:spawn(23, xRange, yRange, 1)
				end
				player.mapRegistry["wave_started"] = 1
			elseif (gladiator_arena.check(player) == 0) then
				player.mapRegistry["current_wave"] = 2
				player.mapRegistry["wave_started"] = 0
				player:addHealth(player.maxHealth)
				player:addMagic(player.maxMagic)
				player:flushAether(1)
			end
			
		--23 20
		elseif (wave == 2) then
			if (waveStarted == 0) then
			--spawn
				for i = 1, 18 do
					xRange = math.random(5,11)
					yRange = math.random(5,11)
					player:spawn(78, xRange, yRange, 1)
				end
				player.mapRegistry["wave_started"] = 1
			elseif (gladiator_arena.check(player) == 0) then
				player.mapRegistry["current_wave"] = 3
				player.mapRegistry["wave_started"] = 0
				player:addHealth(player.maxHealth)
				player:addMagic(player.maxMagic)
				player:flushAether(1)
			end
		--78 18
		elseif (wave == 3) then
			if (waveStarted == 0) then
			--spawn
				for i = 1, 12 do
					xRange = math.random(5,11)
					yRange = math.random(5,11)
					player:spawn(83, xRange, yRange, 1)
				end
				player.mapRegistry["wave_started"] = 1
			elseif (gladiator_arena.check(player) == 0) then
				player.mapRegistry["current_wave"] = 250
				player.mapRegistry["wave_started"] = 0
				player:addHealth(player.maxHealth)
				player:addMagic(player.maxMagic)
				player:flushAether(1)
			end
		--83 12
		elseif (wave == 250) then
			player:addHealth(player.maxHealth)
			player:addMagic(player.maxMagic)
			player:flushAether(1)
			player.mapRegistry["activePC"] = 0
			player.mapRegistry["start_time"] = 0
			player.mapRegistry["current_wave"] = 0
			player.quest["innerStrength"] = 4
			player:flushDuration(1)
		end
	end
end,

check = function(player)
	local mobList = player:getObjectsInArea(BL_MOB)
	if (#mobList > 0) then
		return #mobList
	else
		return 0
	end
end,

uncast = function(player)
	player:setTimer(2, 1)
	player:warp(128, 8, 8)
end
}

mobs_for_dummies = {
use = function(player)
	if (player.quest["innerStrength"] == 0 or player.quest["innerStrength"] == 250 or player.class ~= 1) then
		player:removeItem("mobs_for_dummies", 1)
		player:popUp("The book vanishes.")
	end
	if (player.registry["mobs_for_dummies_timer"] >= os.time()) then
		player:sendMinitext("You must finish writing the previous data.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that")
		return
	elseif (player.state == 3) then
		player:sendMinitext("That would be somewhat difficult, don't you think?")
		return
	end
	
	local target = getTargetFacing(player, BL_MOB)
	local i
	local str = ""
	
	local mobList = {12, 23, 82, 67, 68}
	
	if (target ~= nil) then
		for i = 1, #mobList do
			if (target.mobID == mobList[i]) then
				str = target.name.."\n\nMax Health: "..target.maxHealth
				player.registry["mobs_for_dummies_"..mobList[i]] = 250
				player:popUp(str)
			end
		end
	end	
	player.registry["mobs_for_dummies_timer"] = os.time() + 5
end
}