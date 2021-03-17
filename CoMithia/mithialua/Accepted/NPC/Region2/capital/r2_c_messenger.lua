r2_c_messenger = {
click = async(function(player,npc)
	local npcG = {graphic = 0, color = 0}
	
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	
	if (player.accountRegistry["betaParticipation"] == 1) then
		player:dialogSeq({npcG, "Thank you for your participation in closed beta, here is a little reward from the gods."} ,1)
		player:addItem("beta_balloon_sword", 1, 1000, player.ID)
		player.accountRegistry["betaParticipation"] = 0
		player:addLegend("Witnessed the creation.", "beta", 128, 80) --adds legend to player
	end
	
end)
}