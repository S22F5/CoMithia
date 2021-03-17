tutorial_mithian_ash = {
on_attacked = function(mob, attacker)
	local block = getTargetFacing(attacker, BL_MOB)
	local axe = attacker:getEquippedItem(EQ_WEAP)
	
	if (attacker.critChance == 0) then
		return
	end
	
	if (block.ID == mob.ID) then
		if (axe.id == 1000000400) then --Logging Axe
			attacker:flushDuration(1)
			mob:addHealth(-10)
			
			if (math.random(3) == 1) then
				attacker:addItem("ash_log", 1)
				attacker:playSound(45)	
			end					
		else
			attacker:sendMinitext("You cannot cut wood without proper wood cutting tools.")
		end
	end
end,
	
on_spawn = function(mob)
	local hasMoved = false
	
	if (mob.m == 153) then
		repeat
			local newX = math.random(26, 43)
			local newY = math.random(2, 11)
			local passCheck = getPass(mob.m, newX, newY)
			local mobCheck = mob:getObjectsInCell(mob.m, newX, newY, BL_MOB)		
			
			if (passCheck == 0 and #mobCheck == 0) then
				mob:warp(mob.m, newX, newY)
				hasMoved = true
			end
		until hasMoved
	end	
end,
	
after_death = function(mob,player)
	if(not player:hasEquipped({"logging_axe"}) and not player:hasEquipped({"sturdy_logging_axe"}) and not player:hasEquipped({"reinforced_logging_axe"})) then
		player:sendMinitext("You cannot cut wood without proper wood cutting tools.")
		return
	end

	player:addItem("ash_log", 1)
	player:playSound(45)
end
}
