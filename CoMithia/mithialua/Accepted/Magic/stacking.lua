stacking = {
cast=function(player,target)

	if(target:hasDuration("stacking")) then
		if (target.registry["spell_stacking"] >= 5) then
			player:sendMinitext("Can not stack any more.")
			return
		end
		target.registry["spell_stacking"] = target.registry["spell_stacking"] + 1
		--target.ac = target.ac + (10 * target.registry["spell_stacking"])
	else
		target.registry["spell_stacking"] = 1
	end
	target:setDuration("stacking",20000)
	target:calcStat()
	--target:sendStatus()
end,

uncast=function(player)
	player.registry["spell_stacking"] = 0
	player:calcStat()
	player:sendStatus()
end,

recast = function(player)
	player.ac = player.ac - (10 * player.registry["spell_stacking"])
	player:sendStatus()
end
}