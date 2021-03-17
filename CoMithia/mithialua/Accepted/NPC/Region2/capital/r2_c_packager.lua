r2_c_packager = {
click = async(function(player,npc)
	local t = {graphic = 0, color = 0}
	local opts = {}
	local optsPO = {}
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 1
	
	local menuOption = player:menuString("Packages! I send them. Give to me and I deliver. Small fee paid and I deliver. Rain or shine and I deliver. Need some help?", {"Yes", "No"})
	
	if (menuOption == "Yes") then
		local item = player:getParcel()
		
		table.insert(optsPO,"Send")
		
		if (item ~= false) then
			table.insert(optsPO,"Receive")
		end
		
		local menuOptionPO = player:menuString("Post Office Services", optsPO)
		
		if (menuOptionPO == "Send") then
			player:sendParcelTo(npc)
		elseif (menuOptionPO == "Receive") then
			player:receiveParcelFrom(npc)
		end
	end
end),

say = function(player, npc)
	local speech = player.speech
	local lspeech = string.lower(speech)

	if (lspeech == "quest") then
		async(r2_c_packager.questSelection(player, npc))
	end
end,

action = function(npc, player)

end,

questSelection = async(function(player, npc)
	local npcGraphics = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
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