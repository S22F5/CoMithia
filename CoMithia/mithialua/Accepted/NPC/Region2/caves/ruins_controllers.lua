
r2_ruins_cellar_leftstairs = {

	on_spawn = function(npc)
		npc.state = -1
		npc:updateState()
	end,
	
	setCloseTimer = function()
		NPC(120).duration = 60000
		NPC(120):talk(2,"Timer set: 60s")
	end,
	
	clearCloseTimer = function()
		NPC(120).duration = 0
		NPC(120):talk(2,"Timer set: 0")
	end,
	
	endAction = function(npc)
		setTile(90, 1, 13, 27910)
		setTile(90, 2, 13, 27910)
		setTile(90, 3, 13, 27910)
		setTile(90, 1, 14, 27910)
		setTile(90, 2, 14, 27910)
		setTile(90, 3, 14, 27910)
	end
}

r2_newruins_1stdoor = {	-- left side

	on_spawn = function(npc)
		npc.state = -1
		npc:updateState()
		npc.registry["action"] = 0
		r2_newruins_1stdoor.endAction(npc)
	end,
	
	openDoor = function()
		NPC(122).duration = 1200
		NPC(122).registry["action"] = 1
		NPC(123):talk(1,"The door at the left of the room rumbles open")
	end,
	
	closeDoor = function()
		NPC(122).duration = 1
		NPC(122).registry["action"] = 3
	end,
	
	endAction = function(npc)
		if(npc.registry["action"] == 1) then
			setObject(200,6,2,11763)
			setObject(200,7,2,11762)
			npc.duration = 1200
			npc.registry["action"] = 2
		elseif(npc.registry["action"] == 2) then
			setObject(200,6,2,6507)
			setObject(200,7,2,6507)
			setObject(200,5,2,11763)
			setObject(200,8,2,11762)
			--set timer for door closing
			npc.duration = 36000
			npc.registry["action"] = 3
		elseif(npc.registry["action"] == 3) then
			setObject(200,6,2,11763)
			setObject(200,7,2,11762)
			setObject(200,5,2,11739)
			setObject(200,8,2,11739)
			npc.duration = 1200
			npc.registry["action"] = 4
		elseif(npc.registry["action"] == 4) then
			setObject(200,6,2,11739)
			setObject(200,7,2,11739)
			npc.duration = 1200
			npc.registry["action"] = 0
		end
	end

}

r2_newruins_2nddoor = {	-- right side

	on_spawn = function(npc)
		npc.state = -1
		npc:updateState()
		npc.registry["action"] = 0
		r2_newruins_1stdoor.endAction(npc)
	end,
	
	openDoor = function()
		NPC(123).duration = 1200
		NPC(123).registry["action"] = 1
		NPC(123):talk(1,"The door at the right of the room rumbles open")
	end,
	
	closeDoor = function()
		NPC(122).duration = 1
		NPC(122).registry["action"] = 3
	end,
	
	endAction = function(npc)
		if(npc.registry["action"] == 1) then
			setObject(200,26,2,11763)
			setObject(200,27,2,11762)
			npc.duration = 1200
			npc.registry["action"] = 2
		elseif(npc.registry["action"] == 2) then
			setObject(200,26,2,6507)
			setObject(200,27,2,6507)
			setObject(200,25,2,11763)
			setObject(200,28,2,11762)
			--set timer for door closing
			npc.duration = 36000
			npc.registry["action"] = 3
		elseif(npc.registry["action"] == 3) then
			setObject(200,26,2,11763)
			setObject(200,27,2,11762)
			setObject(200,25,2,11739)
			setObject(200,28,2,11739)
			npc.duration = 1200
			npc.registry["action"] = 4
		elseif(npc.registry["action"] == 4) then
			setObject(200,26,2,11739)
			setObject(200,27,2,11739)
			npc.duration = 1200
			npc.registry["action"] = 0
		end
	end

}

