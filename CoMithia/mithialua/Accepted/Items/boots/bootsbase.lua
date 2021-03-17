bootsbase = {
equip = function(player)
	player.speed = player.speed - 5
end,

unequip = function(player)
	player:calcStat()
end,

on_walk = function(player)
	player:deductDura(EQ_BOOTS, 1)
end
}