r2_c_event_announcer = {
click = async(function(player,npc)
	local t = {graphic = convertGraphic(641, "monster"), color = 0}
	local opts = {"Yes", "No"}
	local speech = string.lower(player.speech)
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 0
			
	if (player.gmLevel >= 50 or player.registry["arenaHost"] == 250) then
		local choice = player:menuString("Would you like to host an onslaught?", opts)
		
		if (choice == "Yes") then
			local minutes = tonumber(player:input("How many minutes from now would you like the onslaught to start?"))
			
			if (minutes > 0) then
				npc.registry["hostTime"] = os.time() + (minutes * 60)
			else
				npc.registry["hostTime"] = os.time()
			end
			player:gmMsg(player.name.." has started an onslaught; "..minutes.." minutes.")
			addChatLog(player, player.name.." has started an onslaught; "..minutes.." minutes.")
			broadcast(-1, "The onslaught will start in "..math.ceil((npc.registry["hostTime"] - os.time()) / 60).." minute(s).")
		else
			player:dialogSeq({t, "Very well then."}, 1)
		end
	elseif (player.state ~= 1) then
		player:dialogSeq({t, "You're not dead, yet. Now get in there and FIGHT!"})
	else
		local menuOption = player:menuString("Even the best sometimes falter. Do you wish to be resurrected?", opts)
		
		if (menuOption == "Yes") then
			player.state = 0
			player.attacker = player.ID
			player:addHealthExtend(player.maxHealth, 0, 0, 0, 0, 0)
			player.magic = player.maxMagic
			player:updateState()
			player:addHealthExtend(1, 0, 0, 0, 0, 0)
			player:sendAnimation(96)
			player:playSound(112)
			player.registry["lastrez"] = os.time()
			npc:talk(0, "Announcer: Go give 'em hell, ".. player.name..".")
		else
			player:dialogSeq({t, "Suit yourself, spirit. Come visit me anytime."})
		end
	end
end),

say = function(player, npc)
	local speech = string.lower(player.speech)
	
	if ((string.find(speech, "(.*)res(.*)") or string.find(speech, "(.*)rez(.*)")) and player.state == 1) then
		player.state = 0
		player.attacker = player.ID
		player:addHealthExtend(player.maxHealth, 0, 0, 0, 0, 0)
		player.magic = player.maxMagic
		player:updateState()
		player:addHealthExtend(1, 0, 0, 0, 0, 0)
		player:sendAnimation(96)
		player:playSound(112)
		player.registry["lastrez"] = os.time()
		npc:talk(0, "Shaman: We shall meet again, ".. player.name..".")
	end
end,

action = function(npc)
	if (npc.registry["hostTime"] > 0 and npc.registry["hostTime"] > os.time()) then
		broadcast(-1, "The onslaught will start in "..math.ceil((npc.registry["hostTime"] - os.time()) / 60).." minute(s).")
	elseif (npc.registry["hostTime"] > 0 and npc.registry["hostTime"] <= os.time()) then
		broadcast(-1, "The onslaught doors have closed, thank you for your participation.")
		npc.registry["hostTime"] = 0
	end
end
}