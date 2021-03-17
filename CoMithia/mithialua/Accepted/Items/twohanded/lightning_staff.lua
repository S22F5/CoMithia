lightning_staff = {
on_hit = function(player,target)
	if (player:hasDuration("lightning_staff")) then
		player:flushDurationNoUncast(503)
		player:setDuration("lightning_staff", 8000)
		player.registry["spell_lightning_staff"] = player.registry["spell_lightning_staff"] + 1
	else
		player:setDuration("lightning_staff", 8000)
		player.registry["spell_lightning_staff"] = 1
	end

	if (player:hasAether("lightning_staff")) then
		return
	end
	
	local dmg = (player.wisdom * 0.85) + player.will
	
	if (player.registry["spell_lightning_staff"] >= 4) then
		target:sendAnimation(27)
		player:flushDuration(503)
		player:sendMinitext("Lightning rains down on your foe.")
		target.attacker = player.ID
		target:removeHealthExtend(dmg, 1, 1, 0, 1, 0)
		player:setAether("lightning_staff", 3000)
	end
end,

uncast = function(player)
	player.registry["spell_lightning_staff"] = 0
end
}