r2_c_smith = {
click = async(function(player,npc)
	local t = {graphic = convertGraphic(1383, "monster"), color = 0}
	local opts = {"Buy", "Sell", "Repair Item", "Repair All"}
	local optsbuy = {"Peasant", "Weapons", "Helms", "Splint mails", "Splint mail dresses", "Waistcoats", "Blouses"}
	local menuOption
	local menuOptionBuy

	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 0
	
	if (player.quest["locations"] == 2) then
		r2_locations.quest(player, npc)
		return
	end
	
	menuOption = player:menuString("Welcome to my shop. How can I help you?", opts)
	
	if (menuOption == "Buy") then
		menuOptionBuy = player:menuString("What kind of object would you like to buy?", optsbuy)
		
		if (menuOptionBuy == "Peasant") then
			player:buyExtend("What do you wish to buy?", {200000000, 200000001, 1000000500})
		elseif (menuOptionBuy == "Weapons") then
			player:buyExtend("What do you wish to buy?", {100000000, 10800000, 11500000, 20800000, 21500000})
		elseif (menuOptionBuy == "Helms") then
			player:buyExtend("What do you wish to buy?", {400000002, 400000003, 400000004, 400000005, 400000006, 400000007, 400000008})
		elseif (menuOptionBuy == "Splint mails") then
			player:buyExtend("What do you wish to buy?", {190000001, 190000025, 190000049, 190000073, 190000097, 190000121, 190000145})
		elseif (menuOptionBuy == "Splint mail dresses") then
			player:buyExtend("What do you wish to buy?", {190000002, 190000026, 190000050, 190000074, 190000098, 190000122, 190000146})
		elseif (menuOptionBuy == "Waistcoats") then
			player:buyExtend("What do you wish to buy?", {190000007, 190000031, 190000055, 190000079, 190000103, 190000127, 190000151})
		elseif (menuOptionBuy == "Blouses") then
			player:buyExtend("What do you wish to buy?", {190000008, 190000032, 190000056, 190000080, 190000104, 190000128, 190000152})
		end
	elseif (menuOption == "Sell") then
		player:sellExtend("What do you wish to sell?", {3, 300000001, 300000002, 300000003, 300000004, 300000005, 300000006})
	elseif (menuOption == "Repair Item") then
		player:repairExtend()
	elseif (menuOption == "Repair All") then
		player:repairAll(player, npc)
	end
end),

say=function(player,npc)
	local t = {graphic = convertGraphic(1383, "monster"), color = 0}
	local s = player.speech
	local lspeech = string.lower(s)
	
	if (string.find(string.lower(s), "repair all") ~= nil) then
		player:repairAll(player, npc)
	elseif (lspeech == "quest") then
		async(r2_c_smith.questSelection(player, npc))
	end
end,

questSelection = async(function(player, npc)
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
end)
}