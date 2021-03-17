plague_rat_poison = {
while_cast = function(player)
	local damage = 10
	
	player.attacker = player.ID
	player:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	player:sendAnimation(1)
end
}