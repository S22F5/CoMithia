red_worm = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,
	
move = function(mob, target)

	local boss2 = mob:getObjectsInSameMap(BL_MOB)
	local mobtalk = math.random(4)
	local loop, i
	local loop2 = 0
	
	-- Checks presence of Mob 9 and records actor/block in loop2
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	for loop = 1, #boss2 do
		if (boss2[loop].mobID == 9) then
			--boss2[loop]:talk(0,"Red worm can see me just fine! and my state is: "..boss2[loop].state)
			loop2 = loop
			break
		end
	end
	
	-- Checks health of the mob, and makes it escape the player. Escapes anyway if Mob 9 is alive
	
	if (mob.maxHealth/2.5 > mob.health)then
		mob.newMove = 1000
		RunAway(mob, target)
	elseif(loop2 > 0)then
		if (boss2[loop2].state ~= 4)then
			mob.newMove = 1500
			RunAway(mob, target)
		else
			mob.newMove = 0
			
			-- Adjusts Mob Speed depending on distance
			
			if (distance(mob, target) > 5) then
				mob:sendAnimation(42)
				if(mobtalk == 2) then
					mob:talk(0, "~burrows under the ground~")
				end
				mob.newMove = 1
				mob_ai_basic.move(mob,target)
			elseif (distance(mob, target) > 3) then
				mob:sendAnimation(41)
				if(mobtalk == 2) then
					mob:talk(0, "~burrows under the ground~")
				end
				mob.newMove = 500
				mob_ai_basic.move(mob, target)
			else
				mob_ai_basic.move(mob, target)
			end
		end
	else
		mob.newMove = 0
		mob_ai_basic.move(mob,target)
	end
end,

attack=function(mob,target)

	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if(target) then
	
		threat.calcHighestThreat(mob)
		
		local bosscheck
		local moved = FindCoords(mob, target)
		local boss2 = mob:getObjectsInSameMap(BL_MOB)
		local block = mob:getBlock(mob.target)
		
		-- Checks and assign target value depending on Block type
		
		if (block ~= nil) then
			target = block
		end

		-- Checks if the Green Worm is alive
		
		if (#boss2 > 0) then
			for x = 1, #boss2 do
				if (boss2[x].name == "Green worm") then
					bosscheck = 1
					break
				end
			end
		end
		
		if (mob.maxHealth/2.5 > mob.health and bosscheck == 1)then
			mob.newMove = 1000
			mob.state = MOB_ALIVE
			RunAway(mob,target)
		elseif(moved) then
		
			--We are right next to them, so attack! | Will acquire the player directly behind as well
			
			local target2 = {}
			
			if (mob.side == 0) then --up
				target2 = mob:getObjectsInCell (mob.m, mob.x, mob.y-2, BL_PC)
			elseif (mob.side == 1) then --right
				target2 = mob:getObjectsInCell (mob.m, mob.x+2, mob.y, BL_PC)
			elseif (mob.side == 2) then --down
				target2 = mob:getObjectsInCell (mob.m, mob.x, mob.y+2, BL_PC)
			elseif (mob.side == 3) then --left
				target2 = mob:getObjectsInCell (mob.m, mob.x-2, mob.y, BL_PC)
			end
			
			-- Attacks target2 block if it exists
			
			for n = 1, #target2 do
				dmg2 = math.random(mob.might, mob.might+2)
				if(target2[n].blType == BL_PC) then
					target2[n].attacker = mob.ID
					target2[n]:removeHealthExtend(dmg2, 0, 1, 1, 1, 0)
				end
			end
			
			mob:attack(target.ID)
			
			--Drain other boss' health
			
			if (mob.maxHealth/3 >= mob.health) then
				for i = 1, #boss2 do
					if (boss2[i].mobID == 9) then
						boss2[i]:sendAnimation(41)
						mob:sendAnimation(41)
						if (boss2[i].health >= 10) then
							local suck = boss2[i].health/3
							local b2ot = Mob(boss2[i].ID).target
							mob:talk(2,"*slithers*")
							mob.attacker = mob.ID
							mob:addHealth(suck*1.5)
							Mob(boss2[i].ID).attacker = boss2[i].ID
							boss2[i]:addHealthExtend(suck, 0, 1, 1, 1, 0)
							Mob(boss2[i].ID).target = b2ot
							boss2[i]:talk(2,"*slithers along*")
						end
					end
				end
			end
		else
			mob.state = MOB_ALIVE
		end	
	else
		mob.state = MOB_ALIVE
	end
end,


after_death=function(mob,block)
	local item = 123
	local amount = 1
	local rate = math.random(1000)
	
	
	local boss2 = mob:getObjectsInSameMap(BL_MOB)
	
	-- If there are no more mobs, the floor caves in, so items are removed from map 6 and put on map 11
	-- Chance to drop Bug's liver if all other mobs are dead
	
	if (#boss2==0) then

		if (rate <= 350) then
			mob:dropItemXY(item, amount, 11, mob.x, mob.y)
		end
			
		local mItems = mob:getObjectsInSameMap(BL_ITEM)
		
		if (#mItems ~= 0) then
			for i = 1, #mItems do
				mob:dropItemXY(mItems[i].id, mItems[i].amount,11,mItems[i].x,mItems[i].y)
				mItems[i]:delete()
			end	
		end

		-- Starts to warp players through hit by a rock as all monsters are dead
		
		local players = mob:getObjectsInSameMap(BL_PC)

		for i = 1,#players do
			hit_by_a_rock.cast(mob, players[i])
		end
	else
		if (rate <= 350) then
			mob:dropItem(item, amount)
		end
	end
end
}
