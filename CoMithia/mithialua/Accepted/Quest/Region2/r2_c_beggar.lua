r2_c_beggar = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	local options = {}
	local menu = ""
	local randString = {"There's a woman down the well!", "You can take a horse from the stable.",
	"Gossip? I know it all, but do I tell?", "Got any coins to spare?",
	"Hang used to be a city guide before, I'm sure he can still show you around the city.",
	"There's a bank west of here.", "The marketplace is just south of here.",
	"Have you played Colors? It's my favorite game.",
	"If you like dancing, you will enjoy playing musical foursquare.",
	"I see so many people coming out of the pub all the time.\n\nMostly sailors and heavy workers.",
	"I am not short, you're just amazingly tall!"}
	local meat_scrapG = {graphic = Item("meat_scrap").icon, color = Item("meat_scrap").iconC}
	local lake_carp_itemG = {graphic = Item("lake_carp_item").icon, color = Item("lake_carp_item").iconC}
	local xp
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0

	local quest = player.quest["r2_c_beggar"]
	
	if (quest < 250) then
		table.insert(options, "Quest")
	end
	
	table.insert(options, "Gossip")
	
	if (#options > 0) then
		menu = player:menuString("Hi!", options)
		if (menu == "Quest") then
			if (quest == 0) then--1
				if (player:hasItem("meat_scrap", 1) == true) then
					player:dialogSeq({npcG, "Oh what is that smell!\n\n Could it be?",
					meat_scrapG, "Is that a meat scrap in your pocket?\n\nI have not eaten in a while."}, 1)
					options = {"Sure", "No sorry"}
					menu = player:menuString("Think I could have it?", options)
					if (menu == "Sure") then
						if (player:hasItem("meat_scrap", 1) == true) then
							player:removeItem("meat_scrap", 1)
							player.quest["r2_c_beggar"] = 1
							xp = getExp(player, 13)
							player:giveXP(xp)
						else
							player:dialog("Where did it go?", {})
						end
					elseif (menu == "No sorry") then
						player:dialog("But...\n\n       but...\n\n           ...but I'm hungry!", {})
					end
					
				else
					player:dialogSeq({npcG, "Would you fetch me something to eat?\n\n I haven't eaten in a while...",
					meat_scrapG, "Meat scrap will do, they are cheap and you can get them from Chopping Block just south of here."}, 1)
				end
			elseif (quest == 1) then
				player:dialogSeq({npcG, "Now that I have eaten I feel much better, even stronger.\n\nJust like when people used to call me King of Rats!\n\nHe-heh.",
				"Yeah, you heard me.\n\nPeople used to call me King of Rats; NOT that I'm a rat or anything, I just kept them under control.",
				"Who do you think cleared the well behind me?\n\nYou bet I did!",
				"Well, that was until the hoarder showed up and teamed up with those rats in the northern well.\n\nHow about you help me?",
				"Go and show those rats who the boss is, kill 5 small mice and come back to me."}, 1)
				player.quest["r2_c_beggar"] = 2
				player:flushKills(23)
			elseif (quest == 2) then--2
				if (player:killCount(23) >= 5) then
					player:dialogSeq({npcG, "Oh baby, I'm back!\n\n\nKing of rats is back!",
					"Well, you helped of course as my servant.\n\nThanks I guess."}, 1)
					player:flushKills(23)
					player.quest["r2_c_beggar"] = 3
					xp = getExp(player, 13)
					player:giveXP(xp)
				else
					player:dialog("You've only killed "..player:killCount(23)..". You need to kill "..(5 - player:killCount(23)).." more.", {})
				end
			elseif (quest == 3) then
				player:dialogSeq({npcG, "Hey, people have been talking and rumors have come back as feedback.\n\nKing of rats is back!",
				"How about you do another run?\n\nDo five more small mice and come back."}, 1)
				player.quest["r2_c_beggar"] = 4
				player:flushKills(23)
			elseif (quest == 4) then
				if (player:killCount(23) >= 5) then--3
					player:dialogSeq({npcG, "This should be good enough to keep my comeback on everybody's gossip.",
					"You've proven to be a good servant, heh.\n\nUntil next time!"}, 1)
					player:flushKills(23)
					local chance = 35
					if (player.baseClass == 4) then
						chance = 75
					end
					if (math.random(100) < chance) then
						player.quest["r2_c_beggar"] = 3
					else
						player.quest["r2_c_beggar"] = 5						
					end
					xp = getExp(player, 14, 50)
					player:giveXP(xp)
				else
					player:dialog("You've only killed "..player:killCount(23)..". You need to kill "..(5 - player:killCount(23)).." more.", {})
				end
			elseif (quest == 5) then--4
				if (player:hasItem("lake_carp_item", 1, player.ID, "Special fish") == true) then
					player:dialogSeq({npcG, "Oh what is that smell!\n\n Could it be?",
					lake_carp_itemG, "Is that a lake carp in your pocket?\n\nLooks fresh too."}, 1)
					options = {"Sure", "No sorry"}
					menu = player:menuString("Think I could have it?", options)
					if (menu == "Sure") then
						if (player:hasItem("lake_carp_item", 1, player.ID, "Special fish") == true) then
							player:removeItem("lake_carp_item", 1, 9, player.ID, "Special fish")
							player.quest["r2_c_beggar"] = 6
							xp = getExp(player, 14)
							player:giveXP(xp)
							player:dialogSeq({npcG, "Here's a tip for you to make some cash, the lady in Chopping Block buys fish!"}, 1)
						else
							player:dialog("Where did it go?", {})
						end
					elseif (menu == "No sorry") then
						player:dialog("But...\n\n       but...\n\n           ...but I'm hungry!", {})
					end
				else
					player:dialogSeq({npcG, "Hey, have you heard about the lake carps? They're normally found in the Mithian Wood's river.",
					"How about you get me one?\n\nIf you don't have a fishing pole, you can get one from the smith just south of here.",
					"I don't want a normal one, I want a special one fished by you!"}, 1)
				end
			elseif (quest == 6) then
				player:dialogSeq({npcG, "It's you again.\n\nI have not heard from my friend Tanner in a while.\n\nShe lives in Shepton, just NW of Areci Mesuv.",
				"Please check on her and let me know how she's doing."}, 1)
				player.quest["r2_c_beggar"] = 7
			elseif (quest == 7) then
				player:dialogSeq({npcG, "Hey, weren't you going to Tanner in Shepton just NW of Areci Mesuv to check on her?",
				"You are the worse servant ever. Hurry up!"}, 1)
			elseif (quest == 8) then--5
				player.quest["r2_c_beggar"] = 9
				xp = getExp(player, 15)
				player:giveXP(xp)
				player.registry["r2_c_beggar"] = os.time() + 300
				player:dialogSeq({npcG, "Oh I see, good to know.",
				"I have to check on something, come back later."}, 1)
			elseif (quest == 9) then
				if (player.registry["r2_c_beggar"] > os.time()) then
					player:dialogSeq({npcG, "Don't you see I'm still busy?\n\nCome back later I said!"}, 1)
				else
					player:dialogSeq({npcG, "Alright, see how far you had to walk to talk to Tanner and come back?",
					"I have a pro tip for you, up there in Ale Swimmers you can buy something called Tavern' Favor.",
					"Since you have been a good servant I will give you some, but after these you need to buy them yourself!\n\nNo begging allowed!"}, 1)
					player.quest["r2_c_beggar"] = 10
					player.registry["r2_c_beggar"] = 0
					player:addItem("taverns_favor", 5)
					player:dialogSeq({npcG, "Now what I want you to do is go back to Tanner and tell her you will help.",
					"Also help her obviously!"}, 1)
				end
			elseif (quest == 10) then--6 (+ 1)
				if (player.quest["r2_s_girl"] == 3) then
					xp = getExp(player, 15)
					player:giveXP(xp)
					player.quest["r2_c_beggar"] = 11
					player.registry["r2_c_beggar"] = os.time() + 900
					player:dialogSeq({npcG, "Thank you for helping her. I'll give you something extra this time."}, 1)
					player:addItem("taverns_favor", 1)
				else
					player:dialog("You are supposed to help Tanner, what are you waiting for?!", {})
				end
			elseif (quest == 11) then
				if (player.registry["r2_c_beggar"] > os.time()) then
					player:dialog("I have nothing for you now, come back later.", {})
				else
					player.registry["r2_c_beggar"] = 0
					player:flushKills(10001)
					player.quest["r2_c_beggar"] = 12
					player:dialogSeq({npcG, "I got news from Tanner, she needs you to find and kill five quick brown foxes.\n\nThey are usually just north of Mithian Woods.",
					"Remember to go to her after slaying them."}, 1)
				end
			elseif (quest == 12) then
				player:dialog("You should be killing those 5 quick brown foxes and going back to Tanner!", {})
			elseif (quest == 13) then
				player.quest["r2_s_girl"] = 4
				player:dialogSeq({npcG, "What? She said wrong instructions?",
				"Oh, that's right!\n\nSorry for the confusion, you have to go and kill 10 quick brown foxes.",
				"Remember they need to be recently killed before telling Tanner, she can tell the difference!"}, 1)
			elseif (quest == 14) then-- 7 (+1)
				player.quest["r2_c_beggar"] = 15
				xp = getExp(player, 12)
				player:giveXP(xp)
				player:addGold(1000)
				player:dialogSeq({npcG, "Even kings make mistakes!",
				"Here's 1,000 coins for the trouble."}, 1)
			elseif (quest == 15) then
				player:dialog("Well, there's nothing for you for the time being. Thanks for everything!", {})
				--?
			end
		elseif (menu == "Gossip") then
			player:dialog(randString[math.random(#randString)], {})
		end
	end
	
end)
}