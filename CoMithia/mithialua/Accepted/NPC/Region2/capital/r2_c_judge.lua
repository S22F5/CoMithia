r2_c_judge = {
click = async(function(player, npc)
	local d = {graphic = 0, color = 0}
	local i = {graphic = convertGraphic(23, "item"), color = 0}
	local m = {graphic = convertGraphic(776, "monster"), color = 14}
	local quest = player.quest["r2_c_judge_rat"]
	
	player.npcGraphic = d.graphic
	player.npcColor = d.color
	player.dialogType = 1
	
	if (quest == 0) then
		if (player.level >= 5) then
			player:dialogSeq({d, "Want to give me a hand?",
			i, "There's a hoarder down in the well. She stole the prison keys and now this prisoner is stuck! Could you take a trip down the well and try to find the keys?",
			d, "The rats probably picked it up after she dropped it. Go ahead and squash a few while you're down there."}, 1)
			player.quest["r2_c_judge_rat"] = 1
		else
			player:dialogSeq({d, "Want to give me a hand?",
			d, "You're still a bit green, come back later. (5th Insight)"}, 1)
		end
	elseif (quest == 1) then
		if (player:hasItem(3, 1) == true) then
			player:dialogSeq({d, "Fantastic! Thank you! I might have more work for you later, so please come back! (10th Insight)"}, 1)
			player:removeItem(3, 1)
			player:giveXP(10000)
			player:addGold(1000)
			player.quest["r2_c_judge_rat"] = 2
		else
			player:dialogSeq({i, "The key is still missing!"}, 1)
		end
	elseif (quest == 2) then
		if (player.level >= 10) then
			player:dialogSeq({d, "Hey there, I remember you.",
			m, "The hoarder keeps stealing EVERYTHING. She must be stopped. Find out where she's hiding down in that sewer and bring her back here in cuffs. You'll have to knock her out first."}, 1)
			player.quest["r2_c_judge_rat"] = 3
			player:flushKills(12)
		else
			player:dialogSeq({d, "Hey there, I remember you.",
			d, "I need more experienced people, go train and become stronger! (10th Insight)"}, 1)
		end
	elseif (quest == 3) then
		if (player:killCount(12) >= 1) then
			player:dialogSeq({d, "Thanks for the help. Here's the bounty put out by the townsfolk."}, 1)
			player:addLegend("Cleaned up the Hoarder. "..curT(), "hoarder", 10, 80)
			player:giveXP(25000)
			player:addGold(5000)
			player.quest["r2_c_judge_rat"] = 4
		else
			player:dialogSeq({m, "She's gotta be down there somewhere, go find her!"}, 1)
		end
	else
		if (not player:hasLegend("hoarder")) then
			player:addLegend("Cleaned up the Hoarder. "..curT(), "hoarder", 10, 80)
		end
		
		player:dialogSeq({t, "Time for court, I'll have more jobs for you later."}, 1)
	end
end),

say = function(player, npc)

end,

action = function(npc)
	local questText = {"Help!", "Stay straight, citizen.", "Help me out, it might come back to you."}
	
	npc:talk(0, "Judge: "..questText[math.random(#questText)])
end
}