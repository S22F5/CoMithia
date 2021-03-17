tutorial_iron_vein = {
on_attacked = function(mob, attacker)
	local block = getTargetFacing(attacker, BL_MOB)
	local pick = attacker:getEquippedItem(EQ_WEAP)
	
	if (attacker.critChance == 0) then
		return
	end
	
	if (block.ID == mob.ID) then
		if (pick.id == 1000000100) then --Mining Pick
			attacker:flushDuration(1)
			mob:addHealth(-10)
			
			if (math.random(3) == 1) then
				attacker:addItem("iron_ore", 1)
				attacker:playSound(45)	
			end					
		else
			attacker:sendMinitext("You can not mine without proper mining tools.")
		end
	end
end,
	
on_spawn = function(mob)
	local hasMoved = false
	
	if (mob.m == 153) then
		repeat
			local newX = math.random(0, 19)
			local newY = math.random(0, 19)
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
	if(not player:hasEquipped({"mining_pick"}) and not player:hasEquipped({"sturdy_mining_pick"}) and not player:hasEquipped({"reinforced_mining_pick"})) then
		player:sendMinitext("You can not mine without proper mining tools.")
		return
	end

	player:addItem("iron_ore", 1)
	player:playSound(45)
end
}
