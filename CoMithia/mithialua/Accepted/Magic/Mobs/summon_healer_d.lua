summon_healer_d = {
cast = function(mob)
	mob:setDuration("summon_healer_d",15000)

	local owner = Player(mob.owner)
	local ommagic = owner.maxMagic * 0.15
	local omhealth = owner.maxHealth * 0.8

	mob.maxHealth = ommagic + omhealth
	mob.health = mob.maxHealth
end,

uncast = function(mob)
	mob:removeHealth(mob.health)
end
}