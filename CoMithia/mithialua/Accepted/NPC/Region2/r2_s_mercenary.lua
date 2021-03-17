r2_s_mercenary = {
click = async(function(player, npc)
	local options = {"Yes", "No"}
	local choice = ""
	local check = 0
	
	player.dialogType = 1
	player.lastClick = npc.ID
	choice = player:menuString("Would you like to help me find my friend in the bandit's lair?", options)
	
	if (choice == "Yes" and #player.group > 1) then
		local mapStart = getFreeInstance(5)
		
		if (mapStart ~= false) then
			if (loadInstance(mapStart, "ruins") == true) then
				for i = 1, #player.group do
					groupedPlayer = Player(player.group[i])
					
					if (groupedPlayer.m == 30 and groupedPlayer.level >= 33) then
						groupedPlayer.registry["ruins1Spawned"] = 0
						groupedPlayer.registry["ruins2Spawned"] = 0
						groupedPlayer.registry["ruins3Spawned"] = 0
						groupedPlayer.registry["ruins4Spawned"] = 0
						groupedPlayer.registry["ruins5Spawned"] = 0
						groupedPlayer:warp(mapStart, math.random(16, 18), 43)
					end
				end
			else
				unloadInstance(mapStart, 5)
			end
		end
	elseif (#player.group <= 1) then
		player:dialog("You're going to need a party for this trip, I won't trust my friend to just one person.", {})
	end
end)
}