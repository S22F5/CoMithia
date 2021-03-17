forest_snake = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,

move = function(mob, target)
	mob_ai_basic.move(mob, target)
end,

attack = function(mob, target)
	local chance = math.random(100000)
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (chance <= 30000 and mob.registry["forest_snake_venom_aether"] < os.time()) then
		mob.registry["forest_snake_venom_aether"] = os.time() + 3
		forest_snake_venom.cast(mob, target)
	else
		mob_ai_basic.attack(mob, target)
	end
end
}

forest_snake_venom = {
cast = function(mob, target)
	mob:sendAction(0, 80)
	target:setDuration("forest_snake_venom", 4000, 0, 1)
end,

while_cast = function(block)
	local damage = 10
	
	block:sendAnimation(1, 0)
	block:removeHealthExtend(damage, 0, 0, 0, 0, 0)
end,
}