dps_potion = {
use = function(player)
	local duration = 900
	if (player.registry["dps_potion"] > 0) then
		player.sendMinitext("You've already used that.")
	else
		player.registry["dps_potion_len"] = duration
		player.registry["dps_potion"] = os.time() + duration
	end
end
}