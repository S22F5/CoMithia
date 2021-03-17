game_foursquare = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0
	local menu
	local options = {}
	
	if (player.m ~= 7101) then
		options = {"Enter Foursquare", "Nevermind"}
		menu = player:menu("Would you like to enter foursquare?", options)
		if (menu == 1) then
			player:warp(7101, 12, 23)
		end
	elseif (player.m == 7101) then
		options = {"Leave"}
		menu = player:menu("Welcome to foursquare!", options)
		if (menu == 1) then
			menu = player:menu("Are you sure you want to leave?", options)
			if (menu == 1) then
				player:warp(46, 11, 11)
			end
		end
	end
end),
say = function(player, npc)
	local host = player.registry["fourSquareHost"]
	local speech = string.lower(player.speech)
	local players = npc:getObjectsInSameMap(BL_PC)
	
	if (player.id ~= 391) then
		if (player.gmLevel < 1) then
			return
		end
	end
	local roll = math.random(1,4)
	if (speech == "roll") then
		broadcast(player.m, "Host "..player.name.." rolled "..roll..".")
		if (#players > 0 and npc.m == 7101) then
			for i = 1, #players do
				if (game_foursquare.dice(roll, players[i]) == true and players[i].registry["fourSquareHost"] ~= 250) then
					players[i]:warp(npc.m, math.random(3, 21), math.random(22, 23))
				end
			end
		end
	elseif (speech == "sort" and npc.m == 7101) then
		if (#players > 0) then
			for i = 1, #players do
				if (players[i].registry["fourSquareHost"] ~= 250) then
					players[i]:warp(npc.m, math.random(3, 21), math.random(22, 23))
				end
			end
		end
	elseif (speech == "prepare" and npc.m == 7101) then
		if (#players > 0) then
			for i = 1, #players do
				if (players[i].registry["fourSquareHost"] ~= 250) then
					players[i]:warp(npc.m, 12, 15)
				end
			end
		end
	elseif (speech == "host" and npc.m == 7101) then
		player:warp(npc.m, 12, 11)
		player.registry["fourSquareHost"] = 250
	elseif (speech == "start" or speech == "start!") then
		npc.mapRegistry["dance"] = 1
	elseif (speech == "stop" or speech == "stop!") then
		npc.mapRegistry["dance"] = 0
		if (npc.m == 7101) then
			if (#players > 0) then
				for i = 1, #players do
					if (players[i].x >= 4 and players[i].x <= 20 and players[i].y >= 3 and players[i].y <= 19) then
						if (players[i].x == 12 and players[i].y == 11) then
							--host
						else
							players[i]:sendAction(22, 0)
							players[i]:setDuration("sleep", 5000)
							players[i]:calcStat()
						end
					end
				end
			end
		end
	elseif (string.sub(speech, 1, 5) == "kick ") then
		local kickedPlayer = Player(string.sub(speech, 6))
		
		if (kickedPlayer ~= nil) then
			if (kickedPlayer.m == npc.m) then
				kickedPlayer:warp(npc.m, math.random(3, 21), math.random(22, 23))
			end
		end
	end
end,

yell = function(player, npc)
	local host = player.registry["fourSquareHost"]
	local speech = string.lower(player.speech)
	local players = npc:getObjectsInSameMap(BL_PC)
	
	if (player.id ~= 391 or player.gmLevel == 0) then
		return
	end
	local roll = math.random(1,4)
	if (speech == "roll") then
		broadcast(player.m, "Host "..player.name.." rolled "..roll..".")
		if (#players > 0 and npc.m == 7101) then
			for i = 1, #players do
				if (game_foursquare.dice(roll, players[i]) == true and players[i].registry["fourSquareHost"] ~= 250) then
					players[i]:warp(npc.m, math.random(3, 21), math.random(22, 23))
				end
			end
		end
	elseif (speech == "sort" and npc.m == 7101) then
		if (#players > 0) then
			for i = 1, #players do
				if (players[i].registry["fourSquareHost"] ~= 250) then
					players[i]:warp(npc.m, math.random(3, 21), math.random(22, 23))
				end
			end
		end
	elseif (speech == "prepare" and npc.m == 7101) then
		if (#players > 0) then
			for i = 1, #players do
				if (players[i].registry["fourSquareHost"] ~= 250) then
					players[i]:warp(npc.m, 12, 15)
				end
			end
		end
	elseif (speech == "host" and npc.m == 7101) then
		player.registry["fourSquareHost"] = 250
		player:warp(npc.m, 12, 11)
	elseif ((speech == "start" or speech == "start!") and npc.m == 7101) then
		npc.mapRegistry["dance"] = 1
	elseif ((speech == "stop" or speech == "stop!") and npc.m == 7101) then
		npc.mapRegistry["dance"] = 0
		if (npc.m == 7101) then
			if (#players > 0) then
				for i = 1, #players do
					if (players[i].x >= 4 and players[i].x <= 20 and players[i].y >= 3 and players[i].y <= 19) then
						if (players[i].x == 12 and players[i].y == 11) then
							--host
						else
							players[i]:sendAction(22, 0)
							players[i]:setDuration("sleep", 5000)
							players[i]:calcStat()
						end
					end
				end
			end
		end
	elseif (string.sub(speech, 1, 5) == "kick ") then
		local kickedPlayer = Player(string.sub(speech, 6))
		
		if (kickedPlayer ~= nil) then
			kickedPlayer:warp(npc.m, math.random(3, 21), math.random(22, 23))
		end
	end
end,

dice = function(num, block)
	if (block.registry["fourSquareHost"] == 250) then
		return false
	end
	
	if (num == 1) then
		if (block.x >= 4 and block.x <= 11 and block.y <= 11 and block.y >= 3) then
			return true
		end
	elseif (num == 2) then
		if (block.x >= 12 and block.x <= 20 and block.y <= 10 and block.y >= 3) then
			return true
		end
	elseif (num == 3) then
		if (block.x >= 13 and block.x <= 20 and block.y <= 19 and block.y >= 11) then
			return true
		end
	elseif (num == 4) then
		if (block.x >= 4 and block.x <= 12 and block.y <= 19 and block.y >= 12) then
			return true
		end
	end
	return false
end,

action = function(npc)
	local players = npc:getObjectsInSameMap(BL_PC)
	
	if (npc.m == 7101) then
		if (npc.mapRegistry["dance"] == 1) then
			if (#players > 0) then
				for i = 1, #players do
					if (players[i].x >= 4 and players[i].x <= 20 and players[i].y >= 3 and players[i].y <= 19) then
						if (players[i].x == 12 and players[i].y == 11) then
							--host
						else
							players[i]:sendAction(22, 160)
						end
					end
				end
			end
		end
	end
end
}