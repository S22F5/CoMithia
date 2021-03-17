r2_blessed_well = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(982, "monster"), color = 30}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0

	if (player.quest["oneWithGreatTree"] >= 1) then
		if (distance(player, npc) <= 2) then
			npc:sendAnimation(169)
			if (player:hasItem("halcyon_bowl", 1) == true) then
				player:removeItem("halcyon_bowl", 1)
				player:addItem("halcyon_filled_bowl", 1)
			end
			if (player.quest["oneWithGreatTree"] == 1) then
				player.quest["oneWithGreatTree"] = 2
			end
		else
			player:dialogSeq({npcG, "You are too far and can't reach it."}, 1)
		end
	end
end),

yell = function(player, npc)
	local lspeech = string.lower(player.speech)
	if (lspeech == "home") then
		player:warp(37, 17, 14)
	end
end,

action = function(npc)
	npc:sendAnimation(135, -1)
	npc:sendAnimation(135, 30)
end
}