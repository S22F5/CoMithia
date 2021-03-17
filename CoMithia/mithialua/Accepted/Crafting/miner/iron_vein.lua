iron_vein = {
on_attacked = function(mob, attacker)
	local block = getTargetFacing(attacker, BL_MOB)
	local pick = attacker:getEquippedItem(EQ_WEAP)
	
	if (attacker.critChance == 0) then
		return
	end
	
	if (block.ID == mob.ID) then
		if (pick ~= nil and pick.id == 1000000100) then --Mining Pick
			attacker:flushDuration(1)
			mob:addHealth(-10)
			
			if (math.random(3) == 1) then
				attacker:addItem("iron_ore",1)
				attacker:playSound(45)	
			end					
		else
			attacker:sendMinitext("You cannot mine without proper mining tools.")
		end
	end
end,
	
on_spawn = function(mob)
	local hasMoved = false
	
	if (mob.m == 96) then
		repeat
			local newX = math.random(0,49)
			local newY = math.random(0,46)
			local passCheck = getPass(mob.m, newX, newY)
			local tileCheck = getTile(mob.m, newX, newY)
			local npcCheck = mob:getObjectsInCell(mob.m, newX, newY, BL_MOB)		
			
			if(passCheck == 0 and #npcCheck == 0 and tileCheck == 36301) then
				mob:warp(mob.m, newX, newY)
				hasMoved = true
			end
		until hasMoved
	end	
end,
	
after_death=function(mob,player)
	local rand = math.random(100)
	local gem = math.random(100)
	local skillAdded = math.random(2, 3)
	local skillAddChance = math.random(4)
	local bonus = math.random(0, player.registry["miner"] + 1) / (player.registry["miner"] + 1)
	local improveChance = ((player.registry["miner"] / 30) + 50)
	local craftlevel = "Beginner"
	
	if(not player:hasEquipped({"mining_pick"}) and not player:hasEquipped({"sturdy_mining_pick"}) and not player:hasEquipped({"reinforced_mining_pick"})) then
		player:sendMinitext("You can not mine without proper mining tools.")
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
			player.registry["miner"] = player.registry["miner"] + (skillAdded * 2)
		end
		
		if (player.registry["miner"] < 25) then
			craftlevel = "Beginner"
		elseif (player.registry["miner"] >= 25 and player.registry["miner"] < 220) then
			craftlevel = "Novice"
		elseif (player.registry["miner"] >= 220 and player.registry["miner"] < 840) then
			craftlevel = "Apprentice"
		elseif (player.registry["miner"] >= 840 and player.registry["miner"] < 2200) then
			craftlevel = "Accomplished"
		elseif (player.registry["miner"] >= 2200 and player.registry["miner"] < 6400) then
			craftlevel = "Adept"
		elseif (player.registry["miner"] >= 6400 and player.registry["miner"] < 18000) then
			craftlevel = "Talented"
		elseif (player.registry["miner"] >= 18000 and player.registry["miner"] < 50000) then
			craftlevel = "Skilled"
		elseif (player.registry["miner"] >= 50000 and player.registry["miner"] < 124000) then
			craftlevel = "Expert"
		elseif (player.registry["miner"] >= 124000 and player.registry["miner"] < 237000) then
			craftlevel = "Master"
		elseif (player.registry["miner"] >= 237000 and player.registry["miner"] < 400000) then
			craftlevel = "Grand Master"
		elseif (player.registry["miner"] >= 400000 and player.registry["miner"] < 680000) then
			craftlevel = "Champion"
		elseif (player.registry["miner"] >= 680000) then
			craftlevel = "Legendary"
		end
		
		player:addItem("iron_ore", 1)
		player:playSound(45)
		player:removeLegendbyName("miner")
		player:addLegend(craftlevel.." miner", "miner", 93, 128)
	end
end
}
