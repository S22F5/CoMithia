chess_controller = {
move = function(mob)
	if (mob.side ~= 2) then
		mob.side = 2
		mob:sendSide()
	end
end,

click = async(function(player, mob)
	local t = {graphic = 0, color = 0}
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	local options = {"Start Game"}
	
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player.dialogType = 0
	
	if (player.gmLevel > 0) then
		table.insert(options, "White Player")
		table.insert(options, "Black Player")
	end
	
	if (#mobBlocks == 1) then
		local setting = player:menuString("What would you like to do?", options)
		
		if (setting == "White Player") then
			mob.registry["white_player"] = tonumber(player:input("Enter the white player's ID #"))
		elseif (setting == "Black Player") then
			mob.registry["black_player"] = tonumber(player:input("Enter the black player's ID #"))
		elseif (setting == "Start Game" and (player.gmLevel > 0 or mob.registry["white_player"] == player.ID or mob.registry["black_player"] == player.ID)) then
			for i = 0, 7 do
				mob:spawn(10000005, 4 + i, 6, 1)
				mob:spawn(10000011, 4 + i, 11, 1)
			end
			
			mob:spawn(10000000, 7, 5, 1)
			mob:spawn(10000001, 8, 5, 1)
			mob:spawn(10000002, 6, 5, 1)
			mob:spawn(10000002, 9, 5, 1)
			mob:spawn(10000003, 5, 5, 1)
			mob:spawn(10000003, 10, 5, 1)
			mob:spawn(10000004, 4, 5, 1)
			mob:spawn(10000004, 11, 5, 1)
			mob:spawn(10000006, 7, 12, 1)
			mob:spawn(10000007, 8, 12, 1)
			mob:spawn(10000008, 6, 12, 1)
			mob:spawn(10000008, 9, 12, 1)
			mob:spawn(10000009, 5, 12, 1)
			mob:spawn(10000009, 10, 12, 1)
			mob:spawn(10000010, 4, 12, 1)
			mob:spawn(10000010, 11, 12, 1)
			
			mobBlocks = mob:getObjectsInArea(BL_MOB)
			
			for i = 1, #mobBlocks do
				if (string.sub(mobBlocks[i].name, 1, 5) == "White") then
					mobBlocks[i].side = 2
					mobBlocks[i]:sendSide()
				end
			end
		end
	elseif (player.gmLevel > 0 or mob.registry["white_player"] == player.ID or mob.registry["black_player"] == player.ID) then
		options = {"Forfeit"}
		
		local setting = player:menuString("Do you wish to forfeit?", options)
		
		if (setting == "Forfeit") then
			if (player.gmLevel > 0 and mob.registry["white_player"] ~= player.ID and mob.registry["black_player"] ~= player.ID) then
				broadcast(mob.m, player.name.." forces both sides to retire.")
			elseif (mob.registry["turn_control"] == 0 and mob.registry["white_player"] == player.ID) then
				broadcast(mob.m, "White Forfeits. Black Wins!")
			elseif (mob.registry["turn_control"] == 1 and mob.registry["black_player"] == player.ID) then
				broadcast(mob.m, "Black Forfeits. White Wins!")
			else
				return
			end
			
			if (#mobBlocks > 1) then
				for i = 1, #mobBlocks do
					if (mobBlocks[i].ID ~= mob.ID) then
						mobBlocks[i]:delete()
					end
				end
			end
			
			mob.registry["turn_control"] = 0
			mob.registry["white_player"] = 0
			mob.registry["black_player"] = 0
		end
	end
end),

say = function(player, mob)
	local x
	local y
	local xPos
	local yPos
	local xDest
	local yDest
	local piece
	local enemyPiece
	local playerPiece
	local startX = 3
	local startY = 13
	local targetX = 3
	local targetY = 13
	local speech = string.lower(player.speech)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	
	if ((mob.registry["white_player"] ~= player.ID and mob.registry["turn_control"] == 0)
	or (mob.registry["black_player"] ~= player.ID and mob.registry["turn_control"] == 1)) then
		return
	end
	
	if (speech == "forfeit") then
		if (mob.registry["turn_control"] == 0 and mob.registry["white_player"] == player.ID) then
			broadcast(mob.m, "White Forfeits. Black Wins!")
		elseif (mob.registry["turn_control"] == 1 and mob.registry["black_player"] == player.ID) then
			broadcast(mob.m, "Black Forfeits. White Wins!")
		else
			return
		end
		
		if (#mobBlocks > 1) then
			for i = 1, #mobBlocks do
				if (mobBlocks[i].ID ~= mob.ID) then
					mobBlocks[i]:delete()
				end
			end
		end
		
		mob.registry["turn_control"] = 0
		mob.registry["white_player"] = 0
		mob.registry["black_player"] = 0
	end
	
	if (string.find(speech, "%a%d to %a%d") ~= nil and string.len(speech) == 8) then
		xPos = string.sub(speech, 1, 1)
		yPos = string.sub(speech, 2, 2)
		xDest = string.sub(speech, 7, 7)
		yDest = string.sub(speech, 8, 8)
		
		if (xPos == "a") then
			startX = startX + 1
		elseif (xPos == "b") then
			startX = startX + 2
		elseif (xPos == "c") then
			startX = startX + 3
		elseif (xPos == "d") then
			startX = startX + 4
		elseif (xPos == "e") then
			startX = startX + 5
		elseif (xPos == "f") then
			startX = startX + 6
		elseif (xPos == "g") then
			startX = startX + 7
		elseif (xPos == "h") then
			startX = startX + 8
		else
			broadcast(mob.m, "Invalid Move.")
			return
		end
		
		if (yPos == "1") then
			startY = startY - 1
		elseif (yPos == "2") then
			startY = startY - 2
		elseif (yPos == "3") then
			startY = startY - 3
		elseif (yPos == "4") then
			startY = startY - 4
		elseif (yPos == "5") then
			startY = startY - 5
		elseif (yPos == "6") then
			startY = startY - 6
		elseif (yPos == "7") then
			startY = startY - 7
		elseif (yPos == "8") then
			startY = startY - 8
		else
			broadcast(mob.m, "Invalid Move.")
			return
		end
		
		if (xDest == "a") then
			targetX = targetX + 1
		elseif (xDest == "b") then
			targetX = targetX + 2
		elseif (xDest == "c") then
			targetX = targetX + 3
		elseif (xDest == "d") then
			targetX = targetX + 4
		elseif (xDest == "e") then
			targetX = targetX + 5
		elseif (xDest == "f") then
			targetX = targetX + 6
		elseif (xDest == "g") then
			targetX = targetX + 7
		elseif (xDest == "h") then
			targetX = targetX + 8
		else
			broadcast(mob.m, "Invalid Move.")
			return
		end
		
		if (yDest == "1") then
			targetY = targetY - 1
		elseif (yDest == "2") then
			targetY = targetY - 2
		elseif (yDest == "3") then
			targetY = targetY - 3
		elseif (yDest == "4") then
			targetY = targetY - 4
		elseif (yDest == "5") then
			targetY = targetY - 5
		elseif (yDest == "6") then
			targetY = targetY - 6
		elseif (yDest == "7") then
			targetY = targetY - 7
		elseif (yDest == "8") then
			targetY = targetY - 8
		else
			broadcast(mob.m, "Invalid Move.")
			return
		end
		
		x = startX
		y = startY
		playerPiece = mob:getObjectsInCell(mob.m, startX, startY, BL_MOB)[1]
	
		if ((mob.registry["turn_control"] == 0 and string.sub(playerPiece.name, 1, 5) == "Black")
		or (mob.registry["turn_control"] == 1 and string.sub(playerPiece.name, 1, 5) == "White")) then
			broadcast(mob.m, "Invalid Move.")
			return
		end
		
		if (playerPiece ~= nil) then
			if (playerPiece.yname == "pawn") then
				enemyPiece = chess_controller.checkPawnMove(mob, playerPiece, startX, startY, targetX, targetY)
				
				if (enemyPiece ~= false) then
					playerPiece:warp(mob.m, targetX, targetY)
					
					if (enemyPiece ~= nil) then
						enemyPiece:delete()
					end
					
					if (mob.registry["turn_control"] == 1) then
						mob.registry["turn_control"] = 0
					else
						mob.registry["turn_control"] = 1
					end
				else
					broadcast(mob.m, "Invalid Move.")
					return
				end
			elseif (playerPiece.yname == "rook") then
				enemyPiece = chess_controller.checkRookMove(mob, playerPiece, startX, startY, targetX, targetY)
				
				if (enemyPiece ~= false) then
					playerPiece:warp(mob.m, targetX, targetY)
					
					if (enemyPiece ~= nil) then
						enemyPiece:delete()
					end
					
					if (mob.registry["turn_control"] == 1) then
						mob.registry["turn_control"] = 0
					else
						mob.registry["turn_control"] = 1
					end
				else
					broadcast(mob.m, "Invalid Move.")
					return
				end
			elseif (playerPiece.yname == "knight") then
				enemyPiece = chess_controller.checkKnightMove(mob, playerPiece, startX, startY, targetX, targetY)
				
				if (enemyPiece ~= false) then
					playerPiece:warp(mob.m, targetX, targetY)
					
					if (enemyPiece ~= nil) then
						enemyPiece:delete()
					end
					
					if (mob.registry["turn_control"] == 1) then
						mob.registry["turn_control"] = 0
					else
						mob.registry["turn_control"] = 1
					end
				else
					broadcast(mob.m, "Invalid Move.")
					return
				end
			elseif (playerPiece.yname == "bishop") then
				enemyPiece = chess_controller.checkBishopMove(mob, playerPiece, startX, startY, targetX, targetY)
				
				if (enemyPiece ~= false) then
					playerPiece:warp(mob.m, targetX, targetY)
					
					if (enemyPiece ~= nil) then
						enemyPiece:delete()
					end
					
					if (mob.registry["turn_control"] == 1) then
						mob.registry["turn_control"] = 0
					else
						mob.registry["turn_control"] = 1
					end
				else
					broadcast(mob.m, "Invalid Move.")
					return
				end
			elseif (playerPiece.yname == "queen") then
				enemyPiece = chess_controller.checkRookMove(mob, playerPiece, startX, startY, targetX, targetY)
				
				if (enemyPiece == false) then
					enemyPiece = chess_controller.checkBishopMove(mob, playerPiece, startX, startY, targetX, targetY)
				end
				
				if (enemyPiece ~= false) then
					playerPiece:warp(mob.m, targetX, targetY)
					
					if (enemyPiece ~= nil) then
						enemyPiece:delete()
					end
					
					if (mob.registry["turn_control"] == 1) then
						mob.registry["turn_control"] = 0
					else
						mob.registry["turn_control"] = 1
					end
				else
					broadcast(mob.m, "Invalid Move.")
					return
				end
			elseif (playerPiece.yname == "king") then
				enemyPiece = chess_controller.checkKingMove(mob, playerPiece, startX, startY, targetX, targetY)
				
				if (enemyPiece ~= false) then
					playerPiece:warp(mob.m, targetX, targetY)
					
					if (enemyPiece ~= nil) then
						enemyPiece:delete()
					end
					
					if (mob.registry["turn_control"] == 1) then
						mob.registry["turn_control"] = 0
					else
						mob.registry["turn_control"] = 1
					end
				else
					broadcast(mob.m, "Invalid Move.")
					return
				end
			end
		end
	end
end,

checkPawnMove = function(mob, playerPiece, startX, startY, targetX, targetY)
	local x = startX
	local y = startY
	local enemyPiece
	
	if (targetX == startX) then
		repeat
			if (mob.registry["turn_control"] == 0) then
				y = y + 1
			elseif (mob.registry["turn_control"] == 1) then
				y = y - 1
			end
			
			enemyPiece = mob:getObjectsInCell(mob.m, x, y, BL_MOB)[1]
		until (enemyPiece ~= nil or y == targetY)
	else
		enemyPiece = mob:getObjectsInCell(mob.m, targetX, targetY, BL_MOB)[1]
	end
	
	if (enemyPiece ~= nil and (enemyPiece.x ~= targetX or enemyPiece.y ~= targetY)) then
		return false
	end
	
	if ((mob.registry["turn_control"] == 0 and ((enemyPiece == nil and distanceXY(playerPiece, targetX, targetY) == 1 and targetY > startY)
	or (enemyPiece == nil and distanceXY(playerPiece, targetX, targetY) == 2 and targetY > startY and math.abs(targetY - startY) == 2 and startY == playerPiece.startY)
	or (enemyPiece ~= nil and string.sub(enemyPiece.name, 1, 5) == "Black" and targetX ~= startX and targetY > startY and math.abs(targetY - startY) == 1)))
	or (mob.registry["turn_control"] == 1 and ((enemyPiece == nil and distanceXY(playerPiece, targetX, targetY) == 1 and targetY < startY)
	or (enemyPiece == nil and distanceXY(playerPiece, targetX, targetY) == 2 and targetY < startY and math.abs(targetY - startY) == 2 and startY == playerPiece.startY)
	or (enemyPiece ~= nil and string.sub(enemyPiece.name, 1, 5) == "White" and targetX ~= startX and targetY < startY and math.abs(targetY - startY) == 1)))) then
		return enemyPiece
	else
		return false
	end
end,

checkRookMove = function(mob, playerPiece, startX, startY, targetX, targetY)
	local x = startX
	local y = startY
	local enemyPiece
	
	repeat
		if (targetX > startX and targetY == startY) then
			x = x + 1
		elseif (targetX < startX and targetY == startY) then
			x = x - 1
		elseif (targetY > startY and targetX == startX) then
			y = y + 1
		elseif (targetY < startY and targetX == startX) then
			y = y - 1
		end
		
		enemyPiece = mob:getObjectsInCell(mob.m, x, y, BL_MOB)[1]
	until (enemyPiece ~= nil or (y == targetY and x == startX) or (x == targetX and y == startY))
	
	if (enemyPiece ~= nil and (enemyPiece.x ~= targetX or enemyPiece.y ~= targetY)) then
		return false
	end
	
	if ((mob.registry["turn_control"] == 0 and ((targetX == startX and targetY ~= startY) or (targetY == startY and targetX ~= startX))
	and (enemyPiece == nil or (enemyPiece ~= nil and string.sub(enemyPiece.name, 1, 5) == "Black")))
	or (mob.registry["turn_control"] == 1 and ((targetX == startX and targetY ~= startY) or (targetY == startY and targetX ~= startX))
	and (enemyPiece == nil or (enemyPiece ~= nil and string.sub(enemyPiece.name, 1, 5) == "White")))) then
		return enemyPiece
	else
		return false
	end
end,

checkKnightMove = function(mob, playerPiece, startX, startY, targetX, targetY)
	local x = startX
	local y = startY
	local enemyPiece = mob:getObjectsInCell(mob.m, targetX, targetY, BL_MOB)[1]
	
	if ((mob.registry["turn_control"] == 0 and ((math.abs(targetX - startX) == 2 and math.abs(targetY - startY) == 1) or (math.abs(targetX - startX) == 1 and math.abs(targetY - startY) == 2))
	and (enemyPiece == nil or (enemyPiece ~= nil and string.sub(enemyPiece.name, 1, 5) == "Black")))
	or (mob.registry["turn_control"] == 1 and ((math.abs(targetX - startX) == 2 and math.abs(targetY - startY) == 1) or (math.abs(targetX - startX) == 1 and math.abs(targetY - startY) == 2))
	and (enemyPiece == nil or (enemyPiece ~= nil and string.sub(enemyPiece.name, 1, 5) == "White")))) then
		return enemyPiece
	else
		return false
	end
end,

checkBishopMove = function(mob, playerPiece, startX, startY, targetX, targetY)
	local x = startX
	local y = startY
	local enemyPiece
	
	if (getAngleXY(playerPiece, targetX, targetY) ~= 45 and getAngleXY(playerPiece, targetX, targetY) ~= 135
	and  getAngleXY(playerPiece, targetX, targetY) ~= 225 and getAngleXY(playerPiece, targetX, targetY) ~= 315) then
		return false
	end
	
	repeat
		if (targetX > startX and targetY > startY) then
			x = x + 1
			y = y + 1
		elseif (targetX > startX and targetY < startY) then
			x = x + 1
			y = y - 1
		elseif (targetX < startX and targetY > startY) then
			x = x - 1
			y = y + 1
		elseif (targetX < startX and targetY < startY) then
			x = x - 1
			y = y - 1
		end
		
		enemyPiece = mob:getObjectsInCell(mob.m, x, y, BL_MOB)[1]
	until (enemyPiece ~= nil or (x == targetX and y == targetY))
	
	if (enemyPiece ~= nil and (enemyPiece.x ~= targetX or enemyPiece.y ~= targetY)) then
		return false
	end
	
	if ((mob.registry["turn_control"] == 0 and ((getAngleXY(playerPiece, targetX, targetY) == 45 or getAngleXY(playerPiece, targetX, targetY) == 135
	or getAngleXY(playerPiece, targetX, targetY) == 225 or getAngleXY(playerPiece, targetX, targetY) == 315)) and (enemyPiece == nil or (enemyPiece ~= nil and string.sub(enemyPiece.name, 1, 5) == "Black")))
	or (mob.registry["turn_control"] == 1 and ((getAngleXY(playerPiece, targetX, targetY) == 45 or getAngleXY(playerPiece, targetX, targetY) == 135
	or getAngleXY(playerPiece, targetX, targetY) == 225 or getAngleXY(playerPiece, targetX, targetY) == 315)) and (enemyPiece == nil or (enemyPiece ~= nil and string.sub(enemyPiece.name, 1, 5) == "White")))) then
		return enemyPiece
	else
		return false
	end 
end,

checkKingMove = function(mob, playerPiece, startX, startY, targetX, targetY)
	local x = startX
	local y = startY
	local enemyPiece = mob:getObjectsInCell(mob.m, targetX, targetY, BL_MOB)[1]
	
	if (distanceSquareXY(playerPiece, targetX, targetY, 1) == false) then
		return false
	end
	
	if ((mob.registry["turn_control"] == 0 and (enemyPiece == nil or (enemyPiece ~= nil and string.sub(enemyPiece.name, 1, 5) == "Black")))
	or (mob.registry["turn_control"] == 1 and (enemyPiece == nil or (enemyPiece ~= nil and string.sub(enemyPiece.name, 1, 5) == "White")))) then
		return enemyPiece
	else
		return false
	end
end
}