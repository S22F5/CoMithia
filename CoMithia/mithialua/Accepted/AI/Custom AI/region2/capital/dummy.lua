dummy = {
on_healed = function(mob, healer)
	mob.target = 0
	mob.attacker = 0
	mob:sendHealth(healer.damage, healer.critChance)
	healer.damage = 0
end,

on_attacked = function(mob, attacker)
	if (mob:hasDuration("mark_of_death")) then
		attacker.damage = attacker.damage * 2
	end
	
	if (attacker.blType == BL_PC) then
		if (attacker.registry["dps_potion"] > 0) then
			attacker.dmgDealt = attacker.dmgDealt + attacker.damage
		end
	end
	
	mob.target = 0
	mob.attacker = 0
	mob:sendHealth(attacker.damage, attacker.critChance)
	attacker.damage = 0
end,
}