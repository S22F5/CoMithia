game_colors = {
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0
	local menu
	local options = {}
	
	if (player.m == 7102) then--LIGHT
		options = {"Leave"}
		menu = player:menu("Welcome to Colors!", options)
		if (menu == 1) then
			menu = player:menu("Are you sure you want to leave?", options)
			if (menu == 1) then
				player:warp(46, 11, 11)
			end
		end
	end
end),
say = function(player, npc)
	local host = player.registry["colorsHost"]
	local speech = string.lower(player.speech)
	local players = npc:getObjectsInSameMap(BL_PC)
	local rand
	local xx
	local yy
	
	
	if (player.id ~= 391) then
		if (player.gmLevel < 1) then
			return
		end
	end
	local roll = math.random(1,4)
	if (speech == "start" or speech == "start!") then
		for i = 1, #players do
			players[i]:setTimer(2, 15)
		end
		npc.mapRegistry["start"] = 1
		npc.mapRegistry["startTime"] = os.time()
	
	elseif (speech == "sort" and npc.m == 7102) then
		if (#players > 0) then
			for i = 1, #players do
				if (players[i].registry["colorsHost"] ~= 250) then
					local warpX = {0,1,15,16}
					players[i]:warp(npc.m, warpX[math.random(#warpX)], math.random(2,12))
				end
			end
		end
	elseif (speech == "prepare" and npc.m == 7102) then
		if (#players > 0) then
			for i = 1, #players do
				rand = math.random(1, 8)
				if (players[i].registry["colorsHost"] ~= 250) then
					if (rand == 1) then
						xx = math.random(3, 6)
						yy = math.random(2, 5)
					elseif (rand == 2) then
						xx = math.random(7, 9)
						yy = math.random(2, 5)
					elseif (rand == 3) then
						xx = math.random(10, 13)
						yy = math.random(2, 5)
					elseif (rand == 4) then
						xx = math.random(3, 6)
						yy = math.random(6, 8)
					elseif (rand == 5) then
						xx = math.random(10, 13)
						yy = math.random(6, 8)
					elseif (rand == 6) then
						xx = math.random(3, 6)
						yy = math.random(9, 12)
					elseif (rand == 7) then
						xx = math.random(7, 9)
						yy = math.random(9, 12)
					elseif (rand == 8) then
						xx = math.random(10, 13)
						yy = math.random(9, 12)
					end
					players[i]:warp(npc.m, xx, yy)
				end
			end
		end
	elseif (speech == "host" and npc.m == 7102) then
		player:warp(npc.m, math.random(7, 9), math.random(6, 8))
		player.registry["colorsHost"] = 250
	elseif (speech == "stop" or speech == "stop!") then
		npc.mapRegistry["start"] = 0
		if (npc.m == 7102) then
			if (#players > 0) then
				for i = 1, #players do
					if (players[i].x >= 4 and players[i].x <= 20 and players[i].y >= 3 and players[i].y <= 19) then
						if (players[i].x == 12 and players[i].y == 11) then
							--host
						else
							players[i]:setDuration("sleep", 12000)
							players[i]:calcStat()
						end
					end
				end
			end
		end
	elseif (speech == "slow") then
		if (#players > 0) then
			for i = 1, #players do
				game_slow.cast(players[i])
			end
		end
	elseif (speech == "fast") then
		if (#players > 0) then
			for i = 1, #players do
				game_fast.cast(players[i])
			end
		end
	elseif (speech == "rules") then
		npc:talk(0, npc.name..": Colors takes skill, strategy and a little luck.")
		npc:talk(0, npc.name..": When the round starts, you will see a timer.")
		npc:talk(0, npc.name..": You MUST keep moving at all times!")
		npc:talk(0, npc.name..": I will say a color before the timer ends.")
		npc:talk(0, npc.name..": You must stand on a tile of that color, or you're out.")
	elseif (speech == "count") then
		npc:talk(0, npc.name..": "..#players)
	end
end,

colors = function(color, block)
	local brown = 14067
	local blue = 14068
	local green = 14069
	local yellow = 14070
	
	--local color = string.lower(color)
	local ret = false
	
	if (color == 1) then
		if (getTile(block.m, block.x, block.y) == 14067) then
			ret = true
		end
	elseif (color == 2) then
		if (getTile(block.m, block.x, block.y) == 14068) then
			ret = true
		end
	elseif (color == 3) then
		if (getTile(block.m, block.x, block.y) == 14069) then
			ret = true
		end
	elseif (color == 4) then
		if (getTile(block.m, block.x, block.y) == 14070) then
			ret = true
		end
	end
	
	return ret
end,

action = function(npc)
	local players = npc:getObjectsInSameMap(BL_PC)
	local xx
	local yy
	local colors = {"Brown", "Blue", "Green", "Yellow"}
	local randColor = math.random(1, #colors)
	if (npc.mapRegistry["color"] == 0) then
		npc.mapRegistry["color"] = randColor
	end
	local colorReg = npc.mapRegistry["color"]
	local color = colors[colorReg]
	
	if (npc.m == 7102) then
		if (npc.mapRegistry["start"] == 0) then
			--nothing awaiting orders
		elseif (npc.mapRegistry["start"] == 1) then
			if (npc.mapRegistry["startTime"] + 14 <= os.time()) then
				npc.mapRegistry["start"] = 2
			elseif (npc.mapRegistry["startTime"] + 13 <= os.time()) then
				npc:talk(1, "["..npc.name.."]: Color is... "..color)
			end
		elseif (npc.mapRegistry["start"] == 2) then
			if (#players > 0) then
				for i = 1, #players do
					players[i]:setDuration("sleep", 3000)
					players[i]:calcStat()
				end
			end
			npc.mapRegistry["start"] = 3
		elseif (npc.mapRegistry["start"] == 3) then
			npc.mapRegistry["start"] = 4
		elseif (npc.mapRegistry["start"] == 4) then
			if (#players > 0) then
				for i = 1, #players do
					xx = players[i].x
					yy = players[i].y
					if (xx >= 7 and xx <= 9 and yy >= 6 and yy <= 8) then
						--CENTER
					else
						if (xx >= 3 and xx <= 13 and yy >= 2 and yy <= 12) then
							if (xx%2 == 0 and yy%2 == 0) then--BLANK TILE
								players[i]:sendMinitext("You must stand on a color tile!")
								local warpX = {0,1,15,16}
								players[i]:warp(npc.m, warpX[math.random(#warpX)], math.random(2,12))
							elseif (game_colors.colors(colorReg, players[i]) == false) then
								players[i]:sendMinitext("Wrong color")
								local warpX = {0,1,15,16}
								players[i]:warp(npc.m, warpX[math.random(#warpX)], math.random(2,12))
							else
								players[i]:sendAction(10, 80)
							end
						end
					end
				end
			end
			npc.mapRegistry["color"] = 0
			npc.mapRegistry["start"] = 0
		end
	end
end
}
game_slow = {
cast = function(player)
	if (player:hasDuration("game_fast") == true) then
		player:flushDuration(0, 7032)
	end
	player:setDuration("game_slow", 5000)
	player:calcStat()
	player:refresh()
end,
recast = function(player)
	player.speed = 250
end,
while_cast = function(player)
	if (player.m ~= 7102) then
		player:flushDuration(0, 7031)
	end
	player:sendAnimation(34, 0)
end,
uncast = function(player)
	player:calcStat()
	player:refresh()
end
}
game_fast = {
cast = function(player)
	if (player:hasDuration("game_slow") == true) then
		player:flushDuration(0, 7031)
	end
	player:setDuration("game_fast", 5000)
	player:calcStat()
	player:refresh()
end,
recast = function(player)
	player.speed = 20
end,
while_cast = function(player)
	if (player.m ~= 7102) then
		player:flushDuration(0, 7032)
	end
	player:sendAnimation(34, 0)
end,
uncast = function(player)
	player:calcStat()
	player:refresh()
end
}