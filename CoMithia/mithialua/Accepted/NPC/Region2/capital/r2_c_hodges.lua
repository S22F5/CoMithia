r2_c_hodges = {
click = async(function(player,npc)
	local npcGraphics = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookC}
	local options = {}
	
	if (player.registry["warden"] == 0 and player.gmLevel < 50) then
		return
	end
	
	player.npcGraphic = npcGraphics.graphic
	player.npcColor = npcGraphics.color
	player.dialogType = 0
	
	table.insert(options,"Jail")
	table.insert(options,"Release")
	table.insert(options, "Announce")
	table.insert(options, "Tavern")
	table.insert(options, "Warden Spells")
	table.insert(options, "Board")
	
	menuOption = player:menuString("Yes, Warden?", options)

	if (menuOption == "Jail") then
		local playerName = player:input("Whom shall be jailed?")
		
		playerName = Player(playerName)
		
		if (playerName ~= nil) then
			local duration = tonumber(player:input("For how many days shall "..playerName.name.." be jailed?"))

			if (duration >= 50) then
				duration = 2^32
			else
				duration = duration * 86400000
			end
			
			addChatLog(player.ID, player.name.." jailed "..playerName.name..".")
			player:gmMsg(player.name.." jailed "..playerName.name..".")
			playerName:flushDuration(255)
			playerName:setDuration("criminal_judgement", duration, player.ID)
			playerName.registry["botFlag"] = 0
		end
	elseif (menuOption == "Release") then
		local playerName = player:input("Whom shall be released?")
		
		playerName = Player(playerName)
		
		if (playerName ~= nil) then
			addChatLog(player.ID, player.name.." released "..playerName.name..".")
			player:gmMsg(player.name.." released "..playerName.name..".")
			playerName:flushDuration(255)
		end
	elseif (menuOption == "Announce") then
		local boardOptions = {"Community", "Law", "Mithian Edict"}
		local boardChoice = player:menuString("Which board would you like players to read?", boardOptions)
		
		player:broadcast(-1, "Warden "..player.name.." invites you to read the "..boardChoice.." for more details.")
	elseif (menuOption == "Tavern") then
		local playerName = player:input("Who would you like to send to the tavern?")
		if (Player(playerName) ~= nil) then
			playerName = Player(playerName)
			if (playerName.region == 2 and player.gmLevel == 0) then
				playerName:warp(46, 11, 11)
				addChatLog(player, player.name.." has sent "..playerName.name.." to the tavern (2).")
				player:gmMsg(player.name.." has sent "..playerName.name.." to the tavern (2).", 1)
			else
				player:sendMinitext("You can not move that player.")
			end
		else
			player:sendMinitext("That player is not online.")
		end
	elseif (menuOption == "Warden Spells") then
		player:addSpell("criminal_judgement")
		player:addSpell("captcha")
	elseif (menuOption == "Board") then
		player:showBoard(256)
	end
end)
}