r2_c_arena_prizes = {
click = async(function(player, npc)
	local npcGraphics = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	local points = player.registry["arenaPoints"] + 1
	local wins = player.registry["onslaughtWins"] + 1
	
	player.npcGraphic = npcGraphics.graphic
	player.npcColor = npcGraphics.color
	player.dialogType = 0
	
	player:dialogSeq({npcGraphics, "I see you've won. Congratulations on your victory. Take this and get out!",
		{}, "You have acquired an arena token. You now have a total of "..points..". You can trade these to Event for prizes!"}, 1)
	player.registry["arenaPoints"] = points
	player.registry["onslaughtWins"] = wins
	player.armorColor = player.registry["arenaDyeSave"]
	player.registry["arenaDyeSave"] = 0
	player:warp(76, math.random(7, 16), math.random(18, 21))
	player:removeLegendbyName("onslaughtWins")
	
	if (wins == 1) then
		player:addLegend("Won "..wins.." Onlsaught.", "onslaughtWins", 1, 16)
	else
		player:addLegend("Won "..wins.." Onlsaughts.", "onslaughtWins", 1, 16)
	end
end)
}