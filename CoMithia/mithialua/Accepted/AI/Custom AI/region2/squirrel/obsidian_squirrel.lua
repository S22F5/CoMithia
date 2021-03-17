obsidian_squirrel = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	obsidian_squirrel.regen(mob)
	obsidian_defense.cast(mob)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	obsidian_squirrel.regen(mob)
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	obsidian_squirrel.regen(mob)
	mob_ai_basic.attack(mob, target)
end,

regen = function(mob)
	if (mob.paralyzed or mob.sleep ~= 1 or mob.registry["regen"] > os.time()) then
		return
	end
	
	local amt = 7 + math.random(3)

	if (mob.health < mob.maxHealth) then
		if (mob.health + amt >= mob.maxHealth) then
			mob.health = mob.maxHealth
		else
			mob.health = mob.health + amt
		end
	end
	mob.registry["regen"] = os.time() + 1
end
}

obsidian_defense = {
cast = function(mob)
	if (mob:hasDuration("obsidian_defense") == true) then
		return
	end
	
	mob:setDuration("obsidian_defense", 12000)
	mob.registry["obsidian_defense"] = os.time() + 8000
	mob:calcStat()
	mob:sendAnimation(380)
end,

while_cast = function(mob)
	mob:sendAnimation(380)
end,

recast = function(mob)
	mob.armor = mob.armor + 140
end,

uncast = function(mob)
	mob:calcStat()
	mob:sendAnimation(380, -1)
end
}