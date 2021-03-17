r2_myuro = {
click = async(function(player, npc)
	if (player.quest["locations"] == 0) then
		r2_locations.quest(player, npc)
		return
	end
end),

action = function(npc)
	local playersInArea = npc:getObjectsInArea(BL_PC)
	
	if (#playersInArea > 0) then
		for i = 1, #playersInArea do
			if (playersInArea[i].quest["locations"] == 0) then
				npc:msg(0, 'Myuro(Old Man)" Need some help? Come see me!', playersInArea[i].ID)
			end
		end
	end
end
}