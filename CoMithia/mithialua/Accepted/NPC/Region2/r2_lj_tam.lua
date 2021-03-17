r2_lj_tam = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	
	r2_lj_tam.questSelection(player, npc)
end),

say = function(player, npc)
	local speech = player.speech
	local lspeech = string.lower(speech)

	if (lspeech == "quest") then
		npc:talk(0, npc.name..": tap my shoulder.")
	end
end,

action = function(npc, player)

end,

questSelection = function(player, npc)
	local npcGraphics = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	local quests = {}
	
	player.npcGraphic = npcGraphics.graphic
	player.npcColor = npcGraphics.color
	player.dialogType = 0
	player.lastClick = npc.ID
	
	if (player.class == 1 and player.quest["greatProtector"] >= 0 and player.quest["greatProtector"] < 250) then
		table.insert(quests, "Great Protector")
	end
	
	if (#quests > 0) then
		local menu = player:menuString("Which quest?", quests)
		
		if (menu == "Great Protector") then
			greatProtector.questIndex(player, npc)
		end
	else
		player:dialogSeq({"No quests available."}, 1)
	end
end
}