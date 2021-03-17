bomber_bomb = {
cast = function(player)
	local npc = player:getObjectsInCell(player.m, player.x, player.y, BL_NPC)
	
	if (#npc > 0) then
		return
	end
	
	if (player.registry["bomber_count"] > 0) then
		player:addNPC("bomber_bomb", player.m, player.x, player.y, 500, 4000, player.ID)
		npc = player:getObjectsInCell(player.m, player.x, player.y, BL_NPC)[1]
		npc.subType = 0
		player.registry["bomber_count"] = player.registry["bomber_count"] - 1
		player:sendAction(6,10)
	else
		player:sendMinitext("You ran out of bombs.")
	end
end,

action = function(npc)
	npc:sendAnimationXY(19, npc.x, npc.y, 0)
end,

endAction = function(npc, player)
	local range = player.registry["bomber_range"]
	local mobBlocks
	local pcBlocks
	local pass
	local var
	
	if (range >= 1) then
		for i = 1, range do
			var = npc.y - i
			
			if (var < 0) then
				break
			end
			
			pass = getPass(npc.m, npc.x, var)
			mobBlocks = npc:getObjectsInCell(npc.m, npc.x, var, BL_MOB)
			
			if (pass == 1) then
				break
			end
			
			npc:sendAnimationXY(46, npc.x, var)
			pcBlocks = npc:getObjectsInCell(npc.m, npc.x, var, BL_PC)
			
			if (#pcBlocks > 0) then
				if (pcBlocks[1].state == 0) then
					pcBlocks[1]:die()
					broadcast(npc.m, pcBlocks[1].name.." has been killed by "..player.name..".")
				end
			end
			
			if (#mobBlocks > 0) then
				mobBlocks[1]:delete()
				break
			end
		end
		
		for i = 1, range do
			var = npc.x + i
			
			if (var > npc.xmax + 1) then
				break
			end
			
			pass = getPass(npc.m, var, npc.y)
			mobBlocks = npc:getObjectsInCell(npc.m, var, npc.y, BL_MOB)
			
			if (pass == 1) then
				break
			end
			
			npc:sendAnimationXY(46, var, npc.y)
			pcBlocks = npc:getObjectsInCell(npc.m, var, npc.y, BL_PC)
			
			if (#pcBlocks > 0) then
				if (pcBlocks[1].state == 0) then
					pcBlocks[1]:die()
					broadcast(npc.m, pcBlocks[1].name.." has been killed by "..player.name..".")
				end
			end
			
			if (#mobBlocks > 0) then
				mobBlocks[1]:delete()
				break
			end
		end
		
		for i = 1, range do
			var = npc.y + i
			
			if (var > npc.ymax + 1) then
				break
			end
			
			pass = getPass(npc.m, npc.x, var)
			mobBlocks = npc:getObjectsInCell(npc.m, npc.x, var, BL_MOB)
			
			if (pass == 1) then
				break
			end
			
			npc:sendAnimationXY(46, npc.x, var)
			pcBlocks = npc:getObjectsInCell(npc.m, npc.x, var, BL_PC)
			
			if (#pcBlocks > 0) then
				if (pcBlocks[1].state == 0) then
					pcBlocks[1]:die()
					broadcast(npc.m, pcBlocks[1].name.." has been killed by "..player.name..".")
				end
			end
			
			if (#mobBlocks > 0) then
				mobBlocks[1]:delete()
				break
			end
		end
		
		for i = 1, range do
			var = npc.x - i
			
			if (var < 0) then
				break
			end
			
			pass = getPass(npc.m, var, npc.y)
			mobBlocks = npc:getObjectsInCell(npc.m, var, npc.y, BL_MOB)
			
			if (pass == 1) then
				break
			end
			
			npc:sendAnimationXY(46, var, npc.y)
			pcBlocks = npc:getObjectsInCell(npc.m, var, npc.y, BL_PC)
			
			if (#pcBlocks > 0) then
				if (pcBlocks[1].state == 0) then
					pcBlocks[1]:die()
					broadcast(npc.m, pcBlocks[1].name.." has been killed by "..player.name..".")
				end
			end
			
			if (#mobBlocks > 0) then
				mobBlocks[1]:delete()
				break
			end
		end
	end

	player.registry["bomber_count"] = player.registry["bomber_count"] + 1
	npc:delete()
end
}