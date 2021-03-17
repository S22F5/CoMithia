r2_lj_hunter = {
click = async(function(player,npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	local bearQuest = player.quest["bearQuest"]
	local bearQuestRepeat = player.quest["bearQuestRepeat"]
	local bearOneG = {graphic = convertGraphic(24, "monster"), color = 21}--66
	local bearTwoG = {graphic = convertGraphic(24, "monster"), color = 4}--67
	local peltG = {graphic = Item("bear_pelt").icon, color = Item("bear_pelt").iconC}
	local options = {}
	local menu
	local killAmount = 35 + (player.level * 5)
	local itemAmount = 35 + (player.level * 5)
	local killCount66 = player:killCount(66)
	local killCount67 = player:killCount(67)
	local killTotal = killCount66 + killCount67
	local bQKA = player.registry["bearQuestKillAmount"]
	
	if (bearQuestRepeat > 0) then
		player.quest["bearQuestRepeat"] = 0
	end
	
	if (bearQuest == 0) then--first time
		if (player.level >= 19) then
			player:dialogSeq({npcG, "Hey there, you look like you can handle yourself."}, 1)
			options = {"I'm in.", "No, thanks."}
			menu = player:menu("Would you be interested in a job?", options)
			if (menu == 1) then
				player:dialogSeq({npcG, "I'm in need fresh bear pelts.",
				peltG, "Come back to me every "..itemAmount.." fresh pelts you get, for a reward.",
				bearOneG, "**Orag shows you a picture of a bear**",
				bearTwoG, "**Orag shows you a picture of a bear**",
				npcG, "They all count towards the "..killAmount.." that you need to kill."}, 1)
				player.quest["bearQuest"] = 1
				player.registry["bearQuestKillAmount"] = killAmount
				player:flushKills(66)
				player:flushKills(67)
			elseif (menu == 2) then
				--CLOSE
				return
			end
		else
			player:dialogSeq({npcG, "Hmm, I need some help, but you don't look like you can handle it yet."}, 1)
			return
		end
	elseif (bearQuest == 1) then
		if (player:hasItem("bear_pelt", bQKA) == true) then
			if (killTotal >= bQKA) then
				player:removeItem("bear_pelt", bQKA)
				player.quest["bearQuest"] = 249
				player:addGold(800)
				player:giveXP(675000)--6k average
				if (math.random(100000) <= 5000) then--5% chance level 18 ring
					player:addItem("saturite_ring", 1)
				elseif (math.random(100000) <= 2000) then--5% chance level 28 ring
					player:addItem("maranite_ring", 1)
				end
				player:flushKills(66)
				player:flushKills(67)
				
				player.registry["bearQuestKillAmount"] = 0
			
			player:dialogSeq({npcG, "Thanks for getting those fresh bear pelts.\n\nHere is your bounty."}, 1)
			
			else
				player:dialogSeq({npcG, "Pelts need to be fresh from the bear.",
				"You have killed "..killTotal.." bears out of "..bQKA.."."}, 1)
				return
			end
		else
			player:dialogSeq({peltG, "You only have "..player:hasItem("bear_pelt", bQKA).." out of "..bQKA.."."}, 1)
			return
		end
		--------------------------
	elseif (bearQuest == 249) then--Transition from quest to repeatable.
		player:dialogSeq({npcG, "Argh, I need more pelts for my business."}, 1)
		player.quest["bearQuest"] = 250
	elseif (bearQuest == 250 and bQKA == 0) then--main quest completed
		player:dialogSeq({npcG, "Pelts! More pelts!"}, 1)
		options = {"Sure.", "No thanks."}
		menu = player:menu("Would you like to help me gather more petls?", options)
		if (menu == 1) then
				player:dialogSeq({npcG, "I'm in need fresh bear pelts.",
				peltG, "Come back to me every "..itemAmount.." fresh pelts you get, for a reward.",
				bearOneG, "**Orag shows you a picture of a bear**",
				bearTwoG, "**Orag shows you a picture of a bear**",
				npcG, "They all count towards the "..killAmount.." that you need to kill."}, 1)
				player.quest["bearQuest"] = 1
				player.registry["bearQuestKillAmount"] = killAmount
				player:flushKills(66)
				player:flushKills(67)
		elseif (menu == 2) then
			player:dialogSeq({npcG, "Well if you change your mind let me know."}, 1)
			return
		end
	elseif (bQKA > 0) then--repeating
		if (player:hasItem("bear_pelt", bQKA) == true) then
			if (killTotal >= bQKA) then
				player:removeItem("bear_pelt", bQKA)
				--player.quest["bearQuestRepeat"] = bearQuestRepeat + 1
				player:addGold(800)
				player:giveXP(675000)--6k average 900k for 150, 75%
				if (math.random(100000) <= 5000) then--5% chance level 18 ring
					player:addItem("saturite_ring", 1)
				elseif (math.random(100000) <= 2000) then--5% chance level 28 ring
					player:addItem("maranite_ring", 1)
				end
				player:flushKills(66)
				player:flushKills(67)
				player.registry["bearQuestKillAmount"] = 0
				player:dialogSeq({npcG, "Thanks for getting those fresh bear pelts.\n\nHere is your bounty."}, 1)
			else
				player:dialogSeq({npcG, "Pelts need to be fresh from the bear.",
				"You have killed "..killTotal.." bears out of "..bQKA.."."}, 1)
				return
			end
		else
			player:dialogSeq({peltG, "You only have "..player:hasItem("bear_pelt", bqKA).." out of "..bQKA.."."}, 1)
			return
		end
	else
		player:dialogSeq({npcG, "We have no business."}, 1)
	end
end),

action = function(npc)
	local str = {"Orag: There's a cave nearby, I know I can make profit out of it.",
	"Orag: Pelts? Anyone?",
	"Orag: Pelts must be fresh! Old pelts smell? Un-bear-able!",
	"Orag: I'm getting a lot of pelts thanks to Kiz'Ak weakening the bears, hehe.",
	"Orag: Bring me your fresh pelts!",
	"Orag: I made an arrangement with the city butchers so that all pelts would go to me.",
	"Orag: It's a wasteland in there.",
	"Orag: Damn bears are more aggressive than ever.",
	"Orag: If I get hit in the head by one more bat...",
	"Orag: I wonder if someone can help me with these pelts.",
	"Orag: Hey, you look strong, mind helping me?",
	"Orag: I keep hearing something deep in that cave.",
	"Orag: Woah, have you heard that loud roar?"}
	local rstr = math.random(#str)

	if (math.random(1000) >= 825) then
		npc:talk(0,""..str[rstr])
	end
end

}