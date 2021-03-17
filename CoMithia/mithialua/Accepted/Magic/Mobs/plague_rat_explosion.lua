plague_rat_explosion = {
cast = function(mob, target)
	local damage = 23
	
	target.attacker = mob.ID
	target:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	target:setDuration("plague_rat_poison", 5000)
end
}