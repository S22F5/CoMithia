tutorial_valley_sheep = {
on_spawn = function(mob)
	local hasMoved = false
	
	if (mob.m == 153) then
		repeat
			local newX = math.random(13, 19)
			local newY = math.random(40, 45)
			local passCheck = getPass(mob.m, newX, newY)
			local mobCheck = mob:getObjectsInCell(mob.m, newX, newY, BL_MOB)		
			
			if (passCheck == 0 and #mobCheck == 0) then
				mob:warp(mob.m, newX, newY)
				hasMoved = true
			end
		until hasMoved
	end	
end,

on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	local block = getTargetFacing(attacker, BL_MOB)
	local shears = attacker:getEquippedItem(EQ_WEAP)
	
	if (attacker.critChance == 0) then
		return
	end
	
	if (block.ID == mob.ID) then
		if (shears.id == 1000000000) then --Shears
			attacker:flushDuration(1)
			mob:addHealth(-10)
			
			if (math.random(3) == 1) then
				attacker:addItem("wool", 1)
				attacker:playSound(45)	
			end					
		else
			attacker:sendMinitext("You cannot shear without proper shepherding tools.")
		end
	end
end,
	
move = function(mob, target)
	local moved = false
	local oldside = mob.side
	local checkmove = math.random(0,10)

	if (mob.state ~= MOB_HIT and target == nil and mob.owner == 0) then
		if(checkmove >= 4) then
			mob.side=math.random(0,3)
			mob:sendSide()
			if(mob.side == oldside) then
				if (mob.side ~= 0 or (mob.side == 0 and ((mob.x ~= 15 and mob.y == 40) or (mob.x == 15 and mob.y ~= 40) or (mob.x ~= 15 and mob.y ~= 40)))) then
					moved=mob:move()
				end
			end
		else
			if (mob.side ~= 0 or (mob.side == 0 and ((mob.x ~= 15 and mob.y == 40) or (mob.x == 15 and mob.y ~= 40) or (mob.x ~= 15 and mob.y ~= 40)))) then
				moved = mob:move()
			end
		end
	elseif (target ~= nil) then
		for i = 0, 3 do
			mob.side = i
			
			if (mob:moveIntent(target.ID) == 1) then
				moved = true
				break
			end
		end
		
		if (moved) then
			mob:sendSide()
			mob.state = MOB_HIT
		else
			mob.side = oldside
			
			if(checkmove >= 4) then
				mob.side=math.random(0,3)
				mob:sendSide()
				if(mob.side == oldside) then
					if (mob.side ~= 0 or (mob.side == 0 and ((mob.x ~= 15 and mob.y == 40) or (mob.x == 15 and mob.y ~= 40) or (mob.x ~= 15 and mob.y ~= 40)))) then
						moved=mob:move()
					end
				end
			else
				if (mob.side ~= 0 or (mob.side == 0 and ((mob.x ~= 15 and mob.y == 40) or (mob.x == 15 and mob.y ~= 40) or (mob.x ~= 15 and mob.y ~= 40)))) then
					moved=mob:move()
				end
			end
		end
	else
		if(checkmove >= 4) then
			mob.side=math.random(0,3)
			mob:sendSide()
			
			if (mob.side == oldside) then
				if (mob.side ~= 0 or (mob.side == 0 and ((mob.x ~= 15 and mob.y == 40) or (mob.x == 15 and mob.y ~= 40) or (mob.x ~= 15 and mob.y ~= 40)))) then
					moved = mob:move()
				end
			end
		else
			if (mob.side ~= 0 or (mob.side == 0 and ((mob.x ~= 15 and mob.y == 40) or (mob.x == 15 and mob.y ~= 40) or (mob.x ~= 15 and mob.y ~= 40)))) then
				moved = mob:move()
			end
		end
	end
end,

attack = function(mob, target)
	local moved = false
	
	if (mob.target == 0) then
		mob.state = MOB_ALIVE
		valley_sheep.move(mob, target)
		return
	end
	
	if (target ~= nil) then
		moved = FindCoords(mob,target)
		
		if (moved) then
			mob:attack(target.ID)
		else
			mob.state = MOB_ALIVE
		end
	else
		mob.state = MOB_ALIVE
	end
end,
	
after_death = function(mob,player)
	if(not player:hasEquipped({"shears"}) and not player:hasEquipped({"sturdy_shears"}) and not player:hasEquipped({"reinforced_shears"})) then
		player:sendMinitext("You cannot shear without proper shepherding tools.")
		return
	end

	player:addItem("wool", 1)
	player:playSound(45)
end
}
