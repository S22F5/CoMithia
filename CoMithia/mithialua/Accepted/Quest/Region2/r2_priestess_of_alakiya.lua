r2_priestess_of_alakiya = {
click = async(function(player, npc)
	local npcG = {graphic = 0, color = 0}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.lastClick = npc.ID
	player.dialogType = 1
	local options = {}
	local menu
	local wellG = {graphic = convertGraphic(982, "monster"), color = 30}
	
	if (player.quest["oneWithGreatTree"] >= 1) then
		player:dialogSeq({npcG, "Ah, Koyo has sent you for the water of Genesis?"}, 1)
		options = {"I'm ready.", "Not quite yet."}
		menu = player:menu("I will take you to the ruins if you're ready.", options)
		if (menu == 1) then
			player:dialogSeq({npcG, "Once you go in the maze, any items dropped will be forever lost.",
			"If you get stuck and would like to leave, yell 'home' and I will bring you out.",
			wellG, "Once you get close enough to the well, get some water and head back Koyo.\n\n((Tap the well))"}, 1)
			options = {"Take me to the labyrinth.", "Not at this moment."}
			menu = player:menu("Are you sure you want to head into the labyrinth at this moment?", options)
			if (menu == 1) then
				if (player:hasItem("halcyon_bowl", 1) == true) then
					--do nothing
				else
					if (player:hasSpace("halcyon_bowl", 1)) then
						player:addItem("halcyon_bowl", 1)
					else
						player:dialogSeq({npcG, "You need enough space to hold a bowl."}, 1)
						return
					end
				end
				player:dialogSeq({npcG, "Remember, if you get stuck you can use the bowl to get out."}, 1)
				player:warp(217, 2, 56)
				--warp to labrynth
			elseif (menu == 2) then
			end
		elseif (menu == 2) then
		end
	end
end),

action = function(npc)
	npc:sendAnimation(135, -1)
	npc:sendAnimation(135, 30)
end
}