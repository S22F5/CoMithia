r2_c_arena = {
say = function(player, npc)
	local speech = string.lower(player.speech)
	local players = npc:getObjectsInSameMap(BL_PC)
	local arenaKeeper = NPC(148)
	local redWins = arenaKeeper.registry["redWins"]
	local blackWins = arenaKeeper.registry["blackWins"]
	local whiteWins = arenaKeeper.registry["whiteWins"]
	local blueWins = arenaKeeper.registry["blueWins"]
	
	if ((string.find(speech, "(.*)pause(.*)")) and (player.gmLevel >= 50 or player.registry["arenaHost"] == 250)) then
		player.pvp = 0
	elseif ((string.find(speech, "(.*)resume(.*)")) and (player.gmLevel >= 50 or player.registry["arenaHost"] == 250)) then
		player.pvp = 1
	elseif ((string.find(speech, "(.*)stop(.*)")) and (player.gmLevel >= 50 or player.registry["arenaHost"] == 250) and #players > 0) then
		local redCount = 0
		local blackCount = 0
		local whiteCount = 0
		local blueCount = 0
		local winner = {}
		local eventWinner = {}
		local comparison = function(a, b)
			return a > b
		end
		
		for i = 1, #players do
			if (players[i].state == 0) then
				if (players[i].armorColor == 60) then
					blackCount = blackCount + 1
				elseif (players[i].armorColor == 61) then
					whiteCount = whiteCount + 1
				elseif (players[i].armorColor == 63) then
					redCount = redCount + 1
				elseif (players[i].armorColor == 65) then
					blueCount = blueCount + 1
				end
			end
		end
		
		table.insert(winner, redCount)
		table.insert(winner, blackCount)
		table.insert(winner, whiteCount)
		table.insert(winner, blueCount)
		table.sort(winner, comparison)
		
		if (winner[1] == redCount) then
			arenaKeeper.registry["redWins"] = redWins + 1
			redWins = redWins + 1
		end
		
		if (winner[1] == blackCount) then
			arenaKeeper.registry["blackWins"] = blackWins + 1
			blackWins = blackWins + 1
		end
		
		if (winner[1] == whiteCount) then
			arenaKeeper.registry["whiteWins"] = whiteWins + 1
			whiteWins = whiteWins + 1
		end
		
		if (winner[1] == blueCount) then
			arenaKeeper.registry["blueWins"] = blueWins + 1
			blueWins = blueWins + 1
		end
		
		if (arenaKeeper.registry["roundCount"] == 0) then
			table.insert(eventWinner, redWins)
			table.insert(eventWinner, blackWins)
			table.insert(eventWinner, whiteWins)
			table.insert(eventWinner, blueWins)
			table.sort(eventWinner, comparison)
			
			if (eventWinner[1] == redWins) then
				arenaKeeper.registry["winner"] = 63
			elseif (eventWinner[1] == blackWins) then
				arenaKeeper.registry["winner"] = 60
			elseif (eventWinner[1] == whiteWins) then
				arenaKeeper.registry["winner"] = 61
			elseif (eventWinner[1] == blueWins) then
				arenaKeeper.registry["winner"] = 65
			end
		end
		
		for i = 1, #players do
			local mats = {red = {6, 8, 18, 20}, black = {6, 24, 18, 36}, white = {22, 8, 34, 20}, blue = {22, 24, 34, 36}}
			
			if (players[i].armorColor == 63) then
				players[i]:warp(7001, math.random(mats.red[1], mats.red[3]), math.random(mats.red[2], mats.red[4]))
			elseif (players[i].armorColor == 60) then
				players[i]:warp(7001, math.random(mats.black[1], mats.black[3]), math.random(mats.black[2], mats.black[4]))
			elseif (players[i].armorColor == 61) then
				players[i]:warp(7001, math.random(mats.white[1], mats.white[3]), math.random(mats.white[2], mats.white[4]))
			elseif (players[i].armorColor == 65) then
				players[i]:warp(7001, math.random(mats.blue[1], mats.blue[3]), math.random(mats.blue[2], mats.blue[4]))
			end
			
			players[i]:flushDuration(1)
			players[i]:flushAether(1)
			players[i].state = 0
			players[i].health = players[i].maxHealth
			players[i].magic = players[i].maxMagic
			players[i]:updateState()
			players[i]:sendStatus()
		end
		
		npc:delete()
	elseif ((string.find(speech, "(.*)start(.*)")) and (player.gmLevel >= 50 or player.registry["arenaHost"] == 250) and #players > 0) then
		for i = 1, #players do
			players[i]:setTimer(2, 180)
		end
		
		npc.registry["roundStart"] = os.time() + 180
		broadcast(npc.m, "Round starting in 3 minutes.")
	end
end,

action = function(npc)
	if (npc.registry["roundStart"] > 0 and npc.registry["roundStart"] <= os.time()) then
		setPass(npc.m, 1, 25, 0)
		setPass(npc.m, 2, 25, 0)
		setPass(npc.m, 3, 25, 0)
		setPass(npc.m, 4, 25, 0)
		setPass(npc.m, 6, 25, 0)
		setPass(npc.m, 7, 25, 0)
		setPass(npc.m, 8, 25, 0)
		setPass(npc.m, 9, 26, 0)
		setPass(npc.m, 9, 27, 0)
		setPass(npc.m, 9, 28, 0)
		setPass(npc.m, 9, 29, 0)
		setPass(npc.m, 9, 30, 0)
		setPass(npc.m, 9, 31, 0)
		setPass(npc.m, 9, 32, 0)
		setPass(npc.m, 9, 33, 0)
		
		setPass(npc.m, 29, 9, 0)
		setPass(npc.m, 28, 9, 0)
		setPass(npc.m, 27, 9, 0)
		setPass(npc.m, 26, 9, 0)
		setPass(npc.m, 25, 9, 0)
		setPass(npc.m, 24, 9, 0)
		setPass(npc.m, 23, 9, 0)
		setPass(npc.m, 22, 9, 0)
		setPass(npc.m, 21, 8, 0)
		setPass(npc.m, 21, 7, 0)
		setPass(npc.m, 21, 6, 0)
		setPass(npc.m, 21, 5, 0)
		setPass(npc.m, 21, 4, 0)
		setPass(npc.m, 21, 3, 0)
		setPass(npc.m, 21, 2, 0)
		setPass(npc.m, 21, 1, 0)
		
		setPass(npc.m, 1, 9, 0)
		setPass(npc.m, 2, 9, 0)
		setPass(npc.m, 3, 9, 0)
		setPass(npc.m, 4, 9, 0)
		setPass(npc.m, 5, 9, 0)
		setPass(npc.m, 6, 9, 0)
		setPass(npc.m, 7, 9, 0)
		setPass(npc.m, 8, 9, 0)
		setPass(npc.m, 9, 8, 0)
		setPass(npc.m, 9, 7, 0)
		setPass(npc.m, 9, 6, 0)
		setPass(npc.m, 9, 5, 0)
		setPass(npc.m, 9, 4, 0)
		setPass(npc.m, 9, 3, 0)
		setPass(npc.m, 9, 2, 0)
		setPass(npc.m, 9, 1, 0)
		
		setPass(npc.m, 22, 25, 0)
		setPass(npc.m, 23, 25, 0)
		setPass(npc.m, 24, 25, 0)
		setPass(npc.m, 25, 25, 0)
		setPass(npc.m, 26, 25, 0)
		setPass(npc.m, 27, 25, 0)
		setPass(npc.m, 28, 25, 0)
		setPass(npc.m, 29, 25, 0)
		setPass(npc.m, 21, 26, 0)
		setPass(npc.m, 21, 27, 0)
		setPass(npc.m, 21, 28, 0)
		setPass(npc.m, 21, 29, 0)
		setPass(npc.m, 21, 30, 0)
		setPass(npc.m, 21, 31, 0)
		setPass(npc.m, 21, 32, 0)
		setPass(npc.m, 21, 33, 0)
		
		npc.registry["roundStart"] = 0
	elseif (npc.registry["roundStart"] > 0 and npc.registry["roundStart"] > os.time()) then
		setPass(npc.m, 1, 25, 1)
		setPass(npc.m, 2, 25, 1)
		setPass(npc.m, 3, 25, 1)
		setPass(npc.m, 4, 25, 1)
		setPass(npc.m, 6, 25, 1)
		setPass(npc.m, 7, 25, 1)
		setPass(npc.m, 8, 25, 1)
		setPass(npc.m, 9, 26, 1)
		setPass(npc.m, 9, 27, 1)
		setPass(npc.m, 9, 28, 1)
		setPass(npc.m, 9, 29, 1)
		setPass(npc.m, 9, 30, 1)
		setPass(npc.m, 9, 31, 1)
		setPass(npc.m, 9, 32, 1)
		setPass(npc.m, 9, 33, 1)
		
		setPass(npc.m, 29, 9, 1)
		setPass(npc.m, 28, 9, 1)
		setPass(npc.m, 27, 9, 1)
		setPass(npc.m, 26, 9, 1)
		setPass(npc.m, 25, 9, 1)
		setPass(npc.m, 24, 9, 1)
		setPass(npc.m, 23, 9, 1)
		setPass(npc.m, 22, 9, 1)
		setPass(npc.m, 21, 8, 1)
		setPass(npc.m, 21, 7, 1)
		setPass(npc.m, 21, 6, 1)
		setPass(npc.m, 21, 5, 1)
		setPass(npc.m, 21, 4, 1)
		setPass(npc.m, 21, 3, 1)
		setPass(npc.m, 21, 2, 1)
		setPass(npc.m, 21, 1, 1)
		
		setPass(npc.m, 1, 9, 1)
		setPass(npc.m, 2, 9, 1)
		setPass(npc.m, 3, 9, 1)
		setPass(npc.m, 4, 9, 1)
		setPass(npc.m, 5, 9, 1)
		setPass(npc.m, 6, 9, 1)
		setPass(npc.m, 7, 9, 1)
		setPass(npc.m, 8, 9, 1)
		setPass(npc.m, 9, 8, 1)
		setPass(npc.m, 9, 7, 1)
		setPass(npc.m, 9, 6, 1)
		setPass(npc.m, 9, 5, 1)
		setPass(npc.m, 9, 4, 1)
		setPass(npc.m, 9, 3, 1)
		setPass(npc.m, 9, 2, 1)
		setPass(npc.m, 9, 1, 1)
		
		setPass(npc.m, 22, 25, 1)
		setPass(npc.m, 23, 25, 1)
		setPass(npc.m, 24, 25, 1)
		setPass(npc.m, 25, 25, 1)
		setPass(npc.m, 26, 25, 1)
		setPass(npc.m, 27, 25, 1)
		setPass(npc.m, 28, 25, 1)
		setPass(npc.m, 29, 25, 1)
		setPass(npc.m, 21, 26, 1)
		setPass(npc.m, 21, 27, 1)
		setPass(npc.m, 21, 28, 1)
		setPass(npc.m, 21, 29, 1)
		setPass(npc.m, 21, 30, 1)
		setPass(npc.m, 21, 31, 1)
		setPass(npc.m, 21, 32, 1)
		setPass(npc.m, 21, 33, 1)
	end
end
}