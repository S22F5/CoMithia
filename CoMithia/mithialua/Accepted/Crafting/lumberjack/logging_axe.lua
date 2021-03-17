logging_axe = {
on_hit = function(player, target)
	if (target and target.blType == BL_MOB and target.mobID >= 1000000 and target.mobID <= 1000009) then
		player:flushDuration(1)
	end
end
}