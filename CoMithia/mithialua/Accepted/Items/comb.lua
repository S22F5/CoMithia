comb = {
use = function(player)
	if (player.level >= 50) then
		async(styling.click(player, Item("comb")))
	else
		player:msg(0, "You are not skilled enough to do that.", player.ID)
	end
end
}