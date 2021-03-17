chosen_of_the_storm = {
cast = function(player,target)

	player:sendMinitext("This is a passive spell.")
	return
end,

while_cast = function(player)
	local amt = (player.maxHealth / 6)*.3
	player:addHealth(amt)
end,


uncast=function(player)

end,


recast=function(player)

end,

passive = function(player)

end,

while_passive = function(player)
	
end,

passive_beforedamaged = function(player,attacker)

end,


passive_afterdamaged = function(player,attacker)
	local thirty = player.maxHealth*.3
	if (player.health <= thirty) then
		player:setDuration("chosen_of_the_storm",6000)
	end
end,

on_takedamage = function(player,attacker)
end

}