login = function(player)
	--FIRST LOGIN
	local logincount = player.registry["login_count"]
	
	if (not player:hasLegend("born")) then
		player:addLegend("Born. "..curT(), "born", 0, 80)
	end
	
	if (logincount == 0) then
		if (player.m == 0) then
			player:freeAsync()
			opening_scene.firstlogin(player)
		elseif (player.m == 144) then
			player:freeAsync()
			tutorial.choice(player)
		end
	elseif (logincount > 0) then
		logincount = logincount + 1
		if (player:staff() == true) then
		--
		else
			local friends = player:getFriends()
			
			if (#friends > 0) then
				for i = 1, #friends do
					player:msg(4, ""..player.name.." has logged in.", friends[i].ID)
				end
			end
		end
		player.registry["login_count"] = logincount
	end
	
	if (player.registry["instanceMap"] > 0) then
		player:warp(player.registry["instanceMap"], player.registry["instanceX"], player.registry["instanceY"])
		player.registry["instanceMap"] = 0
		player.registry["instanceX"] = 0
		player.registry["instanceY"] = 0
	end
	
	if (player.m == 10000) then
		objBrowser()
	elseif (player.m == 10001) then
		tileBrowser()
	end
	
	if (player.gmLevel > 50) then
		player:speak("/online",0)
		--player:speak("/stealth",0)--Disabling stealth on login for now.
	end
	
end

logout = function(player)
	player.registry["ambush_timer"] = 0
	if (player.gmLevel < 50) then
		if (player:staff() == true) then
			--staff doesn't broadcast
		else
			local friends = player:getFriends()
			
			if (#friends > 0) then
				for i = 1, #friends do
					player:msg(4, ""..player.name.." has logged out.", friends[i].ID)
				end
			end
		end
	end
	
	if (player.m >= 60000) then
		player.registry["instanceMap"] = player.m
		player.registry["instanceX"] = player.x
		player.registry["instanceY"] = player.y
		player:warp(40, math.random(75, 82), math.random(17, 19))
	end
	
	if (player.m > 30000) then
		player:warp(10010, 8, 7)
	end
	
	if (player.m >= 20000 and player.m <= 20020) then
		player.registry["login_count"] = 0
		player.state = 0
		player:warp(144, 59, 40)
	end
	
	if (player.m >= 21000 and player.m <= 21020) then
		player:warp(1, 28, 62)
	end
end

mapWeather = function()
	local x, weather
	weather = math.random(1,5)
	if(math.random(4) == 2) then
		if(weather > 3 and weather < 5 and getCurSeason() == "Spring") then
			setWeather(0,0,0)
		elseif(weather >= 2 and weather < 4 and getCurSeason() == "Summer") then
			setWeather(0,0,0)
		elseif(weather == 4 and getCurSeason() == "Fall") then
			setWeather(0,0,0)
		elseif(weather > 3 and getCurSeason() == "Winter") then
			setWeather(0,0,0)
		elseif(weather <= 3 and weather > 1 and getCurSeason() == "Spring") then
			setWeather(0,0,1)
		elseif(weather == 1 and getCurSeason() == "Summer") then
			setWeather(0,0,1)
		elseif(weather >= 2 and weather < 4 and getCurSeason() == "Fall") then
			setWeather(0,0,1)
		elseif(weather == 1 and (getCurSeason() == "Spring" or getCurSeason() == "Fall")) then
			setWeather(0,0,2)
		elseif(weather <= 3 and getCurSeason() == "Winter") then
			setWeather(0,0,2)
		elseif(weather == 5 and getCurSeason() == "Spring") then
			setWeather(0,0,3)
		elseif(weather >= 4 and getCurSeason() == "Summer") then
			setWeather(0,0,3)
		elseif(weather == 5 and getCurSeason() == "Fall") then
			setWeather(0,0,3)
		else
			setWeather(0,0,getWeather(0,0))
		end
	else
		setWeather(0,0,getWeather(0,0))
	end
end

mapEnter = function(player)
	local m = player.m
	--player:sendMinitext("Entering")
	if (m == 0 and player.registry["login_count"] == 0) then
		player:freeAsync()
		opening_scene.firstlogin(player)
	elseif (m==6) then
		local xset = {5,6,8,10,12,8}
		local yset = {3,6,9,6,3,3}
		local b1 = 0
		local b2 = 0
		--find if any boss is alive
		local bosscount = 0
		local finding = {}
		finding = player:getObjectsInSameMap(BL_MOB)
		for i = 1, #finding do
			if (finding[i].mobID == 9) or (finding[i].mobID == 10) then
				bosscount = bosscount + 1
			end
		end
		if (bosscount == 0 and player.mapRegistry["worm_spawn"] < os.time()) then
			player.mapRegistry["worm_spawn"] = os.time() + 60
			--spawn
			local c = math.random(1,16)
			if (c<=3) and (c>=1) then
				b1 = 1
			elseif (c<=6) and (c>=4) then
				b1 = 2
			elseif (c<=9) and (c>=7) then
				b1 = 3
			elseif (c<=12) and (c>=10) then
				b1 = 4
			elseif (c<=15) and (c>=13) then
				b1 = 5
			elseif (c==16) then
				b1 = 6
			end
			repeat
				local d = math.random(1,16)
				if (d<=3) and (d>=1) and (b1 ~= 1) then
					b2 = 1
				elseif (d<=6) and (d>=4) and (b1 ~= 2) then
					b2 = 2
				elseif (d<=9) and (d>=7) and (b1 ~= 3) then
					b2 = 3
				elseif (d<=12) and (d>=10) and (b1 ~= 4) then
					b2 = 4
				elseif (d<=15) and (d>=13) and (b1 ~= 5) then
					b2 = 5
				elseif (d==16) and (b1 ~= 6) then
					b2 = 6
				end
			until b2 > 0
			player:spawn(9,xset[b1],yset[b1],1)
			player:spawn(10,xset[b2],yset[b2],1)
		end
	elseif (m == 10000) then
		objBrowser()
	elseif (m == 10001) then
		tileBrowser()
	elseif (m == 10010) then
		if ((player:staff("pm") > 0) or (player:staff("map") > 0) or (player:staff("lore") > 0) or (player:staff("script") > 0)) then
			player:sendMinitext("Welcome "..player.name..".")
		else
			broadcast(-1,""..player.name.." is attempting to hack into the meeting room.")
			player:warp(1,15,15)
			--SEND TO JAIL
		end
	elseif (m == 10013) then
		player:addSpell("bomber_bomb")
		player.registry["bomber_count"] = 4
		player.registry["bomber_range"] = 4
	elseif (m >= 60000) then
		doInstanceSpawns(player)
	end
	--player:talk(0,"Entered")
end

mapLeave = function(player)
	local m = player.m
	
	instanceMapLeave(player)
	
	if (m == 10013) then
		player:removeSpell("bomber_bomb")
		player.registry["bomber_count"] = 0
		player.registry["bomber_range"] = 0
	end
	--player:sendMinitext("Leaving")
	--player:talk(0,"Left")
end

onScriptedTile = function(player)
	--Runs before warps
	local x = player.x
	local y = player.y
	local m = player.m
	local level = player.level
	--player:talk(0,"Map: "..m.." X: "..x.." Y: "..y)
	--[[if (player.state == 0) then
		player.steps = player.steps + 1
	end]]--
	
	--TEST LINE
	--player:talk(2,"DS: "..player.dmgShield.." PD: "..player.physDeduct)
	onSign(player, 2)
	
	if (m == 0) then--DREAM
		if (player.registry["login_count"]==0) then
			player.registry["firstloginfail"] = 1
			player:freeAsync()
			opening_scene.firstlogin(player)
		end
	elseif (m == 1) then
		if (x == 31) and (y == 34) then
			if (level < 2) then
				player:sendMinitext("You lack the insight to walk in here.")
				player:warp(player.m, 31,35)
			else
				if (player.registry["tut_quest_aggro"] == 0) then
					player:msg(0,''..player.f1Name..'(Spirit of Genesis)" Be careful with the aggressive worms.',player.ID)
					player.registry["tut_quest_aggro"] = 1
				else
					if (math.random(10) < 3) then
						player:msg(0,''..player.f1Name..'(Spirit of Genesis)" Good luck!',player.ID)
					end
				end
			end
		end
	elseif (m == 6)then
		if(x == 8) and (y == 0)then
			local bosscount = 0
			local finding = {}
			local i
			finding = player:getObjectsInSameMap(BL_MOB)
			for i = 1, #finding do
				if (finding[i].mobID == 9) or (finding[i].mobID == 10) then
					bosscount = bosscount + 1
				end
			end
			if (bosscount==0) then
				player:sendMinitext("After the battle you head out to take a break.")
			else
				player:sendMinitext("You realize you are no match for the bugs and leave.")
			end
			player:warp(5, 5, 23)
		end
	elseif (m == 15) then--WOLF CAVE
		if ((x == 67 or x == 68 or x == 69) and y == 3 and level < 12) then
			player:sendMinitext("You lack the insight to walk in here.")
			player:warp(player.m, 68, 4)
		end
	elseif (m == 27) then--Mining Field
		if (y == 27 and (x == 19 or x == 20) and (level < 5 or level >= 25)) then--SQUIRREL HAVEN
			player:sendMinitext("You lack the insight to walk in here.")
			player:warp(player.m, x, y + 1)
		elseif ((x == 4 or x == 5) and y == 55 and level < 19) then--BEAR CAVE
			player:sendMinitext("You lack the insight to walk in here.")
			player:warp(player.m, 4, 56)
		elseif (y == 70 and (x == 33 or x == 34) and level < 46 and player.gmLevel > 0) then--SERPENT CAVE
			player:sendMinitext("You are not ready.")
			player:warp(player.m, x, y - 1)
		elseif (x == 72 and (y == 70 or y == 71) and player.gmLevel < 1) then--FOX CAVE
			player:sendMinitext("Yaoru prevents you from going in.")
			player:warp(player.m, x - 1, y)
		end
	elseif (m == 30) then--Sudden Valley
		if ((x == 62 or x == 63) and y == 51 and player.gmLevel < 1) then--WET SHAFT
			player:sendMinitext("This area is restricted to GM only.")
			player:warp(player.m, x, 53)
		elseif ((x == 60 or x == 61) and y == 9 and level < 26) then--BANDIT RUINS
			player:sendMinitext("You lack the insight to walk in here.")
			player:warp(player.m, 60, 10)
		end
	elseif (m == 137) then--OLD HOUSE
		if ((y == 3 or y == 4) and x == 1 and level < 41) then--BASEMENT
			player:sendMinitext("You lack the insight to walk in here.")
			player:warp(player.m, 3, 3)
		end
	elseif (m == 176) then--Wacky Mountains
		if (y == 0 and (x >= 40 and x <= 52)) then--ARCHER TOWN
			player:sendMinitext("This area is restricted to GM only.")
			player:warp(player.m, x, y + 1)
		elseif (y == 63 and (x == 24 or x == 25) and player.gmLevel < 1) then--WILL O'WISP and TRIMOB CAVE
			player:sendMinitext("This area is restricted to GM only.")
			player:warp(player.m, x, y + 1)
		elseif (y == 10 and (x == 73 or x == 74) and player.gmLevel < 1) then--Haunted house (HH)
			player:sendMinitext("This area is restricted to GM only.")
			player:warp(player.m, x, y + 1)
		end
	elseif (m == 206) then--NEW RUINS
		if ((x == 9 and y == 6 and getTile(m, 9, 6) == 1781)) then
			if(level >= 30) then
				player:warp(208, 1, 6)
			else
				player:sendMinitext("You lack the insight to enter")
			end
		elseif ((x == 9 and y == 7 and getTile(m, 9, 7) == 1784)) then
			if(level >= 30) then
				player:warp(208, 1, 7)
			else
				player:sendMinitext("You lack the insight to enter")
			end
		end
	elseif (m == 209) then
		ruins2_barrel.check(player)
	elseif (m==10001) then--TILE BROWSER
		local j = getTile(m,x,y)
		if (j ~= 0) then
			player:sendMinitext("Tile: "..j)
		end
	elseif (m >= 60000) then--INSTANCES
		checkInstanceWarps(player)
	end
end

onTurn = function(player)
	onSign(player, 3)
end