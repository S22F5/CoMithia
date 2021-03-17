scroll_of_displacement = {
use = function(player)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that")
		return
	elseif (player.state == 3) then
		player:sendMinitext("Nope, can't do this!")
		return
	end

	local tar = getTargetFacing(player, BL_PC)
	local item = getTargetFacing(player, BL_ITEM)
	if (tar ~= nil) then
		if (player.paralyzed == true) or (player.snare == true) or (player.sleep ~= 1) or
		(tar.paralyzed == true) or (tar.snare == true) or (tar.sleep ~= 1) or
		(item ~= nil) then
			player:sendMinitext("No can do.")
			return
		end
		
		local x = player.x
		local y = player.y
		local x2 = tar.x
		local y2 = tar.y
		
		if (player:hasItem("scroll_of_displacement",1) == true) then--and (aethers) then
			amt = math.floor(5 + maxL((player.mRegenAmount / 4), 95))
			player:removeItem("scroll_of_displacement", 1)
			player:warp(tar.m, x2, y2)
			if (player.side == 0) then
				player.side = 2
			elseif (player.side == 1) then
				player.side = 3
			elseif (player.side == 2) then
				player.side = 0
			elseif (player.side == 3) then
				player.side = 1
			end
			player:sendSide()
			tar:warp(player.m, x, y)
		end
	end
end
}