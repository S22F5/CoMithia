halycon_bowl = {
use = function(player)
	if (player:hasItem("halcyon_bowl", 1) == true) then
		if (player.m == 217) then
			player:warp(37, 17, 14)
			player:removeItem("halcyon_bowl", 1)
		end
	end
end
}

halcyon_filled_bowl = {
use = function(player)
	if (player:hasItem("halcyon_filled_bowl", 1) == true) then
		if (player.m == 217) then
			player:warp(37, 17, 14)
			if (player.quest["oneWithGreatTree"] == 250) then
				player:removeItem("halcyon_filled_bowl", 1)
			end
		end
	end
end
}

