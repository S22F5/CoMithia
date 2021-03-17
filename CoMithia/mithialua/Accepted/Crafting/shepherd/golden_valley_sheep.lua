golden_valley_sheep = {
on_attacked = function(mob, attacker)
	local block = getTargetFacing(attacker, BL_MOB)
	local shears = attacker:getEquippedItem(EQ_WEAP)
	
	if (attacker.critChance == 0) then
		return
	end
	
	if (block.ID == mob.ID) then
		if (shears ~= nil and shears.id == 1000000000) then --Shears
			attacker:flushDuration(1)
			mob:addHealth(-10)
			
			if (math.random(3) == 1) then
				attacker:addItem("golden_wool", 1)	
			end					
		else
			attacker:sendMinitext("You cannot shepherd without proper shepherding tools.")
		end
	end
end,

after_death=function(mob,player)
	local rand = math.random(100)
	local gem = math.random(100)
	local skillAdded = math.random(2, 3)
	local skillAddChance = math.random(4)
	local bonus = math.random(0, player.registry["shepherd"] + 1) / (player.registry["shepherd"] + 1)
	local improveChance = ((player.registry["shepherd"] / 30) + 50)
	local craftlevel = "Beginner"
	
	if(not player:hasEquipped({"shears"}) and not player:hasEquipped({"sturdy_shears"}) and not player:hasEquipped({"reinforced_shears"})) then
		player:sendMinitext("You can not shepherd without proper shepherding tools.")
		return
	end

	if (improveChance > 85) then 
		improveChance = 85
	end

	if (improveChance > rand) then
		if (bonus > 0.85) then
			bonus = 3
		elseif (bonus > 0.66) then
			bonus = 2
		elseif (bonus > 0.33) then
			bonus = 1
		end
		
		skillAdded = skillAdded + bonus

		if (skillAddChance > 1) then
			player.registry["shepherd"] = player.registry["shepherd"] + (skillAdded * 2)
		end
		
		if(player.registry["shepherd"]<25) then
			craftlevel="Beginner"
		elseif(player.registry["shepherd"]>=25 and player.registry["shepherd"]<220) then
			craftlevel="Novice"
		elseif(player.registry["shepherd"]>=220 and player.registry["shepherd"]<840) then
			craftlevel="Apprentice"
		elseif(player.registry["shepherd"]>=840 and player.registry["shepherd"]<2200) then
			craftlevel="Accomplished"
		elseif(player.registry["shepherd"]>=2200 and player.registry["shepherd"]<6400) then
			craftlevel="Adept"
		elseif(player.registry["shepherd"]>=6400 and player.registry["shepherd"]<18000) then
			craftlevel="Talented"
		elseif(player.registry["shepherd"]>=18000 and player.registry["shepherd"]<50000) then
			craftlevel="Skilled"
		elseif(player.registry["shepherd"]>=50000 and player.registry["shepherd"]<124000) then
			craftlevel="Expert"
		elseif(player.registry["shepherd"]>=124000 and player.registry["shepherd"]<237000) then
			craftlevel="Master"
		elseif(player.registry["shepherd"]>=237000 and player.registry["shepherd"]<400000) then
			craftlevel="Grand Master"
		elseif(player.registry["shepherd"]>=400000 and player.registry["shepherd"]<680000) then
			craftlevel="Champion"
		elseif(player.registry["shepherd"]>=680000) then
			craftlevel="Legendary"
		end
		
		if (math.random(2) == 1) then
			player:addItem("golden_wool", 1)
		end
		
		player:removeLegendbyName("shepherd")
		player:addLegend(""..craftlevel.." shepherd","shepherd",137,128)
	end	
end,

on_spawn = function(mob)
	local hasMoved = false
	
	if (mob.m == 30) then
		repeat
			local newX = math.random(0,74)
			local newY = math.random(0,74)
			local passCheck = getPass(mob.m, newX, newY)
			local tileCheck = getTile(mob.m, newX, newY)
			local npcCheck = mob:getObjectsInCell(mob.m, newX, newY, BL_MOB)		
			
			if(passCheck == 0 and #npcCheck == 0 and tileCheck == 43) then
				mob:warp(mob.m, newX, newY)
				hasMoved = true
			end
		until hasMoved
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
				moved=mob:move()
			end
		else
			moved=mob:move()
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
					moved=mob:move()
				end
			else
				moved=mob:move()
			end
		end
	else
		if(checkmove >= 4) then
			mob.side=math.random(0,3)
			mob:sendSide()
			if(mob.side == oldside) then
				moved=mob:move()
			end
		else
			moved=mob:move()
		end
	end
end,

attack = function(mob, target)
	local moved = false
	
	if (mob.target == 0) then
		mob.state = MOB_ALIVE
		golden_valley_sheep.move(mob, target)
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
end
}