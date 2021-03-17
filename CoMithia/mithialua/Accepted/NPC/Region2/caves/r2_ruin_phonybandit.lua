phony_bandit = {

click = function(player,npc)
	
	npc:talk(0,"Yes! This is it, lets give it a shot!")
	npc.registry["action"] = 1
end,

action = function (npc, player)

	--Action 0, wander around
	if(npc.registry["action"] == 0) then
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
		if(math.random(0,50) == 1) then
			npc:talk(2,"psssstt... over here...")
		end
		
		npc:sendSide()
		
		if (math.random(0,4) == 0) then
			npc:move()
		end
	--Action 1, move to wall
	elseif(npc.registry["action"] == 1) then
		toXY(npc,1,7)
		if(npc.x == 1 and npc.y == 7) then
			npc.duration = 1200
			npc.registry["action"] = 2
		end
	elseif(npc.registry["action"] == 6) then
		toXY(npc, 6, 5)
		if(npc.x == 6 and npc.y == 5) then
			npc:talk(0,"Please let me know if there is anything else I can do to help!")
			npc.side = 2
			npc:sendSide()
			npc.registry["action"] = 7
		end
	end	
	
end,

endAction = function(npc)
	local spellg = 332
	if(npc.registry["action"] == 2) then
		npc:talk(1,"*Turns the key in within a hidden keyhole*")
		npc.duration = 1200
		npc.registry["action"] = 3
	elseif(npc.registry["action"] == 3) then
		npc:talk(2,"*Click!*")
		npc:sendAnimationXY(spellg,7,7,1)
		npc:sendAnimationXY(spellg,8,7,1)
		npc:sendAnimationXY(spellg,9,7,1)
		setTile(npc.m,7,6,1779)
		setTile(npc.m,8,6,1780)
		setTile(npc.m,9,6,1781)
		setTile(npc.m,7,7,1782)
		setTile(npc.m,8,7,1783)
		setTile(npc.m,9,7,1784)
		npc.duration = 600
		npc.registry["action"] = 4
	elseif(npc.registry["action"] == 4) then
		npc:sendAction(10,70)
		npc.duration = 600
		npc.registry["action"] = 5
	elseif(npc.registry["action"] == 5) then
		npc.registry["action"] = 6
	end
end
}