r2_newruins_3rddoor = { --right side 

	on_spawn = function(npc)
		npc.state = -1
		npc:updateState()
		npc.registry["action"] = 0
		r2_newruins_1stdoor.endAction(npc)
	end,
	
	openDoor = function()
		NPC(124).duration = 1200
		NPC(124).registry["action"] = 1
		NPC(124):talk(1,"The sealed door rumbles open")
	end,
	
	closeDoor = function()
		NPC(124).duration = 1
		NPC(124).registry["action"] = 3
	end,
	
	endAction = function(npc)
		if(npc.registry["action"] == 1) then
			setObject(202,14,9,11763)
			setObject(202,15,9,11762)
			npc.duration = 1200
			npc.registry["action"] = 2
		elseif(npc.registry["action"] == 2) then
			setObject(202,14,9,6507)
			setObject(202,15,9,6507)
			setObject(202,13,9,11763)
			setObject(202,16,9,11762)
			--set timer for door closing
			npc.duration = 36000
			npc.registry["action"] = 3
		elseif(npc.registry["action"] == 3) then
			setObject(202,14,9,11763)
			setObject(202,15,9,11762)
			setObject(202,13,9,11739)
			setObject(202,16,9,11739)
			npc.duration = 1200
			npc.registry["action"] = 4
		elseif(npc.registry["action"] == 4) then
			setObject(202,14,9,11739)
			setObject(202,15,9,11739)
			npc.duration = 1200
			npc.registry["action"] = 0
		end
	end

}

r2_newruins_4thdoor = { --left side 

	on_spawn = function(npc)
		npc.state = -1
		npc:updateState()
		npc.registry["action"] = 0
		r2_newruins_1stdoor.endAction(npc)
	end,
	
	openDoor = function()
		NPC(125).duration = 1200
		NPC(125).registry["action"] = 1
		NPC(125):talk(1,"The sealed door rumbles open")
	end,
	
	closeDoor = function()
		NPC(125).duration = 1
		NPC(125).registry["action"] = 3
	end,
	
	endAction = function(npc)
		local m = 201
		local x = 14
		local y = 9
		if(npc.registry["action"] == 1) then
			setObject(m,x,y,11763)
			setObject(m,x+1,y,11762)
			npc.duration = 1200
			npc.registry["action"] = 2
		elseif(npc.registry["action"] == 2) then
			setObject(m,x,y,6507)
			setObject(m,x+1,y,6507)
			setObject(m,x-1,y,11763)
			setObject(m,x+2,y,11762)
			--set timer for door closing
			npc.duration = 36000
			npc.registry["action"] = 3
		elseif(npc.registry["action"] == 3) then
			setObject(m,x,y,11763)
			setObject(m,x+1,y,11762)
			setObject(m,x-1,y,11739)
			setObject(m,x+2,y,11739)
			npc.duration = 1200
			npc.registry["action"] = 4
		elseif(npc.registry["action"] == 4) then
			setObject(m,x,y,11739)
			setObject(m,x+1,y,11739)
			npc.duration = 1200
			npc.registry["action"] = 0
		end
	end

}

r2_newruins_5thdoor = { --center to ruins2

	on_spawn = function(npc)
		npc.state = -1
		npc:updateState()
		npc.registry["action"] = 0
		r2_newruins_1stdoor.endAction(npc)
	end,
	
	openDoor = function()
		local npcNum = 127
		NPC(npcNum).duration = 1200
		NPC(npcNum).registry["action"] = 1
		NPC(npcNum):talk(1,"The sealed door rumbles open")
	end,
	
	closeDoor = function()
		local npcNum = 127
		NPC(npcNum).duration = 1
		NPC(npcNum).registry["action"] = 3
	end,
	
	endAction = function(npc)
		local m = 205
		local x = 17
		local y = 2
		if(npc.registry["action"] == 1) then
			setObject(m,x,y,11763)
			setObject(m,x+1,y,11762)
			npc.duration = 1200
			npc.registry["action"] = 2
		elseif(npc.registry["action"] == 2) then
			setObject(m,x,y,6507)
			setObject(m,x+1,y,6507)
			setObject(m,x-1,y,11763)
			setObject(m,x+2,y,11762)
			--set timer for door closing
			npc.duration = 36000
			npc.registry["action"] = 3
		elseif(npc.registry["action"] == 3) then
			setObject(m,x,y,11763)
			setObject(m,x+1,y,11762)
			setObject(m,x-1,y,11739)
			setObject(m,x+2,y,11739)
			npc.duration = 1200
			npc.registry["action"] = 4
		elseif(npc.registry["action"] == 4) then
			setObject(m,x,y,11739)
			setObject(m,x+1,y,11739)
			npc.duration = 1200
			npc.registry["action"] = 0
		end
	end

}