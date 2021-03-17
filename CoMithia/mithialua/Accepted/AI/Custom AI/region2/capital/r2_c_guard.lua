r2_c_guard = {
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

--[[Knight Quest Callmob click?
	if (m == 40) then
		local blockPC = {}
		blockPC = mob:getObjectsInArea(BL_PC)
		if (#blockPC > 0) then
			for i = 1, #blockPC do
				if (blockPC[i].coRef == 0 and distance(mob, blockPC[i]) <= 3) then
					gP.r2_c_guard(blockPC[i], mob, blockPC[i].quest["greatProtector"])
				end
			end
		end
	end
Knight Quest Call]]--
	
	local area = {}
	local msgMoving = {"-Whistles a tune-",
	"Stay safe!",
	"STOP RIGHT THERE CRIMINAL SCUM!",
	"Where'd that thief go? Damn!",
	"-Looks around with narrowed eyes-"}
	local msgGuard = {"Hello mate!", "-Nods-"}
	local msgStationary = {"Boy, it's hot out.",
	"Sure wish I could sit down for a second."}
	local msgStandard = ""..mob.name..": "
	
	local tile, hSide, tempTile, found, ally, i, j


	if (mob.paralyzed or mob.sleep ~= 1) then
		mob.paralyzed = false
		mob.sleep = 1
	end
	
	if (m == 40) then--Guard IN the city
		if (distanceXY(mob, 23, 60) <= 13) or (distanceXY(mob, 130, 43) <= 13) then--West and East Taverns
			table.insert(msgStationary, "Sure could go for a drink...")
		end
		if (distanceXY(mob, 132, 64) <= 15) then
			table.insert(msgStationary, "Wonder what's for sale today.")
		end
		
		for i = -5, 5 do
			for j = -5, 5 do
				if (getTile(mob.m, mob.x + i, mob.y + j) == 17796) then
					table.insert(msgMoving, "Hey!, Don't run so close to the river, okay? I can't swim in this armor to save you.")
					table.insert(msgStationary, "Hey!, Don't run so close to the river, okay? I can't swim in this armor to save you.")
					break
				end
			end
		end


		if (math.random(37) == 1) and (mob.registry["r2_c_guard"] + 90 < os.time()) then
			mob.registry["r2_c_guard"] = os.time() + 45
			mob.side = 2
			mob:sendSide()
			if (math.random(30) < 4) then
				mob:talk(0,""..mob.name..": Time for a break.")
			end
		end
		if (mob.registry["r2_c_guard"] >= os.time()) then--REST or ACTIVE?
			--RESTING
			if (math.random(126) == 1) and (mob.registry["r2_c_guard_talk_timer"] <= os.time()) then
				mob:talk(0,""..msgStandard..""..msgStationary[math.random(#msgStationary)])
				mob.registry["r2_c_guard_talk_timer"] = os.time() + 25
			end
		else--ACTIVE
			if (mob.registry["r2_c_guard_ret"] + 18 <= os.time()) and (mob.returning == true) then
				mob:sendAnimationXY(3, mob.x, mob.y)
				mob:warp(mob.startM, mob.startX, mob.startY)
				mob.returning = false
			end
			if (distanceXY(mob, mob.startX, mob.startY) >= 48) or
			(r2_c_guard.walkable(getTileFacing(mob)) == 0) then
				mob.returning = true
				mob.registry["r2_c_guard_ret"] = os.time()
			elseif (mob.returning == true) and (distanceXY(mob, mob.startX, mob.startY) <= 31) then
				mob.returning = false
			end
			
			if (mob.returning == true) then
				toStart(mob, mob.startX, mob.startY)
			end
			
			area = mob:getObjectsInArea(BL_MOB)
			
			if (#area > 0) then
				for i = 1, #area do
					if (area[i].mobID == 58) and (area[i].id ~= mob.id) then
						ally = area[i]
						break
					end
				end
				if (math.random(3) == 1) and (ally.id ~= mob.id) and (distance(mob, ally) <= 2) and (mob.registry["r2_c_guard_talk_timer"] <= os.time()) then
					mob:talk(0, ""..msgStandard..""..msgGuard[math.random(#msgGuard)])
					mob.registry["r2_c_guard_talk_timer"] = os.time() + 25
				end
			end
			
			--SIDE
			if (getObjFacing(mob) ~= 0) then
				hSide = getHalfSide(mob)
				if (#hSide > 0) then
					tile = getTileFacing(mob)
					if (math.random(2) == 1) then
						tSide = hSide[1]
						tempTile = getTileFacing(mob, tSide)
					else
						tSide = hSide[3]
						tempTile = getTileFacing(mob, tSide)
					end
					if (r2_c_guard.walkable(tempTile) >= r2_c_guard.walkable(tile)) then
						mob.side = tSide
						mob:sendSide()
					end
				end
			elseif (r2_c_guard.walkable(getTileFacing(mob)) ~= 2) then
				hSide = getHalfSide(mob)
				if (#hSide > 0) then
					tile = getTileFacing(mob)
					if (math.random(2) == 1) then
						tSide = hSide[1]
						tempTile = getTileFacing(mob, tSide)
					else
						tSide = hSide[3]
						tempTile = getTileFacing(mob, tSide)
					end
					if (r2_c_guard.walkable(tempTile) >= r2_c_guard.walkable(tile)) then
						mob.side = tSide
						mob:sendSide()
					end
				end
			else
				if (math.random(100) > 85) then
					hSide = getHalfSide(mob)
					if (#hSide > 0) then
						tile = getTileFacing(mob)
						if (math.random(100) > 15) then
							if (math.random(2) == 1) then
								tSide = hSide[1]
								tempTile = getTileFacing(mob, tSide)
							else
								tSide = hSide[3]
								tempTile = getTileFacing(mob, tSide)
							end
							if (r2_c_guard.walkable(tempTile) >= r2_c_guard.walkable(tile)) then
								mob.side = tSide
								mob:sendSide()
							end
						else
							--mob:talk(2, "straight 1")
							--straight
						end
					end
				else
					--mob:talk(2, "straight 2")
				end
			--obj in the way
			end
			--ACTION
			if (math.random(168) == 1) and (mob.registry["r2_c_guard_talk_timer"] <= os.time()) then
				mob:talk(0, ""..msgStandard..""..msgMoving[math.random(#msgMoving)])
				mob.registry["r2_c_guard_talk_timer"] = os.time() + 120
			end
			if (r2_c_guard.walkable(getTileFacing(mob)) > 0) and (getObjFacing(mob) == 0) then
				mob:move()
			end
		end
	end
end,
--[[
click = async(function(player, mob)
	local quests = {}
	local choices = {}
	
	if (player.class == 1 and player.quest["greatProtector"] >= 0 and player.quest["greatProtector"] < 250) then
		table.insert(quests, "Great Protector")
	end
	
	if (#quests > 0) then
		table.insert(choices, "Quest")
	end
	
	local menu = player:menuString("Hello.", choices)
	
	if (menu == "Quest") then
		r2_c_guard.questSelection(player, mob)
	end
end),
]]--
--[[questSelection = function(player, mob)
	local quests = {}
	
	if (player.class == 1 and player.quest["greatProtector"] >= 0 and player.quest["greatProtector"] < 250) then
		table.insert(quests, "Great Protector")
	end
	
	if (#quests > 0) then
		local menu = player:menuString("Which quest?", quests)
		
		if (menu == "Great Protector") then
			greatProtector.questIndex(player, mob)
		end
	else
		player:dialogSeq({"No quests available."}, 1)
	end
end,
]]--
walkable = function(tile)
	local walkables = {298, 300, 301, 302, 303, 64, 910}
	local semiwalkables = {304, 305, 306, 307, 308, 309, 310, 311, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63}
	local ans = 0
	local i
		
	for i = 1, #walkables do
		if (walkables[i] == tile) then
			ans = 2
		end
	end
	
	for i = 1, #semiwalkables do
		if (semiwalkables[i] == tile) then
			ans = 1
		end
	end
	
	return ans
end,


attack=function(mob, target)
	--[[if (m == 40) and (x == 65) and (y == 17) and (mob.side == 0) then--N Gate Archer
		mob:throw(65, 11, 6, 17, 3)--, [num]action) --throws (no flooritem) to specified x/y with icon, color and action
		--throw([int]id, [num]map, [num]startx, [num]starty, [num]endx, [num]endy, icon, color, action) --throws item i guess? not sure
		return
	end]]--
	
	mob_ai_basic.attack(mob, target)
end
}
