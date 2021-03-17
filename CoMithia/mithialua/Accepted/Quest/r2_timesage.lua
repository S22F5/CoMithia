r2_timesage = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	if (player.class == 11 and not player:hasLegend("subpath")) then
		player:addLegend("Looked into the future. "..curT(), "subpath", 25, 80)
	end
	
	if (player.class == 3) then
		table.insert(menuOptions, "About Time Sage")
	end
	
	--[[if (player.class == 3 and player.level >= 25) then
		table.insert(menuOptions, "Become a Time Sage")
	end]]--
	
	if (player.class == 0 or player.class == 3 or player.class == 11) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	local choice = player:menuString("How may I assist you, young mage?", menuOptions)
	
	if (choice == "About Time Sage") then
		player:dialogSeq({npcG, "Ask me about the quest for more information."}, 1)
	--[[elseif (choice == "Become a Time Sage") then
		player:addLegend("Looked into the future. "..curT(), "subpath", 25, 80)
		player.class = 11
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

action = function(npc, player)

end,

say = function(player, npc)
	local lspeech = string.lower(player.speech)

	if (lspeech == "quest") then
		r2_timesage.quest(player, npc)
	end
end,

quest = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	--1
	local riddles = {{str = "If you don't abide by the rules you're put in the cages, bring back the watch when you count all the faces.", value = 5},
	--2
	{str = "The rhapsodes certainly do love their tea, how many cups of of Melody's can you see, if your eyes don't decieve, then bring back the same number on the watch to me.", value = 5},
	--3
	{str = "The four great fighters who mastered their paths, weilding their daggers, weapons, and staves, but those aren't the only weapons in their domain, count every thing that inflicts deadly pain.", value = 11},
	--4
	{str = "If you needed to get somewhere fast a horse would suit you best, but how many of these beasts are there from east to west?", value = 8},
	--5
	{str = "If you want to look great in yellow you'd best get a dye, but it seems like there's a number of stylish ones sporting that that might catch your eye.", value = 6},
	--6
	{str = "If you need something to protect you, head and toe, to the Smith is the place you should surely go, how many items there will protect those delicate places, mark down the number but don't forget your bases.", value = 7}
	--7
	--{str = "", value = 1}
	}
	
	
	local captureMoment = player.quest["captureMoment"]
	if (captureMoment == 0) then--NOT STARTED
		player:dialogSeq({npcG, "Ah, I see you've found me back here studying.",
		"I imagine you wouldn't be back here just looking for books, no... no... you must want to know more about the path of the Time Sage. Or maybe, maybe you already know lots about us!",
		"*Scratches his beard* Yes, I'd imagine you want to become one, for if you didn't want to become one you wouldn't have come one step in front of the other back here, right?!",
		"*Chortles* Ah... well, if that is indeed why you are here you must prove your worth young one."}, 1)--ending in 1 is pause, 0 is exit
		if (player.class ~= 3) then
			player:dialogSeq({npcG, "First, you need to be a mage.",
			"Oh wait, you don't look like a mage."}, 1)
		else
			player:dialogSeq({npcG, "First I want to make sure you know what we really are about...",
			"We excell in warping all that is around us, through crowd control and perfectly timed damage combinations, we can see what is going on around us in slow motion and adjust it to our benefit.",
			"Though some simpletons may call us passive scholars, they know not the power we hold in our hands, through our minds."}, 1)
			options = {"Agree, I want to become a Time Sage.", "What?"}
			menu = player:menu("Do you agree to not hold me responsible if you're lost in time, or under a pile of books?", options)
			if (menu == 1) then--YES
				player:dialogSeq({npcG, "That is good, but time is precious so first, your test.",
				"I need to know if you have time awareness; I will pick a moment in time and you need to come back to me grasping that moment.",
				"If you're too early or too late, you will have to start over."}, 1)
				player.quest["captureMoment"] = 1
			elseif (menu == 2) then--NO
				player:dialog("Ah, well time flows.", npcG)
			end
		end
	elseif (captureMoment == 1) then
		if (player.registry["captureMomentRiddle"] > 0) then
			table.remove(riddles, player.registry["captureMomentRiddle"])
		end
		local riddle = math.random(#riddles)
		
		player:dialogSeq({npcG, riddles[riddle]["str"]}, 1)
		player.registry["captureMomentRiddle"] = riddle
		player.registry["captureMomentTimer"] = riddles[riddle]["value"] * 60
		player.registry["captureMomentTime"] = os.time()
		player.quest["captureMoment"] = 2
		player:addItem("timesage_clock", 1)


		--[[
		local minT = 2 * 60--3 mins
		local maxT = 5 * 60--15 mins
		local rand = math.random(minT, maxT)
		player:dialogSeq({npcG, "I have made a mark in your timeline; now it is up to you to sense it.",
		"If you're having a hard time sensing it, I will let you know if you're early or late."}, 1)
		player.registry["captureMomentTimer"] = rand
		player.registry["captureMomentTime"] = os.time()
		player.quest["captureMoment"] = 2
		]]--
	elseif (captureMoment == 2) then
		local riddle = player.registry["captureMomentRiddle"]
		
		if (r2_timesage.captureMoment(player) == true) then
			player:dialogSeq({npcG, "Great job!",
			"Let me know when you're ready to trascend in time."}, 1)
			player.quest["captureMoment"] = 249
			player:removeItem("timesage_clock", 1)
			return
		end
		
		player:dialogSeq({npcG, riddles[riddle]["str"]}, 1)
		
	elseif (captureMoment == 249) then--COMPLETED, REWARD PENDING
		if (player.class == 3) then
			player:dialogSeq({npcG, "Congratulations Time Sage "..player.name.."."}, 1)
			player:addLegend("Captured a moment in time. "..curT(), "subpath", 25, 80)
			player.class = 11
			player.quest["captureMoment"] = 250
			if (player.clan == 1) then
				player.clan = 0
			end
			player:status()
		else
			player:dialogSeq({npcG, "You can only become a Time Sage if you're still a mage."}, 1)
		end
	elseif (captureMoment == 250) then
		--Next rank enabled/reqs
	end
end),

captureMoment = function(player)
	local ret = false
	local startTime = player.registry["captureMomentTime"]
	local timer = player.registry["captureMomentTimer"]
	local cTime = os.time()
	local npcG = {graphic = 0, color = 0}
	player.lastClick = NPC(90).ID
	
	if ((startTime + timer) >= (cTime + 30)) then--Too early
		--player:talk(0, "EARLY: startTime "..startTime.." timer "..timer.." cTime "..cTime.." SUM: "..(startTime + timer))
		player.registry["captureMomentTime"] = cTime
		player:dialog("Too early, you will need to calculate the time again.", npcG)
	elseif ((startTime + timer) <= (cTime - 30)) then--Too late
		player.quest["captureMoment"] = 1
		player:removeItem("timesage_clock", 1)
		--player:talk(0, "LATE: startTime "..startTime.." timer "..timer.." cTime "..cTime.." SUM: "..(startTime + timer))
		player:dialog("Too late, I will need to choose another moment.", npcG)
	else
		--player:talk(0, "startTime "..startTime.." timer "..timer.." cTime "..cTime.." SUM: "..(startTime + timer))
		--player:talk(0, "Moment?")
		ret = true
		return ret
	end
end
}