r2_c_event = {
click = async(function(player, npc)
	local npcGraphics = {graphic = convertGraphic(npc.look, "monster"), color = npc.color}
	local options = {"Yes", "No"}
	local announcer = NPC(76)
	local choice = ""
	
	player.npcGraphic = npcGraphics.graphic
	player.npcColor = npcGraphics.color
	player.dialogType = 0
	
	if (announcer.registry["hostTime"] > 0) then
		choice = player:menuString("Would you like to participate in today's onslaught? The fee is 1000 coins.", options)
	else
		player:dialogSeq({npcGraphics, "There are no events at this time."}, 1)
		return
	end
	
	if (choice == "Yes") then
		if (player:removeGold(1000) == true) then
			local mats = {red = {6, 8, 18, 20}, black = {6, 24, 18, 36}, white = {22, 8, 34, 20}, blue = {22, 24, 34, 36}}
			local matChoice = math.random(4)
			local participations = player.registry["onslaughtParticipations"] + 1
			
			if (matChoice == 1) then
				player:warp(7001, math.random(mats.red[1], mats.red[3]), math.random(mats.red[2], mats.red[4]))
			elseif (matChoice == 2) then
				player:warp(7001, math.random(mats.black[1], mats.black[3]), math.random(mats.black[2], mats.black[4]))
			elseif (matChoice == 3) then
				player:warp(7001, math.random(mats.white[1], mats.white[3]), math.random(mats.white[2], mats.white[4]))
			elseif (matChoice == 4) then
				player:warp(7001, math.random(mats.blue[1], mats.blue[3]), math.random(mats.blue[2], mats.blue[4]))
			end
			
			player:removeLegendbyName("onslaughtParticipations")
			
			if (participations == 1) then
				player:addLegend("Participated in "..participations.." Onlsaught.", "onslaughtParticipations", 1, 16)
			else
				player:addLegend("Participated in "..participations.." Onlsaughts.", "onslaughtParticipations", 1, 16)
			end
			
			player.registry["arenaDyeSave"] = player.armorColor
			player.armorColor = 0
			player.registry["inCarnage"] = 1
			player.registry["onslaughtParticipations"] = participations
			player:flushDuration(1)
			player:flushAether(1)
			player.state = 0
			player.health = player.maxHealth
			player.magic = player.maxMagic
			player:sendStatus()
		else
			player:dialogSeq({npcGraphics, "Please come back when you have the money."}, 1)
			return
		end
	else
		player:dialogSeq({npcGraphics, "Very well then."}, 1)
	end
end),
}