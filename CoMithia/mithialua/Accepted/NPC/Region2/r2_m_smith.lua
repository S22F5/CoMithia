r2_m_smith = {

click = async(function(player,npc)
	local t={graphic=convertGraphic(185,"monster"),color=104}
	
	player.npcGraphic=t.graphic
	player.npcColor=t.color
	player.dialogType = 0
	
	local thingsIBuy = { }
	
	for i=1, 168 do
		table.insert(thingsIBuy, 190000000 + i)
	end
	local quests = {}
	local options = {"Sell"}
	local menu
	if (player.class == 1 and player.quest["greatProtector"] >= 0 and player.quest["greatProtector"] < 250) then
		table.insert(quests, "Great Protector")
	end
	if (#quests > 0) then
		table.insert(options, "Quest")
	end
	menu = player:menuString("Mogn.", options)
	if (menu == "Quest") then
		r2_m_smith.questSelection(player, npc)
	elseif (menu == "Sell") then
		player:sellExtend("What do you have to sell?",thingsIBuy)
	end
	
end),

action = function (npc, player)

	if (math.random(0,3) == 0) then
		if(math.random(0,1) == 0) then
			if(npc.side == 0) then
				npc.side = 3
			else
				npc.side = npc.side - 1
			end
		else
			if(npc.side == 3) then
				npc.side = 0
			else
				npc.side = npc.side + 1
			end
		end
	end
	
	npc:sendSide()
	
	if (math.random(0,4) == 0) then
		npc:move()
	end
	
end,

say = function(player, npc)
	local speech = player.speech
	local lspeech = string.lower(speech)

	if (lspeech == "quest") then
		npc:talk(0, npc.name..": tap my shoulder.")
		--async(r2_m_smith.questSelection(player, npc))
	end
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