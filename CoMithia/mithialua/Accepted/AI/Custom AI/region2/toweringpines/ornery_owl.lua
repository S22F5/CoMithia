ornery_owl = {
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
	local moved
	local attacks = mob.registry["owl_attacks"]
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (attacks <= 2) then
		mob:changeAttack(-1250)
		mob.registry["owl_attacks"] = mob.registry["owl_attacks"] + 1
	elseif (attacks >= 3) then
		mob:changeAttack(1250)
		mob.registry["owl_attacks"] = 0
	end
	
	if(target) then
		threat.calcHighestThreat(mob)
		local block = mob:getBlock(mob.target)
		if (block.blType ~= nil) then
			target = block
		else
			mob:talk(2, "I have an invalid target, report me to a GM. (ID: "..mob.ID.." Target ID: "..mob.target)
		end
		moved=FindCoords(mob,target)
		if(moved and mob.target ~= mob.owner) then
			--We are right next to them, so attack!
			mob:attack(target.ID)
		else
			mob.state = MOB_ALIVE
		end
	else
		mob.state = MOB_ALIVE
	end
end,

after_death = function(mob, target)
	mob.registry["owl_attacks"] = 0
end
}