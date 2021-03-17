chill_staff = {
on_hit = function(player,target)
	if (player:hasDuration("chill_staff")) then
		player:flushDurationNoUncast(506)
		player:setDuration("chill_staff", 8000)
		player.registry["spell_chill_staff"] = player.registry["spell_chill_staff"] + 1
	else
		player:setDuration("chill_staff", 8000)
		player.registry["spell_chill_staff"] = 1
	end

	if (player:hasAether("chill_staff")) then
		return
	end
	
	local dmg = (player.wisdom * 0.85) + player.will
	target:sendAnimation(22)
	
	if (player.registry["spell_chill_staff"] < 4 and not target:hasDurationID("chill_staff", player.ID)) then
		if (target.blType == BL_PC) then
			target:setDuration("chill_staff", 1000, player.ID)
			target.speed = target.speed + 5
			target:calcStat()
			target.registry["chill_staff_slow_"..player.ID] = 1
		elseif (target.blType == BL_MOB and target:changeMove(200)) then
			target:setDuration("chill_staff", 1000, player.ID)
			target.registry["chill_staff_slow_"..player.ID] = 1
		end
	elseif (player.registry["spell_chill_staff"] >= 4 and not target:hasDurationID("chill_staff", player.ID)) then
		player:flushDuration(506)
		player:sendMinitext("Snow rains down on your foe.")
		target:setDuration("chill_staff", 1000, player.ID)
		target.snare = true
		--target.attacker = player.ID
		--target:removeHealthExtend(dmg, 1, 1, 0, 1, 0)
		player:setAether("chill_staff", 3000)
	end
end,

uncast = function(block, caster)
	if (caster ~= nil) then
		if (block.blType == BL_PC and block.registry["chill_staff_slow_"..caster.ID] > 0) then
			block.speed = block.speed - 5
			block:calcStat()
			block.registry["chill_staff_slow_"..caster.ID] = 0
		elseif (block.blType == BL_MOB and block.registry["chill_staff_slow_"..caster.ID] > 0) then
			block:changeMove(-200)
			block.registry["chill_staff_slow_"..caster.ID] = 0
		else
			block.snare = false
		end
	else
		player.registry["spell_chill_staff"] = 0
	end
end,

recast = function(player, caster)
	if (caster ~= nil) then
		if (block.blType == BL_PC and block.registry["chill_staff_slow_"..caster.ID] > 0) then
			block.speed = block.speed + 5
			block:calcStat()
		elseif (block.blType == BL_MOB and block.registry["chill_staff_slow_"..caster.ID] > 0) then
			block:changeMove(200)
		else
			block.snare = true
		end
	end
end
}