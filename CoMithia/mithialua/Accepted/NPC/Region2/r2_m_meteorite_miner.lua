r2_m_meteorite_miner = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color	
	player.dialogType = 0
	local meteoriteExtraction = player.quest["meteoriteExtraction"]
	local rockG = {graphic = Item("sample_rock").icon, color = Item("sample_rock").iconC}
	
	if (meteoriteExtraction >= 1 and meteoriteExtraction < 250) then
		if (player:hasSpace("sample_rock", 1) == true) then
			player:addItem("sample_rock", 1)
			player:dialogSeq({rockG, "These stones and minerals sell for a lot y'know, but I've got more than I can carry back to town.",
			"You can take these extras sport."}, 1)
		else
			if (player:hasItem("sample_rock", 1)) then
				player:dialogSeq({rockG, "These stones are very heavy, I don't think you can take two."}, 1)
			else
				player:dialogSeq({npcG, "You can't carry anything else!"}, 1)
			end
		end
	end
end)
}