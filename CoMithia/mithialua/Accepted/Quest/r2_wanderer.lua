r2_wanderer = {
click = async(function(player, npc)
	local t = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 1
	
	if (player.class == 8 and not player:hasLegend("subpath")) then
		player:addLegend("Traveled the land. "..curT(), "subpath", 23, 80)
	end
	
	if (player.class == 2) then
		table.insert(menuOptions, "About Wanderer")
	end
	
	--[[if (player.class == 2 and player.level >= 25) then
		table.insert(menuOptions, "Become a Wanderer")
	end]]--
	
	if (player.class == 0 or player.class == 2 or player.class == 8) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	local choice = player:menuString("How may I assist you, young rogue?", menuOptions)
	if (choice == "About Wanderer") then
		player:dialogSeq({npcG, "Ask me about the quest for more information."}, 1)	
	--[[elseif (choice == "Become a Wanderer") then
		player:addLegend("Traveled the land. "..curT(), "subpath", 23, 80)
		player.class = 8
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
		r2_wanderer.quest(player, npc)
	end

end,
quest = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID

	local traveledLand = player.quest["traveledLand"]
	local menu
	local options = {}
	
	if (traveledLand == 0) then--NOT STARTED
		options = {"Hello?"}
		menu = player:menu("*The man seems to be unaware of your presence*", options)
		if (menu == 1) then
			options = {"Are you Feng?", "Maybe I should just leave."}
			menu = player:menu("*The man looks up at you then back down to the ground*", options)
			if (menu == 1) then
				options = {"I wanted to learn the ways of a Wanderer.", "No, excuse me."}
				menu = player:menu("Hm. Is there something you needed young one?", options)
				if (menu == 1) then
					player:dialogSeq({npcG, "*Feng looks up from the ground*"}, 1)
					options = {"Yes, sad to say that was me.", "Erm... no, wasn't me!"}
					menu = player:menu("Are you the one who washed ashore the other day?", options)
					if (menu == 1) then
						if (player.class ~= 2) then
							player:dialogSeq({npcG, "Well, I can rule you out being one of those needy city dwellers who simply wants me to help them with some asinine job.",
							"But if you're not aware enough to realize you aren't a rogue it probably is a good indicator that you aren't going to be able to live on your own out here."}, 0)
						else
							player:dialogSeq({npcG, "Well, I can rule you out being one of those needy city dwellers who simply wants me to help them with some asinine job.",
							"Why would you want to become a wanderer?"}, 1)
							options = {"None of that is important to me. Living", "off my own skills, knowing the land", "around me, becoming stronger and more", "focused is what's important to me,", "not superficial glory.", "In that case maybe this isn't for me."}
							menu = player:menu("This isn't a glamourous life by any means, you won't be recognized for greatness, you won't have it easy being a wanderer.", options)
							if (menu >= 1 and menu <= 5) then
								player:dialogSeq({npcG, "We will see about that, but I will humor your request with some tests. If you truly want to be self-sustaining you need to learn how to provide shelter for yourself,",
								"I want you to go out and find me the materials to make a yurt like my own.",
								"Bring me all your hands can handle in wool, wood, and ore. Be on your way."}, 1)
								player.quest["traveledLand"] = 1
							elseif (menu == 6) then--EXIT
								return
							end
						end
					elseif (menu == 2) then--EXIT
						player.dialogType = 0
						local itemG = {graphic = convertGraphic(1132, "item"), color = 0}
						player.npcGraphic = itemG.graphic
						player.npcColor = itemG.color
						player:dialogSeq({itemG, "*brushes seaweed of my shoe*"}, 0)
					end
				elseif (menu == 2) then--EXIT
					return
				end
			elseif (menu == 2) then--EXIT
				return
			end
		end
	elseif (traveledLand == 1) then
		local wood = player:hasItem("ash_log", 10)
		local iron = player:hasItem("iron_ore", 10)
		local wool = player:hasItem("wool", 10)
		
		player:dialogSeq({npcG, "*Feng looks up*",
		"Ah, you again, almost thought I wasn't going to see you come back here considering the time you took. Well let's see what you brought."}, 1)
		if (wood == true and iron == true and wool == true) then
			player:removeItem("ash_log", 10)
			player:removeItem("iron_ore", 10)
			player:removeItem("wool", 10)
			player.quest["traveledLand"] = 2

			player:dialogSeq({npcG, "Very good. The wood will be the base and frame of the yurt, the cloth will be used as the cover and for the flooring to keep the warmth in. The ore will be used to hold down our bases so if the storms come we aren't blown away.",
			"Now that we have enough to construct your home you need to be able to feed yourself, not just buy dinner from the butcher. Go out and fish a weeks supply of fish and bring them back to me so I can teach you how to store and cook them."}, 1)
		else
			player.dialogType = 0
			local woodG = {graphic = Item("ash_log").icon, color = Item("ash_log").iconC}
			local ironG = {graphic = Item("iron_ore").icon, color = Item("iron_ore").iconC}
			local woolG = {graphic = Item("wool").icon, color = Item("wool").iconC}
			if (wood == true) then
				wood = 10
			end
			if (iron == true) then
				iron = 10
			end
			if (wool == true) then
				wool = 10
			end
			player:dialogSeq({woodG, "Go cut down some trees and get some logs. ("..wood.."/10)"}, 1)
			player:dialogSeq({woolG, "Go sheer some sheep for their wool. ("..wool.."/10)"}, 1)
			player:dialogSeq({ironG, "Go mine some veins to get the ore. ("..iron.."/10)"}, 1)
		end
	elseif (traveledLand == 2) then
		local fish = player:hasItem("lake_carp_item", 7)
		
		player:dialogSeq({npcG, "You're finally back, let's see what you've brought."}, 1)
		
		if (fish == true) then
			player:removeItem("lake_carp_item", 7)
			player.quest["traveledLand"] = 3
			player:dialogSeq({npcG, "Hmm. A little small but these will do. You're going to want to dig a deep hole outside of your home and wrap these fish in some cloth so they don't get dirt on them.",
			"The deeper the hole the colder it will be and the longer they will last. You can either eat these fish raw as you catch them or you can cook them over a fire, but we don't have time for cooking lessons.",
			"Now, for your final test you're going to need to prove that you can defend yourself. In the town you're protected by walls, buildings, and the guards, but out here you're all on your own and there aren't people to help you. It's all on you.",
			"The life of a wanderer is not for the faint hearted, your mind and will must be strong enough to face new terrain and adapt to your surroundings to be able to overcome whatever challenge faces you next.",
			"It is a lonely yet ever changing life, people come in and out of it in the blink of an eye, some friends, some foe. But never boring. Some people you'll never forget, people who may have helped you out of a bind, when your life depended on it.",
			"As a matter of fact I can recall a dear friend of mine that still resides in the city, a powerful alchemist whos knowledge of the land is as great as mine who once helped me escape the sharp deadly grip of a werewulf.",
			"He's a little cynical but if you prove your worth and run some errands for him I'm sure he will open up and tell you about the werewolf and maybe where to find it, he really likes collecting wolf pelts so maybe bring him one to break the ice.",
			"One he gets started he'll never stop! If you can get him to tell you, go to that very place where I almost lost my life and slay the beast, and then return to me, and I shall teach you, my worthy friend, the ways of the Wanderer.",
			"\n\nGood luck."}, 1)
			--"Prove to me that you can handle the danger that is surrounding this area by slaying the deadly werewolf, if you can manage that, I will believe that you are ready to take on the life of a wanderer.",
			--"A dear friend of mine still resides in the city, a powerful alchemist whos knowledge of the land is as great as mine, if you need directions on how to find the werewolf he may be of assistance. Good luck."}, 1)
		else
			player.dialogType = 0
			local fishG = {graphic = Item("lake_carp_item").icon, color = Item("lake_carp_item").iconC}
			player:dialogSeq({fishG, "This isn't going to be enough to feed you for a week, go get some more ("..fish.."/7)"}, 1)
		end
	elseif (traveledLand == 3) then
		if (player.quest["r2_c_alchemist_wolf"] == 250) then
			player:dialogSeq({npcG, "I am impressed young one.",
			"I do believe that you are willing and able to adapt to this lifestyle. Good luck and I hope we see each other again one day."}, 1)
			if (player.class == 2 and player.level >= 25) then--and not player:hasLegend("subpath")) then
				player.quest["traveledLand"] = 250
				player.class = 8
				if (player.clan == 1) then
					player.clan = 0
				end
				player:status()
				player:addLegend("Traveled the land. "..curT(), "subpath", 23, 80)
			end			
		else
			player:dialogSeq({npcG, "If you can't do this, tell me. I can talk it out with my alchemist friend. I don't need your death to be blamed on me."}, 1)
		end
	end
end)
}