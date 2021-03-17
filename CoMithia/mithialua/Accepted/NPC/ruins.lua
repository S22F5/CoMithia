ruins = {
click = async(function(player, npc)
	local map = getFreeInstance(5)
	local options = {"Yes, send me and my group inside.", "No, not yet."}
	local choice = player:menu("Hello adventurer, care to test yourself against the creatures of the (cave name)?", options)
	
	if (map == false) then
		player:dialogSeq({npcGfx, "Instances full. Please try back later"}, 1)
		return
	end
	
	if (choice == 1) then
		loadInstance(map, "../mithiamaps/Accepted/instances/region2/ruins.txt", "ruins")
		
		if (#player.group > 0) then
			for i = 1, #player.group do
				player.group[i]:warp(map, math.random(16, 18), 43)
			end
		else
			unloadInstance(map, maps)
		end
	elseif (choice == 2) then
		return
	end
end)
}