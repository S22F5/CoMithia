hardened_armor = {
cast = function(player)
	player:sendMinitext("This is a passive ability.")
end,

passive = function(player)
	if (player.health < player.maxHealth and player.health > 0) then
		player.armor = player.armor * (1 + (player.maxHealth - player.health) / player.maxHealth)
	end
end,

while_passive = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 34
	local items = {}
	local itemAmounts = {}
	local description = {"Increases your defense based on how much damage you have taken"}
	
	return level, items, itemAmounts, description
end
}