heal = {
cast = function(player,target)
	target = player
	if (target.state ~= 1) then
		if (target.health == 0) then
			broadcast(-1, ""..target.name.." has been healed out.")
		end
		target:addHealth(5)
		target:sendAnimation(5)
		--target:setDuration("heal", 900000)
	else
		player:sendMinitext("It's dead dude.")
	end

end,

while_cast_250 = function(player)
		if (player.health == 0) then
			broadcast(-1, ""..player.name.." has been healed out.")
		end
	player:addHealth(7)
end
}