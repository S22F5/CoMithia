--utility script
--http://lua-users.org/wiki/FormattingNumbers

function format_number(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end


function mithia_lore_time()
    --exactly 52 weeks a year
    --12 months a year, 30,30,31,30,30,31,30,30,31,30,30,31
    --4 seasons
    -- every season starts on Lunae,
     
	local days = {"Lunae", "Martis", "Mercurii","Jovis", "Veneris", "Saturni", "Solis"}
	local months = {"Ianuarius","Februarius", "Martius", "Aprilis", "Maius", "Iunus", 
	                "Quintilis", "Augustus", "September", "October","November","December"}
	local seasons = {"Winter","Spring","Summer","Autumn"}
	local year = curYear() --gets current year
	local date = curDay() --gets current day
	local day = days[(date % 7) + 1]
	local time = curTime() --gets current time
	local season = seasons[curSeason()] --gets current Season (string)
    local dayOfMonth = date
    
    local mdate = date
    if (mdate >= 91) then
    	mdate = 90
    end
    
    if (dayOfMonth == 91) then
    	dayOfMonth = 31
    else
    	while (dayOfMonth > 30) do
			dayOfMonth = dayOfMonth - 30
		end
	end
	
    if (dayOfMonth > 30) then
    	dayOfMonth = dayOfMonth - 30
   	end
   	
    if (dayOfMonth > 30) then
    	dayOfMonth = dayOfMonth - 30
   	end
   	
    local month = months[(curSeason()-1)*3 + math.floor((mdate-1) / 30) + 1] 

	return {Year = year, SeasonOfYear = season, DayOfSeason = date, DayOfWeek = day, MonthOfYear = month, DayOfMonth = dayOfMonth, Time = time}
end
--[[
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

doInstanceSpawns = function(player)
	doRuinsSpawns(player)
	doCanidaeSpawns(player)
end

doRuinsSpawns = function(player)
	if (player.mapTitle == "Ruins") then
		ruins_spawns.room1(player)
	elseif (player.mapTitle == "East Wing") then
		ruins_spawns.room2(player)
	elseif (player.mapTitle == "West Wing") then
		ruins_spawns.room3(player)
	elseif (player.mapTitle == "Hoary Hallway") then
		ruins_spawns.room4(player)
	elseif (player.mapTitle == "Precarious Passage") then
		ruins_spawns.room5(player)
	end
end

doCanidaeSpawns = function(player)
	if (player.mapTitle == "Merry Forest") then
		canidae_spawns.room1(player)
	elseif (player.mapTitle == "Cheerful Forest") then
		canidae_spawns.room2(player)
	elseif (player.mapTitle == "Joyous Forest") then
		canidae_spawns.room3(player)
	elseif (player.mapTitle == "Glade") then
		canidae_spawns.room4(player)
	elseif (player.mapTitle == "Twisting Pine") then
		canidae_spawns.room5(player)
	elseif (player.mapTitle == "Clearing") then
		canidae_spawns.room6(player)
	end
end

mapLeave = function(player)
	local m = player.m
	
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
	--if (player.state == 0) then
		-player.steps = player.steps + 1
	--end
	
	--TEST LINE
	--player:talk(2,"DS: "..player.dmgShield.." PD: "..player.physDeduct)
	onSign(player, 2)
	
	if (m==0) then
		if (player.registry["login_count"]==0) then
			player.registry["firstloginfail"] = 1
			player:freeAsync()
			opening_scene.firstlogin(player)
		end
	elseif (m==1) then
		if (x==31) and (y==34) then
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
	elseif (m==6)then
		if(x==8)and(y==0)then
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
	elseif (m == 15) then
		if ((x == 67 or x == 68 or x == 69) and y == 3 and level < 12) then
			player:sendMinitext("You lack the insight to walk in here.")
			player:warp(player.m, 68, 4)
		end
	elseif (m == 27) then--Mining Field
		if ((x == 4 or x == 5) and y == 55 and level < 19) then
			player:sendMinitext("You lack the insight to walk in here.")
			player:warp(player.m, 4, 56)
		elseif (x == 72 and (y == 70 or y == 71) and
		player.gmLevel < 1) then--FOX CAVE
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
	elseif (m == 137) then
		if ((y == 3 or y == 4) and x == 1 and level < 41) then
			player:sendMinitext("You lack the insight to walk in here.")
			player:warp(player.m, 3, 3)
		end
	elseif (m == 206) then
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
	elseif (m==10001) then
		local j = getTile(m,x,y)
		if (j ~= 0) then
			player:sendMinitext("Tile: "..j)
		end
	elseif (m >= 60000) then
		checkInstanceWarps(player)
	end
end

checkInstanceWarps = function(player)
	local mobs = player:getObjectsInSameMap(BL_MOB)
	
	checkRuins(player, mobs)
	checkCanidae(player, mobs)
end

checkRuins = function(player, mobs)
	if (ruinsPushBack(player, mobs) == true) then
		return
	end
	
	local players = player:getObjectsInSameMap(BL_PC)
	
	if (player.mapTitle == "Ruins") then
		if (#players > 0) then
			for i = 1, #players do
				players[i].registry["ruins1Spawned"] = 1
			end
		end
	elseif (player.mapTitle == "East Wing") then
		if (#players > 0) then
			for i = 1, #players do
				players[i].registry["ruins2Spawned"] = 1
			end
		end
	elseif (player.mapTitle == "West Wing") then
		if (#players > 0) then
			for i = 1, #players do
				players[i].registry["ruins3Spawned"] = 1
			end
		end
	elseif (player.mapTitle == "Hoary Hallway") then
		if (#players > 0) then
			for i = 1, #players do
				players[i].registry["ruins4Spawned"] = 1
			end
		end
	elseif (player.mapTitle == "Precarious Passage") then
		if (#players > 0) then
			for i = 1, #players do
				players[i].registry["ruins5Spawned"] = 1
			end
		end
	end
end

ruinsPushBack = function(player, mobs)
	local pushed = false
	
	if (player.mapTitle == "Ruins" and #mobs > 0 and ((player.x == 0 or player.x == 34) and (player.y == 5 or player.y == 6 or player.y == 7))) then
		pushBack(player)
		pushed = true
	elseif (player.mapTitle == "East Wing" and #mobs > 0 and ((player.x == 12 and (player.y == 32 or player.y == 33 or player.y == 34)) or ((player.x == 7 or player.x == 8) and player.y == 14))) then
		pushBack(player)
		pushed = true
	elseif (player.mapTitle == "West Wing" and #mobs > 0 and ((player.x == 17 and (player.y == 32 or player.y == 33 or player.y == 34)) or ((player.x == 21 or player.x == 22) and player.y == 14))) then
		pushBack(player)
		pushed = true
	elseif (player.mapTitle == "Hoary Hallway" and #mobs > 0 and (((player.x == 6 or player.x == 7) and player.y == 24) or ((player.x == 27 or player.x == 28) and player.y == 24) or ((player.x == 16 or player.x == 17 or player.x == 18) and player.y == 0))) then
		pushBack(player)
		pushed = true
	elseif (player.mapTitle == "Precarious Passage") then
		if (#mobs <= 2) then
			player.registry["ruins5Spawned"] = 1
		else
			pushed = true
		end
	end
	
	return pushed
end

checkCanidae = function(player, mobs)
	if (canidaePushBack(player, mobs) == true) then
		return
	end
	
	local players = player:getObjectsInSameMap(BL_PC)
	
	if (player.mapTitle == "Merry Forest") then
		if (#players > 0) then
			for i = 1, #players do
				if (player.y < 15) then
					players[i].registry["canidae1Spawned"] = 1
				elseif (player.y > 15) then
					players[i].registry["canidae1Spawned"] = 2
				end
			end
		end
	elseif (player.mapTitle == "Cheerful Forest") then
		if (#players > 0) then
			for i = 1, #players do
				players[i].registry["canidae2Spawned"] = 1
			end
		end
	elseif (player.mapTitle == "Joyous Forest") then
		if (player.x == 0 and (player.y == 25 or player.y == 26 or player.y == 27) and player.registry["canidae4Spawned"] == 0) then
			pushBack(player)
		elseif (#players > 0) then
			for i = 1, #players do
				players[i].registry["canidae3Spawned"] = 1
			end
		end
	elseif (player.mapTitle == "Glade") then
		if (#players > 0) then
			for i = 1, #players do
				players[i].registry["canidae4Spawned"] = 1
			end
		end
	elseif (player.mapTitle == "Twisting Pine") then
		if (#players > 0) then
			for i = 1, #players do
				players[i].registry["canidae5Spawned"] = 1
			end
		end
	elseif (player.mapTitle == "Clearing") then
		if (#players > 0) then
			for i = 1, #players do
				players[i].registry["canidae6Spawned"] = 1
			end
		end
	end
end

canidaePushBack = function(player, mobs)
	local pushed = false
	
	if (player.mapTitle == "Merry Forest" and #mobs > 0 and ((player.x == 29 and (player.y == 6 or player.y == 7 or player.y == 21 or player.y == 22 or player.y == 23)) or ((player.x == 6 or player.x == 7 or player.x == 8) and player.y == 29))) then
		pushBack(player)
		pushed = true
	elseif (player.mapTitle == "Cheerful Forest" and #mobs > 0 and ((player.x == 0 and (player.y == 25 or player.y == 26)) or (player.x == 29 and (player.y == 24 or player.y == 25 or player.y == 26)))) then
		pushBack(player)
		pushed = true
	elseif (player.mapTitle == "Joyous Forest") then
		if (#mobs > 0 and ((player.x == 0 and (player.y == 5 or player.y == 6 or player.y == 7)) or (player.x == 29 and (player.y == 11 or player.y == 12 or player.y == 13)))) then
			pushBack(player)
			pushed = true
		elseif (player.x == 0 and (player.y == 25 or player.y == 26 or player.y == 27) and player.registry["canidae4Spawned"] == 0) then
			pushBack(player)
			pushed = true
		end
	elseif (player.mapTitle == "Glade" and #mobs > 0 and (player.x == 0 and (player.y == 9 or player.y == 10 or player.y == 11))) then
		pushBack(player)
		pushed = true
	elseif (player.mapTitle == "Twisting Pine" and #mobs > 0 and ((player.x == 29 and (player.y == 4 or player.y == 5 or player.y == 6)) or (player.x == 0 and (player.y == 7 or player.y == 8 or player.y == 9)))) then
		pushBack(player)
		pushed = true
	elseif (player.mapTitle == "Clearing") then
		if (#mobs <= 1) then
			player.registry["canidae6Spawned"] = 1
		else
			pushed = true
		end
	end
	
	return pushed
end




onKill = function(block, player)

	if (block.blType == BL_MOB) then
		local killTotal
		local total
		if (block.mobID == 111 or block.mobID == 112 or block.mobID == 113 or block.mobID == 114) then
		--r2_s_shepherd3 50 bandits repeatable
			total = 50
			for i = 1, #player.group do
				local killCount111 = Player(player.group[i]):killCount(111)
				local killCount112 = Player(player.group[i]):killCount(112)
				local killCount113 = Player(player.group[i]):killCount(113)
				local killCount114 = Player(player.group[i]):killCount(114)
				killTotal = killCount111 + killCount112 + killCount113 + killCount114
				if (Player(player.group[i]).state ~= 1 and Player(player.group[i]).m == player.m
				and Player(player.group[i]).afk == false
				and Player(player.group[i]).quest["banditQuest"] > 0 and Player(player.group[i]).quest["banditQuest"] < 100
				and (killTotal % 5) == 0) then
					onKillMsg(player, killTotal, total)
				end
			end
		elseif (block.mobID == 117 or block.mobID == 118 or block.mobID == 119 or block.mobID == 120 or block.mobID == 121) then
		--r2_s_chief zombie kills
			total = 1000
			for i = 1, #player.group do
				local killCount117 =  Player(player.group[i]):killCount(117)
				local killCount118 =  Player(player.group[i]):killCount(118)
				local killCount119 =  Player(player.group[i]):killCount(119)
				local killCount120 =  Player(player.group[i]):killCount(120)
				local killCount121 =  Player(player.group[i]):killCount(121)
				killTotal = killCount117 + killCount118 + killCount119 + killCount120 + killCount121
				if (Player(player.group[i]).state ~= 1 and Player(player.group[i]).m == player.m
				and Player(player.group[i]).afk == false
				and Player(player.group[i]).level >= 43
				and (killTotal % 5) == 0) then
					onKillMsg(Player(player.group[i]), killTotal, total)
				end
			end
		elseif (block.mobID == 66 or block.mobID == 67) then
		--r2_lj_hunter bear Quest
			for i = 1, #player.group do
				total = Player(player.group[i]).registry["bearQuestKillAmount"]
				local killCount66 = Player(player.group[i]):killCount(66)
				local killCount67 = Player(player.group[i]):killCount(67)
				killTotal = killCount66 + killCount67
				if (Player(player.group[i]).state ~= 1 and Player(player.group[i]).m == player.m
				and Player(player.group[i]).afk == false
				and Player(player.group[i]).quest["bearQuest"] > 0
				and (killTotal % 5) == 0) then
					onKillMsg(Player(player.group[i]), killTotal, total)
				end
			end
		elseif (block.mobID == 81 or block.mobID == 82 or block.mobID == 83 or block.mobID == 84) then
		--r2_lj_mercenary wolf Quest
			for i = 1, #player.group do
				total = Player(player.group[i]).registry["wolfQuestKillAmount"]
				local killCount81 = Player(player.group[i]):killCount(81)
				local killCount82 = Player(player.group[i]):killCount(82)
				local killCount83 = Player(player.group[i]):killCount(83)
				local killCount84 = Player(player.group[i]):killCount(84)
				killTotal = killCount81 + killCount82 + killCount83 + killCount84
				if (Player(player.group[i]).state ~= 1 and Player(player.group[i]).m == player.m
				and Player(player.group[i]).afk == false
				and Player(player.group[i]).quest["wolfQuest"] > 0
				and (killTotal % 5) == 0) then
					onKillMsg(Player(player.group[i]), killTotal, total)
				end
			end
		elseif (block.mobID == 2) then
		--tut_quest_girl squirrel quest
			for i = 1, #player.group do
				total = 10
				local killCount2 = Player(player.group[i]):killCount(2)
				killTotal = killCount2
				if (Player(player.group[i]).state ~= 1 and Player(player.group[i]).m == player.m
				and Player(player.group[i]).afk == false
				and Player(player.group[i]).quest["tut_quest_girl"] == 4) then
					onKillMsg(Player(player.group[i]), killTotal, total)
				end
			end
		elseif (block.mobID == 7) then
			for i = 1, #player.group do
				total = 6
				local killCount7 = Player(player.group[i]):killCount(7)
				killTotal = killCount7
				if (Player(player.group[i]).state ~= 1 and Player(player.group[i]).m == player.m
				and Player(player.group[i]).afk == false
				and Player(player.group[i]).quest["tut_quest_bird_worshipper"] == 3) then
					onKillMsg(Player(player.group[i]), killTotal, total)
				end
			end
		end
	elseif (block.blType == BL_PC) then
	end
end



onKillMsg = function(player, killTotal, total)
	if (player.registry["questCount"] == 0) then
		player:msg(0, player.f1Name..'(Spirit of Genesis)" '.."You have killed "..killTotal.."/"..total..". ((Toggle on F1))", player.ID)
	end
end




onLevel = function(player)
	--local primary = math.ceil(((player.level + 1) * 1.325))
	--local secondary = math.floor((primary * .665))
	--local tertiary = math.ceil((secondary * .48))
end

onCreation = function(player)
	local itemcount = player.createCount
	local itemamounts = {}
	local items = {}
	local item
	local len = 6
	local x = 0
	
	for x = 1, itemcount do
		table.insert(items, player:getCreationItems(len))
		table.insert(itemamounts, player:getCreationAmounts(len, items[x]))
		item = Item(items[x])
		
		if (item.type < 3 or item.type > 17) then
			len = len + 2
		else
			len = len + 1
		end
	end
end

onPickUp = function(player,item)
	if (player.pickUpType == 1) then--< Big pick up all.
		--player:talk(0,"Picked up "..item.amount.." "..Item(item.id).name.."("..item.id..")")
	else
		--player:talk(0,"Picked up 1 "..Item(item.id).name.."("..item.id..")")
	end

	if (Item(item.id).type ~= 20) then
		player:pickUp(item.ID)--Back to Core
	end
end

onDrop = function(player,item)
	--player:talk(0,"Dropped: "..Item(item.id).name.." ID: "..item.id.." Item amount: "..item.amount - item.lastAmount)
end

onEquip = function(player,item)
	--player:talk(0,"Equipped "..player.equipID)
	
	player:equip()
end

onUnequip = function(player,item)
	--player:talk(0,"Unequipped "..player:getEquippedItem(takeOffID).id)
	
	player:takeOff()
end

onDeathPlayer = function(player)
	--player:talk(0,"wew died!")
	if (player.registry["immortal"] == 1) then
		return
	elseif (player.registry["immortal"] == 2) then--from decoy
		player.registry["immortal"]	= 0
		return
	end
	
	player.deathFlag = 1
end

onCast = function(player)
	if (player.confused) then
		local randtargetpc = player:getObjectsInArea(player.m, player.x, player.y, BL_PC)
		local randtargetmob = player:getObjectsInArea(player.m, player.x, player.y, BL_MOB)
		local rand = math.random(100)
		
		if (rand <= 50) then
			player.target = randtargetpc[math.random(#randtargetpc)].ID
		elseif (rand > 50) then
			player.target = randtargetmob[math.random(#randtargetmob)].ID
		end
		
		player:sendMinitext("Your target has changed due to confusion!")
	end
	--player:talk(0,"Casted")
end

onBreak = function(player)
	--player:talk(0,"Broken "..player.breakID)
end

onThrow = function(player,item)
	--local y = player:getInventoryItem(player.invSlot) --returns inventory slot
	--player:talk(0,"Slot: "..player.invSlot.." Item returned "..y.name)
	player:throwItem()
end

onAction = function(player)
	
	if (player.m == 6001 and player.action ==4) then
		guard_house.paint(player)
	end
	
	if (player.m == 6002 and player.action ==4) then
		guard_house.lightsOut(player)
	elseif (player.m == 6005 and player.action ==4) then
		guard_house.lightsOut(player)
		if (player.quest["masterOfDeception"] == 6) then
			local iX, iY
			local tileA = 0
			local tileB = 0
			for iX = 3, 7 do
				for iY = 5, 9 do
					if (getTile(6005, iX, iY)  == 1251) then
						tileA = tileA + 1
					elseif (getTile(6005, iX, iY) == 1233) then
						tileB = tileB + 1
					end
				end
			end
			if (tileA == 0 or tileB == 0) then
				emperor_golden_vase_chest.open(player, NPC("emperor_golden_vase_chest"))
				--scramble
				local tileAB = {1233, 1251}
				for iX = 3, 7 do
					for iY = 5, 9 do
						local tile = tileAB[math.random(#tileAB)]
						setTile(6005, iX, iY, tile)
					end
				end
			end
		end
	end
end

onSign = function(player, signType)
	local objFacing = getObjFacing(player)
	local m = player.m
	local x = player.x
	local y = player.y
	local side = player.side
	local str = ""

	if (signType == 1) then--onLook
		if (m == 40) then
			if (objFacing == 15514 or objFacing == 15515) then
				if (x >= 100 and x <= 103 and (y == 14 or y == 15)) then--Rat Cave sign
					str = "<b>DANGER!\n\n"
					str = str.."Rat infestation"
					player:popUp(str)
				end
			end
		end
	elseif (signType == 2) then--onScriptedTile
		if (m == 40) then
			if ((x == 100 and y == 14 and side == 1) or
			((x == 101 or x == 102) and y == 15 and side == 0) or
			(x == 103 and y == 14 and side == 3)) then--Rat Cave sign
				str = "<b>DANGER!\n\n"
				str = str.."Rat infestation"
				player:popUp(str)
			end
		end
	end
	
end

onLook = function(player, block)
	onSign(player, 1)
	player:lookAt(block.ID)
	
	--Check to avoid double printing for GMs
	if (player:staff("script") >= 3 and player:staff("pm") == -1 and player.gmLevel < 50) then
		--BL_PC, BL_MOB, BL_NPC, BL_ITEM
		local str = ""
		if (block.blType == BL_PC) then
			str = ""..block.classNameMark.." | "..block.name.." ("..string.format("%.2f", (block.health / block.maxHealth * 100)).."%) ID: "..block.id
			player:msg(0, ""..str, player.id)
		elseif (block.blType == BL_MOB) then
			str = ""..block.name.." | "..block.yname.." ("..string.format("%.2f", (block.health / block.maxHealth * 100)).."%) id: "..block.id.." ID: "..block.ID.." mobID: "..block.mobID
			player:msg(0, ""..str, player.id)
		elseif (block.blType == BL_NPC) then
			str = ""..block.name.." | "..block.yname.." "..block.id
			player:msg(0, ""..str, player.id)
		elseif (block.blType == BL_ITEM) then
			str = ""..block.name.." | "..block.yname.." "..block.id
			player:msg(0, ""..str, player.id)
		end
	end
end

onDismount = function(player)
	player.registry["mount_type"] = 0
	player.disguise = 0
	player.state = 0
	player:calcStat()
	player:updateState()
end

remount = function(player)
	local mount = player.registry["mount_type"]
	
	if (mount > 0 and player.state == 3) then
		if (mount == 1) then
			player.speed = player.speed - 20
		elseif (mount == 2) then
			player.speed = player.speed - 25
		end
		
		player:updateState()
	else
		player.registry["mount_type"] = 0
	end
end





onDeathMob = function(mob)
	local mobBlocks = mob:getObjectsInArea(BL_MOB)
	
	for i = 1, #mobBlocks do
		if (mobBlocks[i].target == mob.ID and mobBlocks[i].owner > 0) then
			mobBlocks[i].target = mobBlocks[i].owner
		end
	end
end





asyncDialog = async(function(player,definer)--Use when need an async dialog/dialogSeq on a sync function.
	local t = {}
	if (definer == 1) then
		t = {graphic=convertGraphic(838,"monster"),color=0}
		player:dialogSeq({
		t,"I see you have made a discovery.",
		t,"You have discovered magic, which also leads you to realize about the existance of mana!",
		t,"Mana is the magical energies in the surroundings.",
		t,"In your case, it's the magical energy held within you.",
		t,"Mana regenerates slowly as your body accumulates these energies in the surroundings.",
		t,"It might take some time, but after a while the levels of mana you can hold in your body and those around you will stabilize.",
		t,"Gaining control over the flow of these magical energies is what will determine the capacity you can hold.",
		t,"Your will plays an important role on how mana flows and on how much energy your body can retain and regenerate.",
		t,"Go on and look around you, I'm sure you will find the flow of mana in others; try and see if you can learn how to channel it."
		},1)
		--player:msg(8,"You have made a discovery!",player.ID)
		player:dialogSeq({
		t,"You have gained your first level!",
		t,"As you gain experience you will continue to gain levels. You can probably go as far as level 50.",
		t,"With each level you will gain some attribute points (ap). These will help you greatly to improve your stats.",
		t,"While you are a peasant I can aid you in training your attribute points, just call me when you're ready."
		},1)
		player:msg(8,"You have gained a level!\r\nYou have also gained some attribute points ("..player.gameRegistry["ap_per_level"].."). You may talk to a trainer to teach you how to use them.",player.ID)
		player.registry["quest_disc_mana"]= 1
	end
	
end)





iconViewer = async(function(player, str)
	if (str == nil) then
		str = "n"
	end
	
	local x = player.registry["gfx_icons"]
	local y = player.registry["gfx_icons_color"]
	local t = {graphic = convertGraphic(x, "item"), color = y}
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player:dialogSeq({t, "Icon #: "..x.."\nColor #: "..y}, 1)
	if (str == "n") then
		player.registry["gfx_icons"] = player.registry["gfx_icons"] + 1
		iconViewer2(player, "n")
	elseif (str == "p") then
		player.registry["gfx_icons"] = player.registry["gfx_icons"] - 1
		iconViewer2(player, "p")
	elseif (str == "nc") then
		player.registry["gfx_icons_color"] = player.registry["gfx_icons_color"] + 1
		iconViewer2(player, "nc")
	elseif (str == "pc") then
		player.registry["gfx_icons_color"] = player.registry["gfx_icons_color"] - 1
		iconViewer2(player, "pc")
	end
end)

iconViewer2 = function(player, str)
	if (str == nil) then
		str = "n"
	end
	
	local x = player.registry["gfx_icons"]
	local y = player.registry["gfx_icons_color"]
	local t = {graphic = convertGraphic(x, "item"), color = y}
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player:dialogSeq({t, "Icon #: "..x.."\nColor #: "..y}, 1)
	if (str == "n") then
		player.registry["gfx_icons"] = player.registry["gfx_icons"] + 1
		iconViewer3(player, "n")
	elseif (str == "p") then
		player.registry["gfx_icons"] = player.registry["gfx_icons"] - 1
		iconViewer3(player, "p")
	elseif (str == "nc") then
		player.registry["gfx_icons_color"] = player.registry["gfx_icons_color"] + 1
		iconViewer3(player, "nc")
	elseif (str == "pc") then
		player.registry["gfx_icons_color"] = player.registry["gfx_icons_color"] - 1
		iconViewer3(player, "pc")
	end
end

iconViewer3 = function(player, str)
	if (str == nil) then
		str = "n"
	end
	
	local x = player.registry["gfx_icons"]
	local y = player.registry["gfx_icons_color"]
	local t = {graphic = convertGraphic(x, "item"), color = y}
	player.npcGraphic = t.graphic
	player.npcColor = t.color
	player:dialogSeq({t, "Icon #: "..x.."\nColor #: "..y}, 1)
	if (str == "n") then
		player.registry["gfx_icons"] = player.registry["gfx_icons"] + 1
		iconViewer2(player, "n")
	elseif (str == "p") then
		player.registry["gfx_icons"] = player.registry["gfx_icons"] - 1
		iconViewer2(player, "p")
	elseif (str == "nc") then
		player.registry["gfx_icons_color"] = player.registry["gfx_icons_color"] + 1
		iconViewer2(player, "nc")
	elseif (str == "pc") then
		player.registry["gfx_icons_color"] = player.registry["gfx_icons_color"] - 1
		iconViewer2(player, "pc")
	end
end





checktile = function(tipo, dist) --type, distance, Returns TRUE for empty, FALSE for taken.
	local d = {}
	-- Facing North
	if(tipo.side==0) then
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_PC))
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_MOB))
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_NPC))
			if(#d==0 and tipo:objectCanMove(tipo.x,tipo.y-dist,0)==true and getPass(tipo.m,tipo.x,tipo.y-dist)==0) then
--				tipo:sendMinitext("Empty.")
			return true
		else
			--tipo:sendMinitext("There is nowhere for you to land!")
			return d[1]
		end
	--Facing East
	elseif(tipo.side==1) then
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_PC))
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_MOB))
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_NPC))
			if(#d==0 and tipo:objectCanMove(tipo.x+dist,tipo.y,1)==true and getPass(tipo.m,tipo.x+dist,tipo.y)==0) then
--				tipo:sendMinitext("Empty.")
			return true
		else
			--tipo:sendMinitext("There is nowhere for you to land!")
			return d[1]
		end
	--Facing South
	elseif(tipo.side==2) then
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_PC))
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_MOB))
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_NPC))
		if(#d==0 and tipo:objectCanMove(tipo.x,tipo.y+dist,2)==true and tipo:objectCanMove(tipo.x,tipo.y+dist,0)==true and getPass(tipo.m,tipo.x,tipo.y+dist)==0) then
--				tipo:sendMinitext("Empty.")
			return true
		else
		--tipo:sendMinitext("There is nowhere for you to land!")
			return d[1]
		end
	--Facing West
	elseif(tipo.side==3) then
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_PC))
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_MOB))
		table.insert(d,tipo:getObjectsInCell(tipo.m,tipo.x,tipo.y-dist,BL_NPC))
		if(#d==0 and tipo:objectCanMove(tipo.x-dist,tipo.y,3)==true and getPass(tipo.m,tipo.x-dist,tipo.y)==0) then
--				tipo:sendMinitext("Empty.")
			return true
		else
			--tipo:sendMinitext("There is nowhere for you to land!")
			return d[1]
		end
	end
end

checktiletype = function(tipo, dist) --tar, dist, state) --targettypes: 1 = PC, 2 = MOB, 3 = NPC  
--returns true IF it finds something of that targettype on the distance selected
	local m=tipo.m
	local x=tipo.x
	local y=tipo.y
	local d = {}
	local e = {}
	local f = {}
	
	if(tipo.side==0) then y=y-dist end
	if(tipo.side==1) then x=x+dist end
	if(tipo.side==2) then y=y+dist end
	if(tipo.side==3) then x=x-dist end
	--if (tar == 1) then
		d=tipo:getObjectsInCell(m,x,y,BL_PC)
	--elseif (tar == 2) then
		e=tipo:getObjectsInCell(m,x,y,BL_MOB)
	--elseif (tar == 3) then
		f=tipo:getObjectsInCell(m,x,y,BL_NPC)
	--end
		if(#d + #e + #f == 0) then
		--tipo:sendMinitext("There is no target in front of you.")
		return false
	else
		if (#d ~= 0) then
			return d[1] --returning a block allows us to use every aspect of it
		elseif(#e ~= 0) then
			return e[1]
		elseif(#f ~= 0) then
			return f[1]
		end
	--	if (tar == 1) and (d[1].state ~= 1) then
	--		return false
	--	else
	--		return true
	--	end
	end
end

getTileFacing = function(block, side)
	local nside
	if (side ~= nil) then
		nside = side
	else
		nside = block.side
	end
	local x = block.x
	local y = block.y
	
	if (nside == 0) then
		y = y - 1
	elseif (nside == 1) then
		x = x + 1
	elseif (nside == 2) then
		y = y + 1
	elseif (nside == 3) then
		x = x - 1
	end
	
	local tile = getTile(block.m, x, y)
	return tile
end

getObjFacing = function(block, side)
	local nside
	if (side ~= nil) then
		nside = side
	else
		nside = block.side
	end
	local x = block.x
	local y = block.y
	
	if (nside == 0) then
		y = y - 1
	elseif (nside == 1) then
		x = x + 1
	elseif (nside == 2) then
		y = y + 1
	elseif (nside == 3) then
		x = x - 1
	end
	
	local obj = getObject(block.m, x, y)
	return obj
end

getPassFacing = function(block, side)
	local nside
	if (side ~= nil) then
		nside = side
	else
		nside = block.side
	end
	local x = block.x
	local y = block.y
	
	if (nside == 0) then
		y = y - 1
	elseif (nside == 1) then
		x = x + 1
	elseif (nside == 2) then
		y = y + 1
	elseif (nside == 3) then
		x = x - 1
	end
	
	local pass = getPass(block.m, x, y)
	if (pass == 0) then
		pass = true
	else
		pass = false
	end
	return pass
end

setBarricade = function(block)
	setObject(block.m, block.x, block.y, 16545)
end





checkMove = function(block, m, x, y, side)
	local x1 = x
	local y1 = y
	local x2 = x
	local y2 = y
	
	if(side==0) then
		y1=y-1
		x1=x
		y2=y+1
		x2=x
	end
	
	if(side==1) then
		x1=x+1
		y1=y
		x2=x-1
		y2=y
	end
	
	if(side==2) then
		y1=y+1
		x1=x
		y2=y-1
		x2=x
	end

	if(side==3) then
		x1=x-1
		y1=y
		x2=x+1
		y2=y
	end
	
	if (getPass(m,x1,y1) == 0) then-- and (block:objectCanMove(x2,y2,side) == true) then-- and (block:objectCanMoveFrom(x1,y1,side)==true) then
		return true
	else
		return false
	end
end





cfloor = function(m, x, y, block)
	local itemBlocks = block:getObjectsInCell(m, x, y, BL_ITEM)
	local itemReturns = {}
	
	for i = 1,#itemBlocks do
		table.insert(itemReturns, itemBlocks[i].id)
		itemBlocks[i]:delete()
	end
	
	return itemReturns
end

carea = function(blocktype, radius, shape)
	local i, h, j, x1, x2, y1, y2
	local blocks
	local x = blocktype.x
	local y = blocktype.y
	local m = blocktype.m
	if (shape == 0) then
	x1 = x - radius
	y1 = y - radius
	x2 = x + radius
	y2 = y + radius
		for i = x1,x2 do
			for h = y1,y2 do
				cfloor(m, i, h, blocktype)
			end
		end
	elseif (shape == 1) then
		if (radius == 0) then
			cfloor(m,x,y,blocktype)
		elseif (radius == 1) then
			--for loop = 0, radius do
			for i = x-1, x+1 do
				cfloor(m,i,y,blocktype)
			end
			cfloor(m,x,y+1,blocktype)
			cfloor(m,x,y-1,blocktype)
			elseif (radius == 2) then
			for i = x-radius, x+radius do
				cfloor(m,i,y,blocktype)
			end
			for i = y-radius, -1 do
				cfloor(m,x,i,blocktype)
			end
			for i = 1, y+radius do
				cfloor(m,x,i,blocktype)
			end
			x3 = x+1
			y3 = y-1
			for i = x3,x+1+radius-i do
				for h = y3, y-1-radius-h do
				end
			end
			
--			2*radius
			--end
		end
	end
end

cinv = function(player)
    local item
    for i = 0, player.maxInv do
        item = player:getInventoryItem( i )
        if (item ~= nil) then
            player:removeItem(item.id, item.amount)
        end
    end
end





distance = function(block, target)
	local dist = 0
	
	if (target == nil) then
		target = block
	end
	
	dist = dist + math.abs(block.x - target.x)
	dist = dist + math.abs(block.y - target.y)
	
	return dist
end

distanceXY = function(block, x, y)
	local dist = 0
	
	dist = dist + math.abs(block.x - x)
	dist = dist + math.abs(block.y - y)
	
	return dist
end

distanceSquare = function(block, target, dist)
	if (target == nil or dist == nil) then
		return false
	end
	
	if (math.abs(block.x - target.x) <= dist and math.abs(block.y - target.y) <= dist) then
		return true
	end
	
	return false
end

distanceSquareXY = function(block, targetX, targetY, dist)
	if (targetX == nil or targetY == nil or dist == nil) then
		return false
	end
	
	if (math.abs(block.x - targetX) <= dist and math.abs(block.y - targetY) <= dist) then
		return true
	end
	
	return false
end





findObjects = function(block, maxDist)
	local dist = 0
	local g = block:getObjectsInArea(BL_ITEM)
	local h = {}
	local x
	local target
	
	for x = 1, #g do
		target = FloorItem(g[x].ID)
		dist = distance(block, target)
		
		if (dist <= maxDist) then
			table.insert(h, g[x])
		end
	end
	
	return h
end

getTargetFacing = function(block, bltype, priority, dist)
	local objs = {}
	local target = nil
	
	if (dist == nil) then
		dist = 1
	end
	
	if (priority == nil) then
		priority = 0
	end
	
	if (block.side == 0) then
		objs = block:getObjectsInCell(block.m, block.x, block.y - dist, bltype)
	elseif (block.side == 1) then
		objs = block:getObjectsInCell(block.m, block.x + dist, block.y, bltype)
	elseif (block.side == 2) then
		objs = block:getObjectsInCell(block.m, block.x, block.y + dist, bltype)
	elseif (block.side == 3) then
		objs = block:getObjectsInCell(block.m, block.x - dist, block.y, bltype)
	end
	
	if (bltype == BL_ITEM and #objs > 0) then
		return objs[1]
	end
	
	if (bltype == BL_NPC and #objs > 0) then
		return objs[1]
	end
	
	if (#objs > 0) then
		for x = 1, #objs do
			--objs[x]:talk(0,''..objs[x].state)
			if (target == nil) then
				if (priority == 0) then
					if (objs[x].state == 0 or objs[x].state == 2 or objs[x].state == 3 or objs[x].state == 4) then
						return objs[x]
					end
				elseif (priority == 1) then
					if (objs[x].state == 1) then
						return objs[x]
					end
				elseif (priority == 2) then
					if (objs[x].state == 0 or objs[x].state == 2 or objs[x].state == 3 or objs[x].state == 4) then
						return objs[x]
					elseif (x == #objs and target == nil) then
						for x = 1, #objs do
							if (objs[x].state == 1) then
								return objs[x]
							end
						end
					end
				elseif (priority == 3) then
					if (objs[x].state == 1) then
						return objs[x]
					elseif (x == #objs and target == nil) then
						for x = 1, #objs do
							if (objs[x].state == 0 or objs[x].state == 2 or objs[x].state == 3 or objs[x].state == 4) then
								return objs[x]
							end
						end
					end
				end
			end
		end
	end
	
	return nil
end

getTargetsAround = function(block, blockType)
	local northBlocks = block:getObjectsInCell(block.m, block.x, block.y - 1, blockType)
	local eastBlocks = block:getObjectsInCell(block.m, block.x + 1, block.y, blockType)
	local southBlocks = block:getObjectsInCell(block.m, block.x, block.y + 1, blockType)
	local westBlocks = block:getObjectsInCell(block.m, block.x - 1, block.y, blockType)
	local returnTable = {}
	
	if (#northBlocks > 0) then
		for i = 1, #northBlocks do
			table.insert(returnTable, northBlocks[i])
		end
	end
	
	if (#eastBlocks > 0) then
		for i = 1, #eastBlocks do
			table.insert(returnTable, eastBlocks[i])
		end
	end
	
	if (#southBlocks > 0) then
		for i = 1, #southBlocks do
			table.insert(returnTable, southBlocks[i])
		end
	end
	
	if (#westBlocks > 0) then
		for i = 1, #westBlocks do
			table.insert(returnTable, westBlocks[i])
		end
	end
	
	return returnTable
end

getTargetXY = function(m, x, y, bltype, priority)
	local target = nil
	
	if (priority == nil) then
		priority = 0
	end
	
	local objs = block:getObjectsInCell(m, x, y, bltype)
	
	for x = 1, #objs do
		--objs[x]:talk(0,''..objs[x].state)
		if (target == nil) then
			if (priority == 0) then
				if (objs[x].state == 0 or objs[x].state == 2 or objs[x].state == 3 or objs[x].state == 4) then
					return objs[x]
				end
			elseif (priority == 1) then
				if (objs[x].state == 1) then
					return objs[x]
				end
			elseif (priority == 2) then
				if (objs[x].state == 0 or objs[x].state == 2 or objs[x].state == 3 or objs[x].state == 4) then
					return objs[x]
				elseif (x == #objs and target == nil) then
					for x = 1, #objs do
						if (objs[x].state == 1) then
							return objs[x]
						end
					end
				end
			elseif (priority == 3) then
				if (objs[x].state == 1) then
					return objs[x]
				elseif (x == #objs and target == nil) then
					for x = 1, #objs do
						if (objs[x].state == 0 or objs[x].state == 2 or objs[x].state == 3 or objs[x].state == 4) then
							return objs[x]
						end
					end
				end
			end
		end
	end
	
	return nil
end





toStart = function(mob, x, y)
	local canmove = 0
	local found = 0
	local checkmove = math.random(0,2)
	
	if(checkmove >= 1) then
		if(mob.y < y) then
			mob.side = 2
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.y > y and canmove == 0) then
			mob.side = 0
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.x < x and canmove == 0) then
			mob.side = 1
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.x > x and canmove == 0) then
			mob.side = 3
			mob:sendSide()
			canmove = mob:move()
		end
	else
		if(mob.x < x) then
			mob.side = 1
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.x > x and canmove == 0) then
			mob.side = 3
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.y < y and canmove == 0) then
			mob.side = 2
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.y > y and canmove == 0) then
			mob.side = 0
			mob:sendSide()
			canmove = mob:move()
		end
	end
	
	if(mob.x == x and mob.y == y) then
		return true
	elseif(canmove == 0) then
		for i=0,10 do
			if(found == 0) then
				mob.side=math.random(0,3)
				mob:sendSide()
				found=mob:move()
			end
		end
	end
end

toObject = function(mob, object)
	local canmove = 0
	local found = 0
	local checkmove = math.random(0,2)
	
	if(checkmove >= 1) then
		if(mob.y < object.y) then
			mob.side = 2
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.y > object.y and canmove == 0) then
			mob.side = 0
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.x < object.x and canmove == 0) then
			mob.side = 1
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.x > object.x and canmove == 0) then
			mob.side = 3
			mob:sendSide()
			canmove = mob:move()
		end
	else
		if(mob.x < object.x) then
			mob.side = 1
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.x > object.x and canmove == 0) then
			mob.side = 3
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.y < object.y and canmove == 0) then
			mob.side = 2
			mob:sendSide()
			canmove = mob:move()
		end
		if(mob.y > object.y and canmove == 0) then
			mob.side = 0
			mob:sendSide()
			canmove = mob:move()
		end
	end
	
	if(mob.x == object.x and mob.y == object.y) then
		return true
	elseif(canmove == 0) then
		for i=0,10 do
			if(found == 0) then
				mob.side=math.random(0,3)
				mob:sendSide()
				found=mob:move()
			end
		end
	end
end

toXY = function(block, x, y)
	local canmove = 0
	local found = 0
	local checkmove = math.random(0,2)
	
	if (checkmove >= 1) then
		if (block.y < y) then
			block.side = 2
			block:sendSide()
			canmove = block:move()
		end
		if (block.y > y and canmove == 0) then
			block.side = 0
			block:sendSide()
			canmove = block:move()
		end
		if (block.x < x and canmove == 0) then
			block.side = 1
			block:sendSide()
			canmove = block:move()
		end
		if (block.x > x and canmove == 0) then
			block.side = 3
			block:sendSide()
			canmove = block:move()
		end
	else
		if (block.x < x) then
			block.side = 1
			block:sendSide()
			canmove = block:move()
		end
		if(block.x > x and canmove == 0) then
			block.side = 3
			block:sendSide()
			canmove = block:move()
		end
		if (block.y < y and canmove == 0) then
			block.side = 2
			block:sendSide()
			canmove = block:move()
		end
		if (block.y > y and canmove == 0) then
			block.side = 0
			block:sendSide()
			canmove = block:move()
		end
	end
	
	if (block.x == x and block.y == y) then
		return true
	elseif (canmove == 0) then
		for i = 0, 10 do
			if (found == 0) then
				block.side = math.random(0,3)
				block:sendSide()
				found = block:move()
			end
		end
	end
end





getHalfSide = function(block)

	local side = block.side
	local sides = {}
	--local ans
	if (side == 0) then
		sides = {3, 0, 1}
	elseif (side == 1) then
		sides = {0, 1, 2}
	elseif (side == 2) then
		sides = {1, 2, 3}
	elseif (side == 3) then
		sides = {2, 3, 0}
	end
	
	return sides
	
end

faceAway=function(block1,thirdparam)
	local side1 = block1.side
	--local side2 = block2.side
	
		
	if (thirdparam ~= nil) then
		local block2 = {}
		if (side1 == 0) then--up
			block2tab = block1:getObjectsInCell(block1.m, block1.x, block1.y - 1, BL_PC)
			if (#block2tab > 0) then
				block2 = block2tab[#block2tab]
			else
				return
			end
			block2.side = 0
		elseif (side1 == 1) then--right
			block2tab = block1:getObjectsInCell(block1.m, block1.x + 1, block1.y, BL_PC)
			if (#block2tab > 0) then
				block2 = block2tab[#block2tab]
			else
				return
			end
			block2.side = 1
		elseif (side1 == 2) then--down
			block2tab = block1:getObjectsInCell(block1.m, block1.x, block1.y + 1, BL_PC)
			if (#block2tab > 0) then
				block2 = block2tab[#block2tab]
			else
				return
			end
			block2.side = 2
		elseif (side1 == 3) then--left
			block2tab = block1:getObjectsInCell(block1.m, block1.x - 1, block1.y, BL_PC)
			if (#block2tab > 0) then
				block2 = block2tab[#block2tab]
			else
				return
			end
			block2.side = 3
		end
	else
	
	end
	
	
	block2:sendSide()
end





curT=function()
	timemark = "(Sento "..curYear()..", "..getCurSeason()..")"
	return timemark
end





getDirection = function(block1, block2)
	local block1x = block1.x
	local block1y = block1.y
	local block2x = block2.x
	local block2y = block2.y
	local x = math.abs(block2x - block1x)
	local y = math.abs(block2y - block1y)
	local str = ""
	local quadrant
	
	if (block1x == block2x) and (block1y == block2y) then
		str = "error"
	end
	
	if (block1x > block2x) and (block1y > block2y) then
		quadrant = 4
	elseif (block1x < block2x) and (block1y < block2y) then
		quadrant = 2
	elseif (block1x < block2x) and (block1y > block2y) then
		quadrant = 3
	elseif (block1x > block2x) and (block1y < block2y) then
		quadrant = 1
	elseif (block1x == block2x) then
		if (block1y > block2y) then
			str = "north"
		elseif (block1y < block2y) then
			str = "south"
		end
	elseif (block1y == block2y) then
		if (block1x > block2x) then
			str = "west"
		elseif (block1x < block2x) then
			str = "east"
		end
	end
	
	local angle = math.deg(math.atan(y / x))
	--angle = math.abs(angle)
	if (quadrant == 1) then--67.5 22.5
		if (angle >= 60) then
			str = "south"
		elseif (angle < 60) and (angle > 30) then
			str = "south west"
		elseif (angle <= 30) then
			str = "west"
		end
	elseif (quadrant == 2) then
		if (angle >= 60) then
			str = "south"
		elseif (angle < 60) and (angle > 30) then
			str = "south east"
		elseif (angle <= 30) then
			str = "east"
		end
	elseif (quadrant == 3) then
		if (angle >= 60) then
			str = "north"
		elseif (angle < 60) and (angle > 30) then
			str = "north east"
		elseif (angle <= 30) then
			str = "east"
		end
	elseif (quadrant == 4) then
		if (angle >= 60) then
			str = "north"
		elseif (angle < 60) and (angle > 30) then
			str = "north west"
		elseif (angle <= 30) then
			str = "west"
		end
	end
	
	--broadcast(-1, block1.name..": "..block2.name.." is "..str.." of me.")
	return str
end

getAngle = function(block1, block2)
	local x = block2.x - block1.x
	local y = block2.y - block1.y
	local angle = math.deg(math.atan(y / x))
	
	if (x == 0 and y == 0) then
		angle = 9001
	elseif ((x >= 0 and y < 0) or (x > 0 and y <= 0)) then
		angle = math.abs(angle)
	elseif ((x <= 0 and y < 0) or (x < 0 and y <= 0)) then
		angle = 180 - angle
	elseif ((x <= 0 and y > 0) or (x < 0 and y >= 0)) then
		angle = 180 + math.abs(angle)
	elseif ((x >= 0 and y > 0) or (x > 0 and y >= 0)) then
		angle = 360 - angle
	end
	
	--broadcast(-1, ""..angle)
	return angle
end

getAngleXY = function(block, targetX, targetY)
	local x = targetX - block.x
	local y = targetY - block.y
	local angle = math.deg(math.atan(y / x))
	
	if (x == 0 and y == 0) then
		angle = 9001
	elseif ((x >= 0 and y < 0) or (x > 0 and y <= 0)) then
		angle = math.abs(angle)
	elseif ((x <= 0 and y < 0) or (x < 0 and y <= 0)) then
		angle = 180 - angle
	elseif ((x <= 0 and y > 0) or (x < 0 and y >= 0)) then
		angle = 180 + math.abs(angle)
	elseif ((x >= 0 and y > 0) or (x > 0 and y >= 0)) then
		angle = 360 - angle
	end
	
	--broadcast(-1, ""..angle)
	return angle
end





addSpotTrap = function(block, map, x, y)
	local spotTrap
	local trapLayed = false
	
	if (map ~= nil and x ~= nil and y ~= nil) then
		spotTrap = block:getObjectsInCell(map, x, y, BL_ITEM)
	else
		spotTrap = block:getObjectsInCell(block.m, block.x, block.y, BL_ITEM)
	end
	
	if (#spotTrap > 0) then
		for i = 1, #spotTrap do
			if (spotTrap[i].id == 130) then
				trapLayed = true
				break
			end
		end
	end
	
	if (not trapLayed) then
		if (map ~= nil and x ~= nil and y ~= nil) then
			block:dropItemXY(130, 1, map, x, y)
		else
			block:dropItem(130, 1)
		end
	end
end

removeTrap = function(npc)
	local npcBlocks = npc:getObjectsInCellWithTraps(npc.m, npc.x, npc.y, BL_NPC)
	local itemBlocks = npc:getObjectsInCellWithTraps(npc.m, npc.x, npc.y, BL_ITEM)
	local blockCount
	local h
	
	if (#npcBlocks == 1) then
		for i = 1, #itemBlocks do
			if (itemBlocks[i].type == 20) then
				itemBlocks[i]:delete()
			end
		end
	elseif (#npcBlocks > 1) then
		for i = 1, #npcBlocks do
			blockCount = i
			
			if (npcBlocks[i].ID ~= npc.ID and npcBlocks[i].subType == 2) then
				break
			elseif (blockCount == #npcBlocks and #itemBlocks > 0) then
				for h = 1, #itemBlocks do
					if (itemBlocks[h].type == 20) then
						itemBlocks[h]:delete()
					end
				end
			end
		end
	end
	
	npc:delete()
end






objBrowser = function()
	if (getObject(10000,1,11) > 0) then
		return
	end	
	local x = 1
	local y = 11
	for i = 0,19543 do
		setObject(10000,x+i,y,1+i)
	end
	for x = 0,19543 do
		for y = 9,12 do
			setTile(10000,x,y,10727)
		end
	end
end

tileBrowser = function()
	if (getTile(10001,1,1) > 0) then
		return
	end	
	local x, y, z
	
	for x = 1, 4800 do
		for y = 1, 11 do
			setTile(10001, x, y, ((y - 1) + ((x - 1) * 11)))
		end
	end
end






getSide = function(block, target)
	local direction = getDirection(block, target)
	
	if (direction == "north" or direction == "north east") then
		return 0
	elseif (direction == "east" or direction == "south east") then
		return 1
	elseif (direction == "south" or direction == "south west") then
		return 2
	elseif (direction == "west" or direction == "north west") then
		return 3
	else
		return nil
	end
end

canMove = function(block)
	local checkPCNorth = block:getObjectsInCell(block.m, block.x, block.y - 1, BL_PC)
	local checkblockNorth = block:getObjectsInCell(block.m, block.x, block.y - 1, BL_MOB)
	local checkNPCNorth = block:getObjectsInCell(block.m, block.x, block.y - 1, BL_NPC)
	
	local checkPCEast = block:getObjectsInCell(block.m, block.x + 1, block.y, BL_PC)
	local checkblockEast = block:getObjectsInCell(block.m, block.x + 1, block.y, BL_MOB)
	local checkNPCEast = block:getObjectsInCell(block.m, block.x + 1, block.y, BL_NPC)
	
	local checkPCWest = block:getObjectsInCell(block.m, block.x - 1, block.y, BL_PC)
	local checkblockWest = block:getObjectsInCell(block.m, block.x - 1, block.y, BL_MOB)
	local checkNPCWest = block:getObjectsInCell(block.m, block.x - 1, block.y, BL_NPC)

	local checkPCSouth = block:getObjectsInCell(block.m, block.x, block.y + 1, BL_PC)
	local checkblockSouth = block:getObjectsInCell(block.m, block.x, block.y + 1, BL_MOB)
	local checkNPCSouth = block:getObjectsInCell(block.m, block.x, block.y + 1, BL_NPC)

	if (#checkNPCNorth > 0) then
		i = 0
		
		repeat
			i = i + 1
			
			if (checkNPCNorth[i] ~= nil and (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3)) then
				table.remove(checkNPCNorth, i)
				i = i - 1
			end
		until (i == #checkNPCNorth)
	end
	
	if (#checkNPCEast > 0) then
		i = 0
		
		repeat
			i = i + 1
			
			if (checkNPCEast[i] ~= nil and (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3)) then
				table.remove(checkNPCEast, i)
				i = i - 1
			end
		until (i == #checkNPCEast)
	end
	
	if (#checkNPCWest > 0) then
		i = 0
		
		repeat
			i = i + 1
			
			if (checkNPCWest[i] ~= nil and (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3)) then
				table.remove(checkNPCWest, i)
				i = i - 1
			end
		until (i == #checkNPCWest)
	end
	
	if (#checkNPCSouth > 0) then
		i = 0
		
		repeat
			i = i + 1
			
			if (checkNPCSouth[i] ~= nil and (checkNPCSouth[i].subType == 2 or checkNPCSouth[i].subType == 3)) then
				table.remove(checkNPCSouth, i)
				i = i - 1
			end
		until (i == #checkNPCSouth)
	end
	
	if (block.y - 1 > 0 and #checkPCNorth + #checkblockNorth + #checkNPCNorth == 0 and block:objectCanMove(block.x, block.y - 1, 0) == true and getPass(block.m, block.x, block.y - 1) == 0 ) then
		return true
	elseif (block.x + 1 <= block.xmax and #checkPCEast + #checkblockEast + #checkNPCEast == 0 and block:objectCanMove(block.x + 1, block.y, 1) == true and getPass(block.m, block.x + 1, block.y) == 0) then
		return true
	elseif (block.x - 1 > 0 and #checkPCWest + #checkblockWest + #checkNPCWest == 0 and block:objectCanMove(block.x - 1, block.y, 3) == true and getPass(block.m, block.x - 1, block.y) == 0) then
		return true
	elseif (block.y + 1 <= block.ymax and #checkPCSouth + #checkblockSouth + #checkNPCSouth == 0 and block:objectCanMove(block.x, block.y + 1, 2) == true and getPass(block.m, block.x, block.y + 1) == 0) then
		return true
	else
		return false
	end
end

pushBack = function(player)
	if (player.side == 0) then
		player:warp(player.m, player.x, player.y + 1)
	elseif (player.side == 1) then
		player:warp(player.m, player.x - 1, player.y)
	elseif (player.side == 2) then
		player:warp(player.m, player.x, player.y - 1)
	elseif (player.side == 3) then
		player:warp(player.m, player.x + 1, player.y)
	end
end

canPush = function(block, target, push)
	if (target == nil) then
		return nil
	elseif (target.blType == BL_NPC and (target.subType == 2 or target.subType == 3)) then
		return false
	elseif (target.blType == BL_ITEM) then
		return false
	elseif (target:getObjectsInCell(target.m, target.x, target.y, BL_ITEM)[1] ~= nil) then
		return false
	end
	
	if (block.side == 0) then
		local checkPCNorth = block:getObjectsInCell(block.m, block.x, block.y - 2, BL_PC)
		local checkMobNorth = block:getObjectsInCell(block.m, block.x, block.y - 2, BL_MOB)
		local checkNPCNorth = block:getObjectsInCell(block.m, block.x, block.y - 2, BL_NPC)
		
		local checkPCEast = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_PC)
		local checkMobEast = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_MOB)
		local checkNPCEast = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_NPC)
		
		local checkPCWest = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_PC)
		local checkMobWest = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_MOB)
		local checkNPCWest = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_NPC)

		if (#checkNPCNorth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			until (i == #checkNPCNorth)
		end
		
		if (#checkNPCEast > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3) then
					table.remove(checkNPCEast, i)
					i = i - 1
				end
			until (i == #checkNPCEast)
		end
		
		if (#checkNPCWest > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3) then
					table.remove(checkNPCWest, i)
					i = i - 1
				end
			until (i == #checkNPCWest)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCNorth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCNorth[i].state == 1) then
						table.remove(checkPCNorth, i)
						i = i - 1
					end
				until (i == #checkPCNorth)
			end
			
			if (#checkPCEast > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCEast[i].state == 1) then
						table.remove(checkPCEast, i)
						i = i - 1
					end
				until (i == #checkPCEast)
			end
			
			if (#checkPCWest > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCWest[i].state == 1) then
						table.remove(checkPCWest, i)
						i = i - 1
					end
				until (i == #checkPCWest)
			end
		end
		
		if (block.y - 2 > 0 and #checkPCNorth + #checkMobNorth + #checkNPCNorth == 0 and block:objectCanMove(block.x, block.y - 2, 0) == true and getPass(block.m, block.x, block.y - 2) == 0 and  not getWarp(block.m, block.x, block.y -2 )) then
			if (push == nil) then
				target:warp(block.m, block.x, block.y - 2)
			else
				return true
			end
		elseif (block.x + 1 <= block.xmax and #checkPCEast + #checkMobEast + #checkNPCEast == 0 and block:objectCanMove(block.x + 1, block.y - 1, 1) == true and getPass(block.m, block.x + 1, block.y - 1) == 0 and not getWarp(block.m, block.x + 1, block.y - 1)) then
			if (push == nil) then
				target:warp(block.m, block.x + 1, block.y - 1)
			else
				return true
			end
		elseif (block.x - 1 > 0 and #checkPCWest + #checkMobWest + #checkNPCWest == 0 and block:objectCanMove(block.x - 1, block.y - 1, 3) == true and getPass(block.m, block.x - 1, block.y - 1) == 0 and not getWarp(block.m, block.x - 1, block.y - 1)) then
			if (push == nil) then
				target:warp(block.m, block.x - 1, block.y - 1)
			else
				return true
			end
		else
			return false
		end
	elseif (block.side == 1) then
		local checkPCEast = block:getObjectsInCell(block.m, block.x + 2, block.y, BL_PC)
		local checkMobEast = block:getObjectsInCell(block.m, block.x + 2, block.y, BL_MOB)
		local checkNPCEast = block:getObjectsInCell(block.m, block.x + 2, block.y, BL_NPC)

		local checkPCNorth = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_PC)
		local checkMobNorth = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_MOB)
		local checkNPCNorth = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_NPC)

		local checkPCSouth = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_PC)
		local checkMobSouth = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_MOB)
		local checkNPCSouth = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_NPC)

		if (#checkNPCNorth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			until (i == #checkNPCNorth)
		end
		
		if (#checkNPCEast > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3) then
					table.remove(checkNPCEast, i)
					i = i - 1
				end
			until (i == #checkNPCEast)
		end
		
		if (#checkNPCSouth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCSouth[i].subType == 2 or checkNPCSouth[i].subType == 3) then
					table.remove(checkNPCSouth, i)
					i = i - 1
				end
			until (i == #checkNPCSouth)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCNorth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCNorth[i].state == 1) then
						table.remove(checkPCNorth, i)
						i = i - 1
					end
				until (i == #checkPCNorth)
			end
			
			if (#checkPCSouth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCSouth[i].state == 1) then
						table.remove(checkPCSouth, i)
						i = i - 1
					end
				until (i == #checkPCSouth)
			end
			
			if (#checkPCEast > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCEast[i].state == 1) then
						table.remove(checkPCEast, i)
						i = i - 1
					end
				until (i == #checkPCEast)
			end
		end
		
		if (block.x + 2 <= block.xmax and #checkPCEast + #checkMobEast + #checkNPCEast == 0 and block:objectCanMove(block.x + 2, block.y, 1) == true and getPass(block.m, block.x + 2, block.y) == 0 and not getWarp(block.m, block.x + 2, block.y)) then
			if (push == nil) then
				target:warp(block.m, block.x + 2, block.y)
			else
				return true
			end
		elseif (block.y - 1 > 0 and #checkPCNorth + #checkMobNorth + #checkNPCNorth == 0 and block:objectCanMove(block.x + 1, block.y - 1, 0) == true and getPass(block.m, block.x + 1, block.y - 1) == 0 and not getWarp(block.m, block.x + 1, block.y - 1)) then
			if (push == nil) then
				target:warp(block.m, block.x + 1, block.y - 1)
			else
				return true
			end
		elseif (block.y + 1 <= block.ymax and #checkPCSouth + #checkMobSouth + #checkNPCSouth == 0 and block:objectCanMove(block.x + 1, block.y + 1, 2) == true and getPass(block.m, block.x + 1, block.y + 1) == 0 and not getWarp(block.m, block.x + 1, block.y + 1)) then
			if (push == nil) then
				target:warp(block.m, block.x + 1, block.y + 1)
			else
				return true
			end
		else
			return false
		end
	elseif (block.side == 2) then
		local checkPCSouth = block:getObjectsInCell(block.m, block.x, block.y + 2, BL_PC)
		local checkMobSouth = block:getObjectsInCell(block.m, block.x, block.y + 2, BL_MOB)
		local checkNPCSouth = block:getObjectsInCell(block.m, block.x, block.y + 2, BL_NPC)

		local checkPCEast = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_PC)
		local checkMobEast = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_MOB)
		local checkNPCEast = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_NPC)

		local checkPCWest = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_PC)
		local checkMobWest = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_MOB)
		local checkNPCWest = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_NPC)

		if (#checkNPCSouth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCSouth[i].subType == 2 or checkNPCSouth[i].subType == 3) then
					table.remove(checkNPCSouth, i)
					i = i - 1
				end
			until (i == #checkNPCSouth)
		end
		
		if (#checkNPCEast > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3) then
					table.remove(checkNPCEast, i)
					i = i - 1
				end
			until (i == #checkNPCEast)
		end
		
		if (#checkNPCWest > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3) then
					table.remove(checkNPCWest, i)
					i = i - 1
				end
			until (i == #checkNPCWest)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCEast > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCEast[i].state == 1) then
						table.remove(checkPCEast, i)
						i = i - 1
					end
				until (i == #checkPCEast)
			end
			
			if (#checkPCSouth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCSouth[i].state == 1) then
						table.remove(checkPCSouth, i)
						i = i - 1
					end
				until (i == #checkPCSouth)
			end
			
			if (#checkPCWest > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCWest[i].state == 1) then
						table.remove(checkPCWest, i)
						i = i - 1
					end
				until (i == #checkPCWest)
			end
		end
		
		if (block.y + 2 <= block.ymax and #checkPCSouth + #checkMobSouth + #checkNPCSouth == 0 and block:objectCanMove(block.x, block.y + 2, 2) == true and getPass(block.m, block.x, block.y + 2) == 0 and not getWarp(block.m, block.x, block.y + 2)) then
			if (push == nil) then
				target:warp(block.m, block.x, block.y + 2)
			else
				return true
			end
		elseif (block.x + 1 <= block.xmax and #checkPCEast + #checkMobEast + #checkNPCEast == 0 and block:objectCanMove(block.x + 1, block.y + 1, 1) == true and getPass(block.m, block.x + 1, block.y + 1) == 0 and not getWarp(block.m, block.x + 1, block.y + 1)) then
			if (push == nil) then
				target:warp(block.m, block.x + 1, block.y + 1)
			else
				return true
			end
		elseif (block.x - 1 > 0 and #checkPCWest + #checkMobWest + #checkNPCWest == 0 and block:objectCanMove(block.x - 1, block.y + 1, 3) == true and getPass(block.m, block.x - 1, block.y + 1) == 0 and not getWarp(block.m, block.x - 1, block.y + 1)) then
			if (push == nil) then
				target:warp(block.m, block.x - 1, block.y + 1)
			else
				return true
			end
		else
			return false
		end
	elseif (block.side == 3) then
		local checkPCWest = block:getObjectsInCell(block.m, block.x - 2, block.y, BL_PC)
		local checkMobWest = block:getObjectsInCell(block.m, block.x - 2, block.y, BL_MOB)
		local checkNPCWest = block:getObjectsInCell(block.m, block.x - 2, block.y, BL_NPC)
		
		local checkPCNorth = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_PC)
		local checkMobNorth = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_MOB)
		local checkNPCNorth = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_NPC)
		
		local checkPCSouth = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_PC)
		local checkMobSouth = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_MOB)
		local checkNPCSouth = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_NPC)

		if (#checkNPCNorth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			until (i == #checkNPCNorth)
		end
		
		if (#checkNPCSouth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCSouth[i].subType == 2 or checkNPCSouth[i].subType == 3) then
					table.remove(checkNPCSouth, i)
					i = i - 1
				end
			until (i == #checkNPCSouth)
		end
		
		if (#checkNPCWest > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3) then
					table.remove(checkNPCWest, i)
					i = i - 1
				end
			until (i == #checkNPCWest)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCNorth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCNorth[i].state == 1) then
						table.remove(checkPCNorth, i)
						i = i - 1
					end
				until (i == #checkPCNorth)
			end
			
			if (#checkPCSouth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCSouth[i].state == 1) then
						table.remove(checkPCSouth, i)
						i = i - 1
					end
				until (i == #checkPCSouth)
			end
			
			if (#checkPCWest > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCWest[i].state == 1) then
						table.remove(checkPCWest, i)
						i = i - 1
					end
				until (i == #checkPCWest)
			end
		end
		
		if(block.x - 2 > 0 and #checkPCWest + #checkMobWest + #checkNPCWest == 0 and block:objectCanMove(block.x - 2, block.y, 3) == true and getPass(block.m, block.x - 2, block.y) == 0 and not getWarp(block.m, block.x - 2, block.y)) then
			if (push == nil) then
				target:warp(block.m, block.x - 2, block.y)
			else
				return true
			end
		elseif (block.y - 1 > 0 and #checkPCNorth + #checkMobNorth + #checkNPCNorth == 0 and block:objectCanMove(block.x - 1, block.y - 1, 0) == true and getPass(block.m, block.x - 1, block.y - 1) == 0 and not getWarp(block.m, block.x - 1, block.y - 1)) then
			if (push == nil) then
				target:warp(block.m, block.x - 1, block.y - 1)
			else
				return true
			end
		elseif (block.y + 1 <= block.ymax and #checkPCSouth + #checkMobSouth + #checkNPCSouth == 0 and block:objectCanMove(block.x - 1, block.y + 1, 2) == true and getPass(block.m, block.x - 1, block.y + 1) == 0 and not getWarp(block.m, block.x - 1, block.y + 1)) then
			if (push == nil) then
				target:warp(block.m, block.x - 1, block.y + 1)
			else
				return true
			end
		else
			return false
		end
	end	
	
	return false
end

canAmbush = function(block, target, ambush)
	if (target == nil) then
		return nil
	elseif (target.blType == BL_NPC and (target.subType == 2 or target.subType == 3)) then
		return false
	elseif (target.blType == BL_ITEM) then
		return false
	end
	
	if (target.blType == BL_MOB and target.mobID >= 1000000 and target.mobID <= 2000000) then
		return false
	end
	
	if (block.side == 0) then
		local checkPCNorth = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_PC)
		local checkMobNorth = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_MOB)
		local checkNPCNorth = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_NPC)
		
		local checkPCEast = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_PC)
		local checkMobEast = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_MOB)
		local checkNPCEast = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_NPC)
		
		local checkPCWest = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_PC)
		local checkMobWest = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_MOB)
		local checkNPCWest = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_NPC)

		if (#checkNPCNorth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			until (i == #checkNPCNorth)
		end
		
		if (#checkNPCEast > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3) then
					table.remove(checkNPCEast, i)
					i = i - 1
				end
			until (i == #checkNPCEast)
		end
		
		if (#checkNPCWest > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3) then
					table.remove(checkNPCWest, i)
					i = i - 1
				end
			until (i == #checkNPCWest)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCNorth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCNorth[i].state == 1) then
						table.remove(checkPCNorth, i)
						i = i - 1
					end
				until (i == #checkPCNorth)
			end
			
			if (#checkPCEast > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCEast[i].state == 1) then
						table.remove(checkPCEast, i)
						i = i - 1
					end
				until (i == #checkPCEast)
			end
			
			if (#checkPCWest > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCWest[i].state == 1) then
						table.remove(checkPCWest, i)
						i = i - 1
					end
				until (i == #checkPCWest)
			end
		end
		
		if (target.y - 1 > 0 and #checkPCNorth + #checkMobNorth + #checkNPCNorth == 0 and target:objectCanMove(target.x, target.y - 1, 0) and target:objectCanMoveFrom(target.x, target.y, 0) and getPass(target.m, target.x, target.y - 1) == 0 and not getWarp(target.m, target.x, target.y - 1)) then
			if (ambush == nil) then
				block.side = 2
				block:sendSide()
				block:warp(target.m, target.x, target.y - 1)
				return true
			else
				return true
			end
		elseif (target.x + 1 <= block.xmax and #checkPCEast + #checkMobEast + #checkNPCEast == 0 and target:objectCanMove(target.x + 1, target.y, 1) and target:objectCanMoveFrom(target.x, target.y, 1) and getPass(target.m, target.x + 1, target.y) == 0 and not getWarp(target.m, target.x + 1, target.y)) then
			if (ambush == nil) then
				block.side = 3
				block:sendSide()
				block:warp(target.m, target.x + 1, target.y)
				return true
			else
				return true
			end
		elseif (target.x - 1 > 0 and #checkPCWest + #checkMobWest + #checkNPCWest == 0 and target:objectCanMove(target.x - 1, target.y, 3) and target:objectCanMoveFrom(target.x, target.y, 3) and getPass(target.m, target.x - 1, target.y) == 0 and not getWarp(target.m, target.x - 1, target.y)) then
			if (ambush == nil) then
				block.side = 1
				block:sendSide()
				block:warp(target.m, target.x - 1, target.y)
				return true
			else
				return true
			end
		else
			return false
		end
	elseif (block.side == 1) then
		local checkPCEast = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_PC)
		local checkMobEast = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_MOB)
		local checkNPCEast = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_NPC)

		local checkPCNorth = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_PC)
		local checkMobNorth = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_MOB)
		local checkNPCNorth = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_NPC)

		local checkPCSouth = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_PC)
		local checkMobSouth = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_MOB)
		local checkNPCSouth = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_NPC)

		if (#checkNPCNorth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			until (i == #checkNPCNorth)
		end
		
		if (#checkNPCEast > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3) then
					table.remove(checkNPCEast, i)
					i = i - 1
				end
			until (i == #checkNPCEast)
		end
		
		if (#checkNPCSouth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCSouth[i].subType == 2 or checkNPCSouth[i].subType == 3) then
					table.remove(checkNPCSouth, i)
					i = i - 1
				end
			until (i == #checkNPCSouth)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCNorth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCNorth[i].state == 1) then
						table.remove(checkPCNorth, i)
						i = i - 1
					end
				until (i == #checkPCNorth)
			end
			
			if (#checkPCSouth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCSouth[i].state == 1) then
						table.remove(checkPCSouth, i)
						i = i - 1
					end
				until (i == #checkPCSouth)
			end
			
			if (#checkPCEast > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCEast[i].state == 1) then
						table.remove(checkPCEast, i)
						i = i - 1
					end
				until (i == #checkPCEast)
			end
		end
		
		if (target.x + 1 <= block.xmax and #checkPCEast + #checkMobEast + #checkNPCEast == 0 and target:objectCanMove(target.x + 1, target.y, 1) and target:objectCanMoveFrom(target.x, target.y, 1) and getPass(target.m, target.x + 1, target.y) == 0 and not getWarp(target.m, target.x + 1, target.y)) then
			if (ambush == nil) then
				block.side = 3
				block:sendSide()
				block:warp(target.m, target.x + 1, target.y)
				return true
			else
				return true
			end
		elseif (target.y - 1 > 0 and #checkPCNorth + #checkMobNorth + #checkNPCNorth == 0 and target:objectCanMove(target.x, target.y - 1, 0) and target:objectCanMoveFrom(target.x, target.y, 0) and getPass(target.m, target.x, target.y - 1) == 0 and not getWarp(target.m, target.x, target.y - 1)) then
			if (ambush == nil) then
				block.side = 2
				block:sendSide()
				block:warp(target.m, target.x, target.y - 1)
				return true
			else
				return true
			end
		elseif (target.y + 1 <= block.ymax and #checkPCSouth + #checkMobSouth + #checkNPCSouth == 0 and target:objectCanMove(target.x, target.y + 1, 2) and target:objectCanMoveFrom(target.x, target.y, 2) and getPass(target.m, target.x, target.y + 1) == 0 and not getWarp(target.m, target.x, target.y + 1)) then
			if (ambush == nil) then
				block.side = 0
				block:sendSide()
				block:warp(target.m, target.x, target.y + 1)
				return true
			else
				return true
			end
		else
			return false
		end
	elseif (block.side == 2) then
		local checkPCSouth = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_PC)
		local checkMobSouth = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_MOB)
		local checkNPCSouth = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_NPC)

		local checkPCEast = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_PC)
		local checkMobEast = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_MOB)
		local checkNPCEast = target:getObjectsInCell(target.m, target.x + 1, target.y, BL_NPC)

		local checkPCWest = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_PC)
		local checkMobWest = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_MOB)
		local checkNPCWest = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_NPC)

		if (#checkNPCSouth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCSouth[i].subType == 2 or checkNPCSouth[i].subType == 3) then
					table.remove(checkNPCSouth, i)
					i = i - 1
				end
			until (i == #checkNPCSouth)
		end
		
		if (#checkNPCEast > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3) then
					table.remove(checkNPCEast, i)
					i = i - 1
				end
			until (i == #checkNPCEast)
		end
		
		if (#checkNPCWest > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3) then
					table.remove(checkNPCWest, i)
					i = i - 1
				end
			until (i == #checkNPCWest)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCEast > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCEast[i].state == 1) then
						table.remove(checkPCEast, i)
						i = i - 1
					end
				until (i == #checkPCEast)
			end
			
			if (#checkPCSouth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCSouth[i].state == 1) then
						table.remove(checkPCSouth, i)
						i = i - 1
					end
				until (i == #checkPCSouth)
			end
			
			if (#checkPCWest > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCWest[i].state == 1) then
						table.remove(checkPCWest, i)
						i = i - 1
					end
				until (i == #checkPCWest)
			end
		end
		
		if (target.y + 1 <= block.ymax and #checkPCSouth + #checkMobSouth + #checkNPCSouth == 0 and target:objectCanMove(target.x, target.y + 1, 2) and target:objectCanMoveFrom(target.x, target.y, 2) and getPass(target.m, target.x, target.y + 1) == 0 and not getWarp(target.m, target.x, target.y + 1)) then
			if (ambush == nil) then
				block.side = 0
				block:sendSide()
				block:warp(target.m, target.x, target.y + 1)
				return true
			else
				return true
			end
		elseif (target.x + 1 <= block.xmax and #checkPCEast + #checkMobEast + #checkNPCEast == 0 and target:objectCanMove(target.x + 1, target.y, 1) and target:objectCanMoveFrom(target.x, target.y, 1) and getPass(target.m, target.x + 1, target.y) == 0 and not getWarp(target.m, target.x + 1, target.y)) then
			if (ambush == nil) then
				block.side = 3
				block:sendSide()
				block:warp(target.m, target.x + 1, target.y)
				return true
			else
				return true
			end
		elseif (target.x - 1 > 0 and #checkPCWest + #checkMobWest + #checkNPCWest == 0 and target:objectCanMove(target.x - 1, target.y, 3) and target:objectCanMoveFrom(target.x, target.y, 3) and getPass(target.m, target.x - 1, target.y) == 0 and not getWarp(target.m, target.x - 1, target.y)) then
			if (ambush == nil) then
				block.side = 1
				block:sendSide()
				block:warp(target.m, target.x - 1, target.y)
				return true
			else
				return true
			end
		else
			return false
		end
	elseif (block.side == 3) then
		local checkPCWest = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_PC)
		local checkMobWest = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_MOB)
		local checkNPCWest = target:getObjectsInCell(target.m, target.x - 1, target.y, BL_NPC)
		
		local checkPCNorth = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_PC)
		local checkMobNorth = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_MOB)
		local checkNPCNorth = target:getObjectsInCell(target.m, target.x, target.y - 1, BL_NPC)
		
		local checkPCSouth = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_PC)
		local checkMobSouth = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_MOB)
		local checkNPCSouth = target:getObjectsInCell(target.m, target.x, target.y + 1, BL_NPC)

		if (#checkNPCNorth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			until (i == #checkNPCNorth)
		end
		
		if (#checkNPCSouth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCSouth[i].subType == 2 or checkNPCSouth[i].subType == 3) then
					table.remove(checkNPCSouth, i)
					i = i - 1
				end
			until (i == #checkNPCSouth)
		end
		
		if (#checkNPCWest > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3) then
					table.remove(checkNPCWest, i)
					i = i - 1
				end
			until (i == #checkNPCWest)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCNorth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCNorth[i].state == 1) then
						table.remove(checkPCNorth, i)
						i = i - 1
					end
				until (i == #checkPCNorth)
			end
			
			if (#checkPCSouth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCSouth[i].state == 1) then
						table.remove(checkPCSouth, i)
						i = i - 1
					end
				until (i == #checkPCSouth)
			end
			
			if (#checkPCWest > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCWest[i].state == 1) then
						table.remove(checkPCWest, i)
						i = i - 1
					end
				until (i == #checkPCWest)
			end
		end
		
		if (target.x - 1 > 0 and #checkPCWest + #checkMobWest + #checkNPCWest == 0 and target:objectCanMove(target.x - 1, target.y, 3) and target:objectCanMoveFrom(target.x, target.y, 3) and getPass(target.m, target.x - 1, target.y) == 0 and not getWarp(target.m, target.x - 1, target.y)) then
			if (ambush == nil) then
				block.side = 1
				block:sendSide()
				block:warp(target.m, target.x - 1, target.y)
				return true
			else
				return true
			end
		elseif (target.y - 1 > 0 and #checkPCNorth + #checkMobNorth + #checkNPCNorth == 0 and target:objectCanMove(target.x, target.y - 1, 0) and target:objectCanMoveFrom(target.x, target.y, 0) and getPass(target.m, target.x, target.y - 1) == 0 and not getWarp(target.m, target.x, target.y - 1)) then
			if (ambush == nil) then
				block.side = 2
				block:sendSide()
				block:warp(target.m, target.x, target.y - 1)
				return true
			else
				return true
			end
		elseif (target.y + 1 <= block.ymax and #checkPCSouth + #checkMobSouth + #checkNPCSouth == 0 and target:objectCanMove(target.x, target.y + 1, 2) and target:objectCanMoveFrom(target.x, target.y, 2) and getPass(target.m, target.x, target.y + 1) == 0 and not getWarp(target.m, target.x, target.y + 1)) then
			if (ambush == nil) then
				block.side = 0
				block:sendSide()
				block:warp(target.m, target.x, target.y + 1)
				return true
			else
				return true
			end
		else
			return false
		end
	end	
	
	return false
end

fourPush = function(block, blockType)
	local blocksNorth = block:getObjectsInCell(block.m, block.x, block.y - 1, blockType)
	local blocksEast = block:getObjectsInCell(block.m, block.x + 1, block.y, blockType)
	local blocksWest = block:getObjectsInCell(block.m, block.x, block.y + 1, blockType)
	local blocksSouth = block:getObjectsInCell(block.m, block.x - 1, block.y, blockType)

	if (#blocksNorth > 0) then
		local checkPCNorth = block:getObjectsInCell(block.m, block.x, block.y - 2, BL_PC)
		local checkMobNorth = block:getObjectsInCell(block.m, block.x, block.y - 2, BL_MOB)
		local checkNPCNorth = block:getObjectsInCell(block.m, block.x, block.y - 2, BL_NPC)
		
		local checkPCEast = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_PC)
		local checkMobEast = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_MOB)
		local checkNPCEast = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_NPC)
		
		local checkPCWest = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_PC)
		local checkMobWest = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_MOB)
		local checkNPCWest = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_NPC)

		if (#checkNPCNorth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			until (i == #checkNPCNorth)
		end
		
		if (#checkNPCEast > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3) then
					table.remove(checkNPCEast, i)
					i = i - 1
				end
			until (i == #checkNPCEast)
		end
		
		if (#checkNPCWest > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3) then
					table.remove(checkNPCWest, i)
					i = i - 1
				end
			until (i == #checkNPCWest)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCNorth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCNorth[i].state == 1) then
						table.remove(checkPCNorth, i)
						i = i - 1
					end
				until (i == #checkPCNorth)
			end
			
			if (#checkPCEast > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCEast[i].state == 1) then
						table.remove(checkPCEast, i)
						i = i - 1
					end
				until (i == #checkPCEast)
			end
			
			if (#checkPCWest > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCWest[i].state == 1) then
						table.remove(checkPCWest, i)
						i = i - 1
					end
				until (i == #checkPCWest)
			end
		end
		
		if (block.y - 2 > 0 and #checkPCNorth + #checkMobNorth + #checkNPCNorth == 0 and block:objectCanMove(block.x, block.y - 2, 0) == true and getPass(block.m, block.x, block.y - 2) == 0 and not getWarp(block.m, block.x, block.y - 2)) then
			blocksNorth[1]:warp(block.m, block.x, block.y - 2)
		elseif (block.x + 1 <= block.xmax and #checkPCEast + #checkMobEast + #checkNPCEast == 0 and block:objectCanMove(block.x + 1, block.y - 1, 1) == true and getPass(block.m, block.x + 1, block.y - 1) == 0 and not getWarp(block.m, block.x + 1, block.y - 1)) then
			blocksNorth[1]:warp(block.m, block.x + 1, block.y - 1)
		elseif (block.x - 1 > 0 and #checkPCWest + #checkMobWest + #checkNPCWest == 0 and block:objectCanMove(block.x - 1, block.y - 1, 3) == true and getPass(block.m, block.x - 1, block.y - 1) == 0 and not getWarp(block.m, block.x - 1, block.y - 1)) then
			blocksNorth[1]:warp(block.m, block.x - 1, block.y - 1)
		end
	end

	if (#blocksEast > 0) then
		local checkPCEast = block:getObjectsInCell(block.m, block.x + 2, block.y, BL_PC)
		local checkMobEast = block:getObjectsInCell(block.m, block.x + 2, block.y, BL_MOB)
		local checkNPCEast = block:getObjectsInCell(block.m, block.x + 2, block.y, BL_NPC)

		local checkPCNorth = block:getObjectsInCell(block.m, block.x + 1, block.y - 1,BL_PC)
		local checkMobNorth = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_MOB)
		local checkNPCNorth = block:getObjectsInCell(block.m, block.x + 1, block.y - 1, BL_NPC)

		local checkPCSouth = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_PC)
		local checkMobSouth = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_MOB)
		local checkNPCSouth = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_NPC)

		if (#checkNPCNorth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			until (i == #checkNPCNorth)
		end
		
		if (#checkNPCEast > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3) then
					table.remove(checkNPCEast, i)
					i = i - 1
				end
			until (i == #checkNPCEast)
		end
		
		if (#checkNPCSouth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCSouth[i].subType == 2 or checkNPCSouth[i].subType == 3) then
					table.remove(checkNPCSouth, i)
					i = i - 1
				end
			until (i == #checkNPCSouth)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCNorth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCNorth[i].state == 1) then
						table.remove(checkPCNorth, i)
						i = i - 1
					end
				until (i == #checkPCNorth)
			end
			
			if (#checkPCSouth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCSouth[i].state == 1) then
						table.remove(checkPCSouth, i)
						i = i - 1
					end
				until (i == #checkPCSouth)
			end
			
			if (#checkPCEast > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCEast[i].state == 1) then
						table.remove(checkPCEast, i)
						i = i - 1
					end
				until (i == #checkPCEat)
			end
		end
		
		if (block.x + 2 <= block.xmax and #checkPCEast + #checkMobEast + #checkNPCEast == 0 and block:objectCanMove(block.x + 2, block.y, 1) == true and getPass(block.m, block.x + 2, block.y) == 0 and not getWarp(block.m, block.x + 2, block.y)) then
			blocksEast[1]:warp(block.m, block.x + 2, block.y)
		elseif (block.y - 1 > 0 and #checkPCNorth + #checkMobNorth + #checkNPCNorth == 0 and block:objectCanMove(block.x + 1, block.y - 1, 0) == true and getPass(block.m, block.x + 1, block.y - 1) == 0 and not getWarp(block.m, block.x + 1, block.y - 1)) then
			blocksEast[1]:warp(block.m, block.x + 1, block.y - 1)
		elseif (block.y + 1 <= block.ymax and #checkPCSouth + #checkMobSouth + #checkNPCSouth == 0 and block:objectCanMove(block.x + 1, block.y + 1, 2) == true and getPass(block.m, block.x + 1, block.y + 1) == 0 and not getWarp(block.m, block.x + 1, block.y + 1)) then
			blocksEast[1]:warp(block.m, block.x + 1, block.y + 1)
		end
	end
	
	if (#blocksSouth > 0) then
		local checkPCSouth = block:getObjectsInCell(block.m, block.x, block.y + 2, BL_PC)
		local checkMobSouth = block:getObjectsInCell(block.m, block.x, block.y + 2, BL_MOB)
		local checkNPCSouth = block:getObjectsInCell(block.m, block.x, block.y + 2, BL_NPC)

		local checkPCEast = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_PC)
		local checkMobEast = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_MOB)
		local checkNPCEast = block:getObjectsInCell(block.m, block.x + 1, block.y + 1, BL_NPC)

		local checkPCWest = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_PC)
		local checkMobWest = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_MOB)
		local checkNPCWest = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_NPC)

		if (#checkNPCSouth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCSouth[i].subType == 2 or checkNPCSouth[i].subType == 3) then
					table.remove(checkNPCSouth, i)
					i = i - 1
				end
			until (i == #checkNPCSouth)
		end
		
		if (#checkNPCEast > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3) then
					table.remove(checkNPCEast, i)
					i = i - 1
				end
			until (i == #checkNPCEast)
		end
		
		if (#checkNPCWest > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3) then
					table.remove(checkNPCWest, i)
					i = i - 1
				end
			until (i == #checkNPCWest)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCEast > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCEast[i].state == 1) then
						table.remove(checkPCEast, i)
						i = i - 1
					end
				until (i == #checkPCEast)
			end
			
			if (#checkPCSouth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCSouth[i].state == 1) then
						table.remove(checkPCSouth, i)
						i = i - 1
					end
				until (i == #checkPCSouth)
			end
			
			if (#checkPCWest > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCWest[i].state == 1) then
						table.remove(checkPCWest, i)
						i = i - 1
					end
				until (i == #checkPCWest)
			end
		end
		
		if (block.y + 2 <= block.ymax and #checkPCSouth + #checkMobSouth + #checkNPCSouth == 0 and block:objectCanMove(block.x, block.y + 2, 2) == true and getPass(block.m, block.x, block.y + 2) == 0 and not getWarp(block.m, block.x, block.y + 2)) then
			blocksSouth[1]:warp(block.m, block.x, block.y + 2)
		elseif (block.x + 1 <= block.xmax and #checkPCEast + #checkMobEast + #checkNPCEast == 0 and block:objectCanMove(block.x + 1, block.y + 1, 1) == true and getPass(block.m, block.x + 1, block.y + 1) == 0 and not getWarp(block.m, block.x + 1, block.y + 1)) then
			blocksSouth[1]:warp(block.m, block.x + 1, block.y + 1)
		elseif (block.x - 1 > 0 and #checkPCWest + #checkMobWest + #checkNPCWest == 0 and block:objectCanMove(block.x - 1, block.y + 1, 3) == true and getPass(block.m, block.x - 1, block.y + 1) == 0 and not getWarp(block.m, block.x - 1, block.y + 1)) then
			blocksSouth[1]:warp(block.m, block.x - 1, block.y + 1)
		end
	end
	
	if (#blocksWest > 0) then
		local checkPCWest = block:getObjectsInCell(block.m, block.x - 2, block.y, BL_PC)
		local checkMobWest = block:getObjectsInCell(block.m, block.x - 2, block.y, BL_MOB)
		local checkNPCWest = block:getObjectsInCell(block.m, block.x - 2, block.y, BL_NPC)

		local checkPCNorth = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_PC)
		local checkMobNorth = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_MOB)
		local checkNPCNorth = block:getObjectsInCell(block.m, block.x - 1, block.y - 1, BL_NPC)

		local checkPCSouth = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_PC)
		local checkMobSouth = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_MOB)
		local checkNPCSouth = block:getObjectsInCell(block.m, block.x - 1, block.y + 1, BL_NPC)

		if (#checkNPCNorth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			until (i == #checkNPCNorth)
		end
		
		if (#checkNPCSouth > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCSouth[i].subType == 2 or checkNPCSouth[i].subType == 3) then
					table.remove(checkNPCSouth, i)
					i = i - 1
				end
			until (i == #checkNPCSouth)
		end
		
		if (#checkNPCWest > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3) then
					table.remove(checkNPCWest, i)
					i = i - 1
				end
			until (i == #checkNPCWest)
		end
		
		if (block.showGhosts == 1) then
			if (#checkPCNorth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCNorth[i].state == 1) then
						table.remove(checkPCNorth, i)
						i = i - 1
					end
				until (i == #checkPCNorth)
			end
			
			if (#checkPCSouth > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCSouth[i].state == 1) then
						table.remove(checkPCSouth, i)
						i = i - 1
					end
				until (i == #checkPCSouth)
			end
			
			if (#checkPCWest > 0) then
				i = 0
				
				repeat
					i = i + 1
					
					if (checkPCWest[i].state == 1) then
						table.remove(checkPCWest, i)
						i = i - 1
					end
				until (i == #checkPCWest)
			end
		end
		
		if (block.x - 2 > 0 and #checkPCWest + #checkMobWest + #checkNPCWest == 0 and block:objectCanMove(block.x - 2, block.y, 3) == true and getPass(block.m, block.x - 2, block.y) == 0 and not getWarp(block.m, block.x - 2, block.y)) then
			blocksWest[1]:warp(block.m, block.x - 2, block.y)
		elseif (block.y - 1 > 0 and #checkPCNorth + #checkMobNorth + #checkNPCNorth == 0 and block:objectCanMove(block.x - 1, block.y - 1, 0) == true and getPass(block.m, block.x - 1, block.y - 1) == 0 and not getWarp(block.m, block.x - 1, block.y - 1)) then
			blocksWest[1]:warp(block.m, block.x - 1, block.y - 1)
		elseif (block.y + 1 <= block.ymax and #checkPCSouth + #checkMobSouth + #checkNPCSouth == 0 and block:objectCanMove(block.x - 1, block.y + 1, 2) == true and getPass(block.m, block.x - 1, block.y + 1) == 0 and not getWarp(block.m, block.x - 1, block.y + 1)) then
			blocksWest[1]:warp(block.m, block.x - 1, block.y + 1)
		end
	end
end

getExp = function(player, limit, ratio)
	local level = player.level
	local levelExp
	local xp = 0
	
	if (ratio == nil) then
		ratio = 75
	end
	ratio = ratio / 100
	
	if (limit == nil) then
		limit = 50
	end
	
	if (level > limit) then
		level = limit
	end
	
	if (level >= 1 and level < 5) then
		levelExp = 1000
	elseif (level >= 5 and level < 12) then
		levelExp = 12000
	elseif (level >= 12 and level < 19) then
		levelExp = 90000
	elseif (level >= 19 and level < 26) then
		levelExp = 210000
	elseif (level >= 26 and level < 33) then
		levelExp = 550000
	elseif (level >= 33 and level < 41) then
		levelExp = 1500000
	elseif (level >= 41 and level <= 50) then
		levelExp = 3500000
	end
	
	xp = math.floor(levelExp * ratio)
	
	return xp	
end
]]--