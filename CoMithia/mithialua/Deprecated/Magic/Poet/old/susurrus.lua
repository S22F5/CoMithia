susurrus = {
cast = function(player)

end,

while_cast = function(player, caster)
	--player:talk(2,""..player.registry["spell_susurrus"])
	local dot = 0
	if (player.registry["spell_susurrus"] > 0) then
		player.registry["spell_susurrus"] = player.registry["spell_susurrus"] - math.floor(1 + player.will/80)
	end
	if (player.blType == BL_PC) then
		if (player.registry["spell_susurrus"] >= 90) then
			dot = player.vRegenAmount * 0.12
		elseif (player.registry["spell_susurrus"] >= 50) then
			dot = player.vRegenAmount * 0.09
		end
	elseif (player.blType == BL_MOB) then
		if (player.bossType == 0) then
			dot = player.health * 0.01 * 0.05
		elseif (player.bossType == 1) then
			dot = player.health * 0.01 * 0.02
		elseif (player.bossType == 2) then
			dot = player.health * 0.008 * 0.02
		elseif (player.bossType == 3) then
			dot = player.health * 0.006 * 0.02
		else
			dot = player.health * 0.003 * 0.002
		end
	end
	--player:talk(0,""..dot)
	dot = math.floor(dot)
	if (dot == 0) then
		return
	end
	player.attacker = caster.ID
	player:removeHealthExtend(dot, 1, 0, 0, 1, 0)
end,

uncast = function(player)
	--player:talk(0,"uncast "..player.registry["spell_susurrus"])
	player.registry["spell_susurrus"] = 0
	--player:talk(0,"uncast 2: "..player.registry["spell_susurrus"])
end
}