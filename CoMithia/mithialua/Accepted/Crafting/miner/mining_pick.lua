mining_pick = {
on_hit = function(player, target)
	if (target and target.blType == BL_MOB and target.mobID >= 1000100 and target.mobID <= 1000109) then
		player:flushDuration(1)
	end
end
}