r2_harom = {
click = async(function(player, npc)
	if (player.quest["locations"] == 1 or player.quest["locations"] == 4 or player.quest["locations"] == 250) then
		r2_locations.quest(player, npc)
		return
	end
end),

action = function(npc)
end
}