tutorial_boat = {
on_spawn = function(mob)
	mob.side = 1
	mob:sendSide()
	mob:spawn(4, 4, 0, 1)
end,

move = function(mob)
	local player = mob:getObjectsInArea(BL_PC)[1]
	local moved = true
	local i, strikeX, strikeY
	local transition = mob.registry["island_transition"]
	
	if (transition % 3 == 0) then
		for x = 0, mob.xmax, 2 do
			for y = 0, mob.ymax do
				i = math.random(-1, 1)
				
				if (i == -1) then
					x = x - 1
					y = y + 1
				elseif (i == 0) then
					y = y + math.random(0, 1)
				elseif (i == 1) then
					x = x + 1
					y = y - 1
				end
				
				mob:sendAnimationXY(407, x, y)
			end
		end
		
		for x = 0, mob.xmax, math.random(4) do
			for y = 0, mob.ymax, math.random(2, 3) do
				mob:sendAnimationXY(407, x, y)
			end
		end
		
		for e = 0, math.random(11) do
			if (e >= 7) then
				strikeX = math.random(mob.x - 6, mob.x + 6)
				strikeY = math.random(mob.y - 6, mob.y + 6)
				mob:sendAnimationXY(4, strikeX, strikeY)
				mob:sendAnimationXY(290, strikeX + 1, strikeY)
				
				if (e >= 11) then
					mob:sendAnimation(134)
				end
				
				if (math.abs(mob.x + strikeX) < 3 or math.abs(mob.x - strikeX) < 3 or math.abs(mob.y + strikeY) < 3 or math.abs(mob.y - strikeY) < 3) then
					mob:playSound(58)
				else
					mob:playSound(57)
				end
			end
		end
	end
	
	if (transition == 0) then
		mob:move()
	elseif (transition == 5) then
		mob:move()
		firstvoyage.cast(mob)
	elseif (transition == 10) then
		mob:move()
	elseif (transition == 15) then
		mob:move()
	elseif (transition == 20) then
		mob:move()
	elseif (transition == 25) then
		mob:move()
	elseif (transition == 30) then
		mob:move()
	elseif (transition == 35) then
		mob:move()
	elseif (transition == 40) then
		mob:move()
	elseif (transition == 45) then
		mob:move()
		mob:sendAnimationXY(4, mob.x - 1, mob.y, 0)
		mob:sendAnimationXY(290, mob.x - 1, mob.y, 0)
	elseif (transition == 48) then
		mob:sendAnimationXY(46, mob.x - 1, mob.y, 0)
	elseif (transition == 50) then
		mob:move()
		mob:sendAnimationXY(4, mob.x + 1, mob.y, 0)
		mob:sendAnimationXY(290, mob.x + 1, mob.y, 0)
	elseif (transition == 51) then
		mob:sendAnimationXY(46, mob.x + 1, mob.y, 0)
		mob:sendAnimationXY(46, mob.x + 2, mob.y, 0)
		mob:sendAnimationXY(47, mob.x - 1, mob.y, 0)
	elseif (transition == 54) then
		mob:sendAnimationXY(46, mob.x, mob.y, 0)
		mob:sendAnimationXY(47, mob.x + 1, mob.y, 0)
		mob:sendAnimationXY(47, mob.x + 2, mob.y, 0)
		mob:sendAnimationXY(47, mob.x - 1, mob.y, 0)
	elseif (transition == 55) then
		mob:move()
		mob:sendAnimationXY(4, mob.x, mob.y, 0)
		mob:sendAnimationXY(290, mob.x, mob.y, 0)
		mob:sendAnimationXY(4, mob.x - 2, mob.y, 0)
		mob:sendAnimationXY(290, mob.x - 2, mob.y, 0)
	elseif (transition == 57) then
		mob:sendAnimationXY(46, mob.x, mob.y, 0)
		mob:sendAnimationXY(46, mob.x - 2, mob.y, 0)
		mob:sendAnimationXY(47, mob.x + 1, mob.y, 0)
		mob:sendAnimationXY(47, mob.x + 2, mob.y, 0)
		mob:sendAnimationXY(48, mob.x - 1, mob.y, 0)
	elseif (transition == 60) then
		mob:move()
		mob:sendAnimationXY(4, mob.x - 1, mob.y, 0)
		mob:sendAnimationXY(290, mob.x - 1, mob.y, 0)
		mob:sendAnimationXY(4, mob.x + 2, mob.y, 0)
		mob:sendAnimationXY(290, mob.x + 2, mob.y, 0)
	elseif (transition == 65) then
		mob:move()
		mob:sendAnimationXY(47, mob.x, mob.y, 0)
		mob:sendAnimationXY(47, mob.x - 2, mob.y, 0)
		mob:sendAnimationXY(48, mob.x + 1, mob.y, 0)
		mob:sendAnimationXY(48, mob.x + 2, mob.y, 0)
		mob:sendAnimationXY(48, mob.x - 1, mob.y, 0)
	elseif (transition == 70) then
		table.remove(openingSceneUsedMaps, (mob.m - 21000 + 1))
		player:warp(9, 4, 31)
		player.state = 0
		player.gfxClone = 0
		player:updateState()
		player:unlock()
	end
	
	mob.registry["island_transition"] = transition + 1
end,

maxmaps = 20,

getfreemap = function()
	for i = 0, opening_scene.maxmaps - 1 do
		if ((openingSceneUsedMaps[i + 1] ~= nil and openingSceneUsedMaps[i + 1] ~= (21000 + i)) or openingSceneUsedMaps[i + 1] == nil) then
			return (i + 21000)
		end
	end
	
	return nil
end,

startscene = function(player, map)
	table.insert(openingSceneUsedMaps, (map - 21000 + 1), map)
	setMap(map, "../mithiamaps/Accepted/region1/r1_smoothsailing.map")
	player.state = -1
	player.gfxToggle = 1
	player:lock()
	player:warp(map, 8, 4)
	player.mapTitle = "Smooth Sailing"
	--player.bgm = music
	player.light = 120
	player.weather = 0
	player.canTalk = 1
	player:spawn(5, 1, 7, 1)
	player:refresh()
	player.accountRegistry["dark_wizard_opening"] = 2
end
}