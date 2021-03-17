r2_knight = {
click = async(function(player, npc)
	local t = {graphic = 0, color = 0}
	local menuOptions = {}
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 1
	
	if (player.class == 7 and not player:hasLegend("subpath")) then
		player:addLegend("Great protector. "..curT(), "subpath", 16, 80)
	end
	
	if (player.class == 1) then
		table.insert(menuOptions, "About Knight")
	end
	
	--[[if (player.class == 1 and player.level >= 25) then
		table.insert(menuOptions, "Become a Knight")
	end]]--
	
	if (player.class == 0 or player.class == 1 or player.class == 7) then
		table.insert(menuOptions, "Learn Spell")
	end
	
	table.insert(menuOptions, "Forget Spell")
	
	local choice = player:menuString("How may I assist you, young warrior?", menuOptions)
	if (choice == "About Knight") then
		player:dialogSeq({npcG, "Ask me about the quest for more information."}, 1)
	--[[elseif (choice == "Become a Knight") then
		player:addLegend("Great protector. "..curT(), "subpath", 16, 80)
		player.class = 7
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
	local speech = player.speech
	local lspeech = string.lower(speech)

	if (lspeech == "quest") then
		async(r2_knight.questSelection(player, npc))
	end
end,

action = function(npc, player)

end,

questSelection = async(function(player, npc)
	local npcGraphics = {graphic = convertGraphic(npc.look, "monster"), npc.lookColor}
	local quests = {}
	
	player.npcGraphic = npcGraphics.graphic
	player.npcColor = npcGraphics.color
	player.dialogType = 1
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
end)
}