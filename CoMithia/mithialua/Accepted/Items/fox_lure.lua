fox_lure = {
use = function(player)

	if (not player:canAction(1, 1, 1)) then
		return
	end

	local item = player:getInventoryItem(player.invSlot)
	
	if (item == nil) then
		return
	end
	
	if (item.owner == player.ID) then
		player.disguise = 632
		player.registry["mount_type"] = 1
		player.state = 3
		player:calcStat()
	elseif (item.owner == 0) then
		player:sendMinitext("You do not understand how to use this, better ask a specialist.")
	else
		player:sendMinitext("This item does not belong to you.")
	end
end
}

fox_fang = {
use = function(player)

	if (not player:canAction(1, 1, 0)) then
		return
	end

	local item = player:getInventoryItem(player.invSlot)
	
	if (item == nil) then
		return
	end

	player:sendMinitext("This looks like something the researchers would study.")
end
}