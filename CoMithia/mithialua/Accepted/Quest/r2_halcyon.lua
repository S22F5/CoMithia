r2_halcyon = {
click = async(function(player, npc)
	local t = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 1
	
	if (player.class == 12 and not player:hasLegend("subpath")) then
		player:addLegend("Became one with the great tree. "..curT(), "subpath", 28, 80)
	end
	
	if (player.class == 4) then
		table.insert(menuOptions, "About Halcyon")
	end
	
	--[[if (player.class == 4 and player.level >= 25) then
		table.insert(menuOptions, "Become a Halcyon")
	end]]--
	
	if (player.class == 0 or player.class == 4 or player.class == 12) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	local choice = player:menuString("How may I assist you, young poet?", menuOptions)
	if (choice == "About Halcyon") then
		player:dialogSeq({npcG, "Ask me about the quest for more information."}, 1)	
	--[[elseif (choice == "Become a Halcyon") then
		player:addLegend("Became one with the great tree. "..curT(), "subpath", 28, 80)
		player.class = 12
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
		r2_halcyon.quest(player, npc)
	end
end,

quest = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	local itemG = {}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	local oneWithGreatTree = player.quest["oneWithGreatTree"]
	local menu
	local options = {}
	
	if (oneWithGreatTree == 0) then--NOT STARTED
		options = {"Actually, I'm here to become a Halcyon.",
		"Yes I have, thank you."}
		menu = player:menu("Hello my child. Have you come to worship Genesis?", options)
		if (menu == 1) then
			if (player.class ~= 4) then
				player:dialogSeq({npcG, "The first step to becoming a Halcyon is being a poet."}, 1)
			end
			if (player.level < 25) then
				player:dialogSeq({npcG, "Being a Halcyon requires great sacrifice, come back when you're stronger."}, 1)
			end
			player:dialogSeq({npcG, "That's wonderful.\n\nA halcyon0s life is not as easy as most think to be mind you.",
			"We dedicate our lives to Genesis and her protective aura.\n\nWe assist and aid in the growth of all things in this world and to protect them with our lives.",
			"People may think we are highly passive people, but they better know we are not afraid to defend what we believe in with our lives.",
			"This is no easy task and it requires great discipline."}, 1)
			options = {"Sure thing", "Nevermind"}
			menu = player:menu("Is this what you want?", options)
			if (menu == 1) then
				player:dialogSeq({npcG, "Great.\n\nHowever, saying things can be very easy, truly living in that way is a much harder.",
				"I am to test your devotedness to becoming a Halcyon before anything else.",
				"As you should know by now this great tree, The Alakiya, was the first living thing in the entire world, it was Genesis' first creation here.",
				"Because of that it retains a great amount of power and is constantly the target of people who wish to gain strength, some who are benevolent, but many wish to use that power for improper means.",
				"Our duty is to make sure that Alakiya is protected from harm but also not used by the impure.",
				"Every season of the year the base of the tree is doused in the magical waters that Genesis blessed long ago for the first people who lived here, this keeps tree healthy.",
				"There is water in a small well that was sealed away in ancient ruins underneath the castle of Aerci Mesuv allowed only to be used by Halcyons and the Emperor himself.",
				"It is your job to go to this well and bring back some water. You may enter through the castle gardens when you are ready."}, 1)
				player.quest["oneWithGreatTree"] = 1				
			elseif (menu == 2) then
				
			end
		elseif (menu == 2) then
			--exit
		end
	elseif (oneWithGreatTree == 1) then
		player:dialogSeq({npcG, "Remember to get water from the well underneath the palace garden.\n\nI will be waiting."}, 1)
	elseif (oneWithGreatTree == 2) then
		if (player.class == 4) then
			player:dialogSeq({npcG, "You have returned, very good young one.\n\nThose ruins are a actually a very complicated maze, one only with great patience and a true spirit will find themselves able to get through.",
			"That you were able to find your way through the labryinth and return with this water shows me that your resolve is strong and your dedication is genuine.",
			"We welcome you to become a Halcyon and begin your life as a great protector of The Alakiya and Genesis herself."}, 1)
			player:removeItem("halcyon_filled_bowl", 1)
			player.quest["oneWithGreatTree"] = 250
			player:addLegend("Became one with the great tree. "..curT(), "subpath", 28, 80)
			player.class = 12
			if (player.clan == 1) then
				player.clan = 0
			end
			player:status()
		else
			player:dialogSeq({npcG, "You can only become Halcyon if you're still a poet."}, 1)
		end
	end
end),

action = function(npc, player)

end
}