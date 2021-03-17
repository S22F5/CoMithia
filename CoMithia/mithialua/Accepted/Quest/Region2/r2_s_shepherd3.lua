r2_s_shepherd3 = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	local banditQuestTimer = player.quest["banditQuestTimer"]
	local banditQuest = player.quest["banditQuest"]
	local bQR = player.quest["banditQuestItem"]
	local rand = math.random(1,4)
	--local questItem = {"r2_s_quest_cloth_or", "r2_s_quest_cloth_bl", "r2_s_quest_cloth_su", "r2_s_quest_cloth_sp"}
	local questItem = {202, 203, 204, 205}
	local menu
	local options = {}
	local killCount111 = player:killCount(111)
	local killCount112 = player:killCount(112)
	local killCount113 = player:killCount(113)
	local killCount114 = player:killCount(114)
	local killTotal = killCount111 + killCount112 + killCount113 + killCount114
	local itemQ
	
	if (bQR == 0) then
		itemQ = Item(questItem[rand])
	else
		itemQ = Item(questItem[bQR])
	end
	
	local clothG = {graphic = itemQ.icon, color = itemQ.iconC}
	
	local accountQuest = player.accountRegistry["banditQuest"]
	
	if (accountQuest > os.time()) then
		player:dialogSeq({npcG, "Hey there, you look familiar...",
		"Didn't you help me earlier today?",
		"Yeah, it was you, I'm sure.\n\nThanks for helping!"}, 1)
		return
	end
	
	if (banditQuest == 0) then--first time
		if (player.level >= 26) then
			player:dialogSeq({npcG, "Hey there, you look like you can handle yourself."}, 1)
			options = {"Yes!", "No, thanks."}
			menu = player:menu("Would you be interested in a job?", options)
			if (menu == 1) then
				player.quest["banditQuestItem"] = rand
				if (player.quest["banditQuestItem"] == 0) then
					itemQ = Item(questItem[rand])
				else
					itemQ = Item(questItem[player.quest["banditQuestItem"]])
				end
				clothG = {graphic = itemQ.icon, color = itemQ.iconC}
				
				player.quest["banditQuest"] = 2
				player:flushKills(111)
				player:flushKills(112)
				player:flushKills(113)
				player:flushKills(114)
				player:dialogSeq({npcG, "Bandits have taken refuge in the nearby ruins to the East.",
				"Ever since, they have been intercepting our supply caravans to Areci Mesuv.",
				clothG, "I need you to retrieve this sample.",
				npcG, "Also dispatch of 50 bandits to let them know not to mess with us."}, 1)
			elseif (menu == 2) then
				--CLOSE
				return
			end
		else
			player:dialogSeq({npcG, "Hmm, I need some help, but you don't look like you can handle it yet."}, 1)
			return
		end
	elseif (banditQuest <= 20) then--TEN REPEATs; it's (repeat * 2)
		if (banditQuest % 2 == 1) then--Start
			player:dialogSeq({npcG, "Nice to see you again!"}, 1)
			options = {"Yes!", "No, thanks."}
			menu = player:menu("Would you help me some more?", options)
			if (menu == 1) then
				player.quest["banditQuestItem"] = rand
				
				if (banditQuestTimer == 0) then
					player.quest["banditQuestTimer"] = os.time() + 79200
				end
				
				if ((accountQuest + 1) == 30) then
					player.accountRegistry["banditQuest"] = os.time() + 79200
				elseif (accountQuest < 30) then
					player.accountRegistry["banditQuest"] = player.accountRegistry["banditQuest"] + 1
				elseif (accountQuest <= os.time()) then
					player.accountRegistry["banditQuest"] = 1
				end
				
				if (player.quest["banditQuestItem"] == 0) then
					itemQ = Item(questItem[rand])
				else
					itemQ = Item(questItem[player.quest["banditQuestItem"]])
				end
				
				clothG = {graphic = itemQ.icon, color = itemQ.iconC}
				
				player.quest["banditQuest"] = player.quest["banditQuest"] + 1
				player:flushKills(111)
				player:flushKills(112)
				player:flushKills(113)
				player:flushKills(114)
				player:dialogSeq({npcG, "Bandits have taken refuge in the nearby ruins to the East.",
				"Ever since, they have been intercepting our supply caravans to Areci Mesuv.",
				clothG, "I need you to retrieve this sample.",
				npcG, "Also dispatch of 50 bandits to let them know not to mess with us."}, 1)
			elseif (menu == 2) then
				--CLOSE
				return
			end
		elseif (banditQuest % 2 == 0) then--Complete
			if (killTotal >= 50 and player:hasItem(questItem[bQR], 1) == true) then
				player:dialogSeq({npcG, "Thanks for getting this sample back and teaching them a lesson."}, 1)
				player.quest["banditQuest"] = player.quest["banditQuest"] + 1
				player:removeItem(questItem[bQR], 1)			
				player:addGold(2000)
				player:flushKills(111)
				player:flushKills(112)
				player:flushKills(113)
				player:flushKills(114)
				player.quest["banditQuestItem"] = 0
			else
				player:dialogSeq({npcG, "You have killed "..killTotal.." bandits out of 50.",
				"Killed:\n"..killCount111.." Warrior bandits\n"..killCount112..
				" Rogue bandits\n"..killCount113.." Mage bandits\n"..killCount114.." Poet bandits.",
				clothG, "Remember I need this sample."}, 1)
				return
			end	
		end
	elseif (banditQuestTimer < os.time()) then
		player:dialogSeq({npcG, "Ah, another day.\n\nLet's do this!",
		"Let me know when you're ready, because I am!"}, 1)
		player.quest["banditQuestTimer"] = 0
		player.quest["banditQuest"] = 1
	else
		player:dialogSeq({npcG, "There are no more caravan supplies planned for today."}, 1)
	end
end),

action = function(npc)

	local str = {npc.name..": Those bandits always ruining my business...",
	npc.name..": I need to get those samples back.",
	npc.name..": What could have happened to my shipment?",
	npc.name..": I wish someone would teach those bandits a lesson."}
	local rstr = math.random(#str)

	if (math.random(1000) >= 825) then
		npc:talk(0,""..str[rstr])
	end
end
}