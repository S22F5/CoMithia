r2_c_archer = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,
	
move = function(mob, target)
	local m = mob.m
	local x = mob.x
	local y = mob.y
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		mob.paralyzed = false
		mob.sleep = 1
	end
	
	if (math.abs(mob.x - mob.startX) >= 15 or math.abs(mob.y - mob.startY) >= 15) then
		mob:warp(mob.startM, mob.startX, mob.startY)
	end
	
	if (m == 40 and x == 65 and y == 17) then--N Gate Archer
		if (math.random(10) == 1 and mob.mapRegistry["r2_c_archer_n_gate"] + 90 < os.time()) then
			mob.mapRegistry["r2_c_archer_n_gate"] = os.time() + 45
			mob.side = 2
			mob:sendSide()
			if (math.random(20) < 4) then
				mob:talk(0,""..mob.name..": Time for a break.")
			end
		end
		if (mob.mapRegistry["r2_c_archer_n_gate"] >= os.time()) then--REST or ACTIVE?
			--RESTING
			
		else--ACTIVE
			--SIDE
			if (math.random(100) > 30) then
				if (mob.side ~= 0) then
					mob.side = 0
					mob:sendSide()
				end
			else
				if (mob.side ~= 1) then
					mob.side = 1
					mob:sendSide()
				end
			end
			--ACTION
			if (mob.side == 0) then
				mob:throw(65, 11, 6, 17, 3)
				mob:sendAction(1, 20)
				--mob:sendAnimationXY(302, 65, 11)
			elseif (mob.side == 1) then
				local tar = mob:getObjectsInCell(40, 72, 17, BL_MOB)
				if (#tar > 0) then
					if (tar[1].mobID == 100) then
						mob:throw(72, 17, 7, 17, 3)
						mob:sendAction(1, 20)
						tar[1]:removeHealth(math.random(2500,5000))
					end
				end
			end
			return
		end
	else
		toStart(mob, mob.startX, mob.startY)
	end
end,

attack=function(mob, target)
	local direction = ""
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		mob.paralyzed = false
		mob.sleep = 1
	end
	
	if (target.ID == mob.ID and (mob.attacker == 0 or mob.attacker == mob.ID)) then
		mob.target = 0
		mob.attacker = 0
		mob.state = MOB_ALIVE
		return
	elseif (target.ID == mob.ID and mob.attacker > 0 and mob.attacker ~= mob.ID) then
		mob.target = mob.attacker
		target = mob:getBlock(mob.attacker)
	end
	--[[if (m == 40) and (x == 65) and (y == 17) and (mob.side == 0) then--N Gate Archer
		mob:throw(65, 11, 6, 17, 3)--, [num]action) --throws (no flooritem) to specified x/y with icon, color and action
		--throw([int]id, [num]map, [num]startx, [num]starty, [num]endx, [num]endy, icon, color, action) --throws item i guess? not sure
		return
	end]]--
	direction = getDirection(mob, target)
	
	if (direction == "north" or direction == "north east") then
		direction = 0
	elseif (direction == "east" or direction == "south east") then
		direction = 1
	elseif (direction == "south" or direction == "south west") then
		direction = 2
	else
		direction = 3
	end
	
	if (distance(mob, target) <= 10 and mob.side == direction) then
		mob:throw(target.x, target.y, (6 + mob.side), 17, 3)
		mob_ai_basic.attack(mob, target)
	elseif (distance(mob, target) <= 10 and mob.side ~= direction) then
		mob.side = direction
		mob:sendSide()
	else
		mob.target = 0
		mob.attacker = 0
		mob.state = MOB_ALIVE
	end
end
}
