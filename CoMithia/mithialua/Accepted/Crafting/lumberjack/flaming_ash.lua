flaming_ash = { 
on_spawn = function(mob)
	local hasMoved = false
	
	if(mob.m == 15) then
		repeat
			local newX = math.random(0, mob.xmax)
			local newY = math.random(0, mob.ymax)
			local passCheck = getPass(mob.m, newX, newY)
			local tileCheck = getTile(mob.m, newX, newY)
			local mobCheck = mob:getObjectsInCell(mob.m, newX, newY, BL_MOB)		
			
			if (passCheck == 0 and #mobCheck == 0 and tileCheck == 21) then
				mob:warp(mob.m, newX, newY)
				hasMoved = true
			end
		until hasMoved
	end	
end,
	
	
on_attacked = function(mob, attacker)
	local block = getTargetFacing(attacker, BL_MOB)
	local axe = attacker:getEquippedItem(EQ_WEAP)
	
	if (attacker.critChance == 0) then
		return
	end
	
	if (block.id == mob.id) then
		if (axe ~= nil and axe.id == 1000000400) then
			attacker:flushDuration(1)
			mob:addHealth(-10)
			
			if (math.random(3) == 1) then
				attacker:addItem("flaming_ash_log", 1)
				attacker:playSound(355)	
			end					
		else
			attacker:sendMinitext("May I axe you a question? Why are you logging without an axe?")
		end
	end
end,
	
after_death = function(mob, player)
	local rate = math.random(100)
	local skill = math.random(2, 3) 
	local skillChance = math.random(4)
	local bonusChance = math.random(player.registry["lumberjack"] + 1) / (player.registry["lumberjack"] + 1)
	local chance = ((player.registry["lumberjack"] / 30) + 50)
	local craftlevel = "Beginner"
	
	if (chance > 85) then 
		chance = 85
	end

	if (chance > rate) then
		if (bonusChance > 0.33) then
			skill = skill + 1
		elseif (bonusChance > 0.66) then
			skill = skill + 2
		elseif (bonusChance > 0.85) then
			skill = skill + 3
		end
		
		if (skillChance > 1) then
			player.registry["lumberjack"] = player.registry["lumberjack"] + (skill * 2)
		end
			
		if (player.registry["lumberjack"] < 25) then
			craftlevel = "Beginner"
		elseif (player.registry["lumberjack"] >= 25 and player.registry["lumberjack"] < 220) then
			craftlevel = "Novice"
		elseif (player.registry["lumberjack"] >= 220 and player.registry["lumberjack"] < 840) then
			craftlevel = "Apprentice"
		elseif (player.registry["lumberjack"] >= 840 and player.registry["lumberjack"] < 2200) then
			craftlevel = "Accomplished"
		elseif (player.registry["lumberjack"] >= 2200 and player.registry["lumberjack"] < 6400) then
			craftlevel = "Adept"
		elseif (player.registry["lumberjack"] >= 6400 and player.registry["lumberjack"] < 18000) then
			craftlevel = "Talented"
		elseif (player.registry["lumberjack"] >= 18000 and player.registry["lumberjack"] < 50000) then
			craftlevel = "Skilled"
		elseif (player.registry["lumberjack"] >= 50000 and player.registry["lumberjack"] < 124000) then
			craftlevel = "Expert"
		elseif (player.registry["lumberjack"] >= 124000 and player.registry["lumberjack"] < 237000) then
			craftlevel = "Master"
		elseif (player.registry["lumberjack"] >= 237000 and player.registry["lumberjack"] < 400000) then
			craftlevel = "Grand Master"
		elseif (player.registry["lumberjack"] >= 400000 and player.registry["lumberjack"] < 680000) then
			craftlevel = "Champion"
		elseif (player.registry["lumberjack"] >= 680000) then
			craftlevel = "Legendary"
		end
		
		if (math.random(2) == 1) then
			player:addItem("flaming_ash_log", 1)
		end
		
		player:removeLegendbyName("lumberjack")
		player:addLegend(craftlevel.." lumberjack", "lumberjack", 41, 128)
	end
end
}