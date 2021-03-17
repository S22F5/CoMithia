sample = {
sample = async(function(player,npc)
	--Default NPC graphic (non player)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	--Another NPC graphic (non player)
	local npc2 = NPC(3)
	local npcG2 = {graphic = convertGraphic(npc2.look, "monster"), color = npc2.lookColor}
	--NPC Graphic (player)
	--?
	
	player:dialogSeq({npcG, "Dialog 1",
	npcG, "Dialog 2"}, 1)
end)
}