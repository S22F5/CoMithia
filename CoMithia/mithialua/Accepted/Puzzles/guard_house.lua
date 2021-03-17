guard_house = {
paint = function(player)
	if(player.x >= 5) then
		if(player.registry["paintColor"] == 0) then
			setTile(6001, player.x, player.y, 3368)
		elseif(player.registry["paintColor"] == 1) then
			setTile(6001, player.x, player.y, 1374)
		elseif(player.registry["paintColor"] == 2) then
			setTile(6001, player.x, player.y, 582)
		elseif(player.registry["paintColor"] == 3) then
			setTile(6001, player.x, player.y, 573)
		elseif(player.registry["paintColor"] == 4) then
			setTile(6001, player.x, player.y, 607)
		elseif(player.registry["paintColor"] == 5) then
			setTile(6001, player.x, player.y, 591)
		end
	
	elseif(player.x == 2 and player.y == 7) then
		player.registry["paintColor"] = 1
	elseif(player.x == 2 and player.y == 8) then
		player.registry["paintColor"] = 0
	elseif(player.x == 2 and player.y == 9) then
		player.registry["paintColor"] = 2		
	elseif(player.x == 2 and player.y == 10) then
		player.registry["paintColor"] = 3	
	elseif(player.x == 2 and player.y == 11) then
		player.registry["paintColor"] = 4	
	elseif(player.x == 2 and player.y == 12) then
		player.registry["paintColor"] = 5		
	elseif(player.x == 2 and player.y == 6) then
		for	i = 5, 15, 1 do
			for j = 3, 13, 1 do
				setTile(6001, i, j, 3368)
			end
		end
	end
end,


toggleTiles = function(player, x, y)
	--1251 / 1233
	local m = player.m
	if (x == nil and y == nil) then
		x = player.x
		y = player.y
	end

	local up = getTile(m, x, y - 1)
	local right = getTile(m, x + 1, y)
	local down = getTile(m, x, y + 1)
	local left = getTile(m, x - 1, y)
	local center = getTile(m, x, y)
	
	if (up == 1251) then
		setTile(m, x, y - 1, 1233)
	elseif (up == 1233) then		
		setTile(m, x, y - 1, 1251)
	end
	if (right == 1251) then
		setTile(m, x + 1, y, 1233)
	elseif (right == 1233) then
		setTile(m, x + 1, y, 1251)
	end
	if (down == 1251) then
		setTile(m, x, y + 1, 1233)
	elseif (down == 1233) then
		setTile(m, x, y + 1, 1251)
	end
	if (left == 1251) then
		setTile(m, x - 1, y, 1233)
	elseif (left == 1233) then
		setTile(m, x - 1, y, 1251)
	end
	if (center == 1251) then
		setTile(m, x, y, 1233)
	elseif (center == 1233) then
		setTile(m, x, y, 1251)
	end
end,

scramble = function(player)
	local m = player.m
	local iX, iY
	for iX = 3, 7 do
		for iY = 5, 9 do
			if (math.random(100) < 25) then
				guard_house.toggleTiles(player, iX, iY)
			end
		end
	end
end,

lightsOut = function(player)
	local t1 = getTile(player.m, player.x-1, player.y-1) --Tiles:   1251 out / 1233 on
	local t2 = getTile(player.m, player.x, player.y-1)   -- 1 2 3
	local t3 = getTile(player.m, player.x+1, player.y-1) -- 4 5 6 
	local t4 = getTile(player.m, player.x-1, player.y)   -- 7 8 9
	local t5 = getTile(player.m, player.x, player.y)
	local t6 = getTile(player.m, player.x+1, player.y)
	local t7 = getTile(player.m, player.x-1, player.y+1)
	local t8 = getTile(player.m, player.x, player.y+1)
	local t9 = getTile(player.m, player.x+1, player.y+1)
	
	if((t5 ~= 1233) and (t5 ~= 1251)) then
		return
	end
	
	--if(t1 == 1251) then
	--	setTile(player.m, player.x-1, player.y-1, 1233)
	--elseif(t1 == 1233) then
	--	setTile(player.m, player.x-1, player.y-1, 1251)
	--end
	if(t2 == 1251) then
		setTile(player.m, player.x, player.y-1, 1233)
	elseif(t2 == 1233) then
		setTile(player.m, player.x, player.y-1, 1251)
	end
	--if(t3 == 1251) then
	--	setTile(player.m, player.x+1, player.y-1, 1233)
	--elseif(t3 == 1233) then
	--	setTile(player.m, player.x+1, player.y-1, 1251)
	--end
	if(t4 == 1251) then
		setTile(player.m, player.x-1, player.y, 1233)
	elseif(t4 == 1233) then
		setTile(player.m, player.x-1, player.y, 1251)
	end
	if(t5 == 1251) then
		setTile(player.m, player.x, player.y, 1233)
	elseif(t5 == 1233) then
		setTile(player.m, player.x, player.y, 1251)
	end
	if(t6 == 1251) then
		setTile(player.m, player.x+1, player.y, 1233)
	elseif(t6 == 1233) then
		setTile(player.m, player.x+1, player.y, 1251)
	end
	--if(t7 == 1251) then
	--	setTile(player.m, player.x-1, player.y+1, 1233)
	--elseif(t7 == 1233) then
	--	setTile(player.m, player.x-1, player.y+1, 1251)
	--end
	if(t8 == 1251) then
		setTile(player.m, player.x, player.y+1, 1233)
	elseif(t8 == 1233) then
		setTile(player.m, player.x, player.y+1, 1251)
	end
	--if(t9 == 1251) then
	--	setTile(player.m, player.x+1, player.y+1, 1233)
	--elseif(t9 == 1233) then
	--	setTile(player.m, player.x+1, player.y+1, 1251)
	--end
end
}