path_of_the_warrior = {
cast = function(player)
	local str = ""
	
	if (player.registry["spell_path"] == 0) then
		str = "Defensive stance"
	else
		str = "Offensive stance"
	end
	
	player:sendMinitext("You are in the "..str)
	player:sendMinitext("Cast again to change stance.")
	player:setAether("path_of_the_warrior", 5000)
end,

on_aethers = function(player)

	if (player.state == 1) then
		player:sendMinitext("Can not cast while dead.")
		return
	end

	if (player.registry["spell_path_aether"] > os.time()) then
		local ret = player.registry["spell_path_aether"] - os.time()
		player:sendMinitext("You have "..ret.." aethers left.")
		return
	end
	
	if (player.registry["spell_path"] > 0) then
		player.registry["spell_path"] = 0
	else
		player.registry["spell_path"] = 1
	end
	
	if (player:hasAether("path_of_the_warrior")) then
		--player:flushAether()--Insert Magic ID
	end
	
	player.registry["spell_path_aether"] = os.time() + 3600
	

end,


passive = function(player)
end,

while_passive = function(player)
end,

passive_on_swing = function(player)
end,

passive_on_hit = function(player, target)
end
}