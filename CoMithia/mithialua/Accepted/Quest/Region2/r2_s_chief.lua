r2_s_chief = {
click = async(function(player,npc)
	local npcG = {graphic = 0, color = 0}

	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 1
	player.lastClick = npc.ID
	
	if (player.level >= 41) then
		local killCount117 =  player:killCount(117)
		local killCount118 =  player:killCount(118)
		local killCount119 =  player:killCount(119)
		local killCount120 =  player:killCount(120)
		local killCount121 =  player:killCount(121)
		local killTotal = killCount117 + killCount118 + killCount119 + killCount120 + killCount121

		if (killTotal >= 1000) then
			player:flushKills(117)
			player:flushKills(118)
			player:flushKills(119)
			player:flushKills(120)
			player:flushKills(121)
			player:giveXP(1000000)
			player:addGold(1000)
			player:dialogSeq({npcG, "Thanks for dispatching those monsters.\n\nI will keep you in mind for this job again."}, 1)
		else
			player:dialogSeq({npcG, "There are these monsters that have recently started spawning in this abandoned house's basement.",
			"Help me get rid of 1000 of these monsters.",
			"You have killed "..killTotal.." out of 1000 I need you to dispatch."}, 1)
		end
	else
		player:dialogSeq({npcG, "You're not strong enough."}, 1)
	end
end)
}