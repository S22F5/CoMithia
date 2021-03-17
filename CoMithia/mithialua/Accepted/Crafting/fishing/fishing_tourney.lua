fishing_tourney = {
--Bobber colors:   0-red  1-yellow 2-green 3-white 
click = async(function(player, npc)
	local npcG = {graphic = convertGraphic(npc.look, "monster"), color = npc.lookColor}
	player.npcGraphic = npcG.graphic
	player.npcColor = npcG.color
	player.dialogType = 0
	local menu
	local options = {}
	local host = player.registry["fishingHost"]
	
	if (player.m == 7104) then
		options = {"Fishing pole", "Leave"}
		if(host == 69) then
			table.insert(options, "Make teams")
			table.insert(options, "Start 5 mins")
			table.insert(options, "Start 10 mins")
			table.insert(options, "Start 15 mins")
			table.insert(options, "Spawn fish")
		end
		menu = player:menuString("Welcome to the fishing tournement!", options)
		if (menu == "Leave") then
			menu = player:menu("Are you sure you want to leave?", {"Yes", "No"})
			if (menu == "Yes") then
				player:warp(46, 11, 11)
			end
		elseif (menu == "Fishing pole") then
			player:buyExtend("You need to buy a pole?", fishing_pole)
		elseif (menu == "Make teams") then
			fishing_tourny.makeTeams(npc)
		elseif (menu == "Start 5 mins") then
			npc:talk(2,"Let the fishing begin!")
			fishing_tourney.spawnFish(npc, 20)
			fishing_tourney.startFishing(npc, 300)
		elseif (menu == "Start 10 mins") then
			npc:talk(2,"Let the fishing begin!")
			fishing_tourney.spawnFish(npc, 20)
			fishing_tourney.startFishing(npc, 600)
		elseif (menu == "Start 15 mins") then
			npc:talk(2,"Let the fishing begin!")
			fishing_tourney.spawnFish(npc, 20)
			fishing_tourney.startFishing(npc, 900)
		elseif (menu == "Spawn fish") then
			fishing_tourney.spawnFish(npc, 20)
		end
	end
end),

makeTeams = function(npc)
	local players = npc:getObjectsInSameMap(BL_PC)
	npc:talk(2,"Making teams")
	for i = 1, #players do
		if(i <= #players/4) then --yellow
			players[i].registry["bobberColor"] = 1
			players[i].addItem("fishing_pole_yellow")
		elseif(i <= #players/2) then --green
			players[i].registry["bobberColor"] = 2
			players[i].addItem("fishing_pole_green")
		elseif(i <= (#players/4)*3) then --white
			players[i].registry["bobberColor"] = 3
			players[i].addItem("fishing_pole_white")
		else
			players[i].registry["bobberColor"] = 0 --red
			players[i].addItem("fishing_pole")
		end
	end
end,

startFishing = function(npc, fishTime)
	npc:talk(1,"Let the fishing begin!")
	npc.registry["fishTime"] = os.time() + fishTime
	npc.registry["count0"] = 0
	npc.registry["count1"] = 0
	npc.registry["count2"] = 0
	npc.registry["count3"] = 0
	npc.registry["largestFish"] = 0
	npc.registry["largestFishAngler"] = 5
	npc.actionTime = 60000
end,

spawnFish = function(npc, numFish)
	npc:spawn(10005,npc.x,npc.y,numFish)
end,

report = function(fishSize,fishName,teamColor,anglerID)
	npc = NPC(157)
	if(os.time() < npc.registry["fishTime"]) then
		npc.registry["count"..teamColor] = npc.registry["count"..teamColor] + 1
		
		if(fishSize > npc.registry["largestFish"]) then
			npc:talk(1,""..Player(anglerID).name.." has caught a "..(fishSize/10).."cm "..fishName.."!")
			npc.registry["largestFish"] = fishSize
			npc.registry["largestFishAngler"] = anglerID
		end
	end
end,

action = function(npc)
	if(npc.registry["fishTime"] ~= -1) then
		if(os.time() >= npc.registry["fishTime"]) then --end fishing
			npc.registry["fishTime"] = -1
			npc:talk(1,"----------------FINAL RESULTS----------------")
			npc:talk(1,"Red team: "..npc.registry["count0"].." Yellow team: "..npc.registry["count1"].." Green team: "..npc.registry["count2"].." White team: "..npc.registry["count3"])
			if(Player(npc.registry["largestFishAngler"]).name ~= nil) then
				npc:talk(1,"Largest fish: "..(npc.registry["largestFish"]/10).."cm. Caught by:"..Player(npc.registry["largestFishAngler"]).name)
			end
			npc:talk(1,"---------------------------------------------")
		else --annoucement
			npc:talk(1,"Red team: "..npc.registry["count0"].." Yellow team: "..npc.registry["count1"].." Green team: "..npc.registry["count2"].." White team: "..npc.registry["count3"])
			npc:talk(1,"Largest fish: "..(npc.registry["largestFish"]/10).."cm. Caught by:"..Player(npc.registry["largestFishAngler"]).name)
		end
	end
	
end
}