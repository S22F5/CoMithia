dual_striker = {
on_hit = function(player,target)
	local hit = player.registry["double_hit"]
	if (hit >= 4) then
		player.registry["double_hit"] = 0
	else
		player.registry["double_hit"] = math.abs(hit + math.random(-1,1))
	end
	if (hit == 3) then
		player.registry["double_hit"] = 4
		player:swing()
		player:talk(0,"Double swing")
	end


end

--[[on_hit = function(player,target)
	--player:talk(0,"HIT")
	local rand = math.random(6,10)
	local hit = player.registry["double_hit"]
	if (hit >= 2) then
		player.registry["double_hit"] = 0
	elseif (rand > 5) and (hit >= 0) then
		player.registry["double_hit"] = hit + 1
		--player:sendMinitext("You hit twice!")
		player:playSound(30)
		if (hit == 0) then
			player:talk(1,"Double hit!")
		elseif (hit == 1) then
			player:talk(1,"Triple hit!")
		end
		player:swing()
	end
		--player:sendMinitext(""..hit)
end]]--
}