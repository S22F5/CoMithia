green_worm = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,
	
move = function(mob, target)
	mob_ai_basic.move(mob, target)
end,

attack=function(mob, target)

	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if(target) then
		threat.calcHighestThreat(mob)
		local block = mob:getBlock(mob.target)
		
		if (block ~= nil) then
			target = block
		end
		
		local moved=FindCoords(mob,target)
		
		if(moved) then
		
			--We are right next to them, so attack | Mob leeches and heals for half of his damage, and attacks two spaces in front of it
			
			mob:attack(target.ID)
			local dmg3 = math.random(mob.might/2, mob.might)
			mob:addHealth(dmg3/2)
			local target2 = {}
			
			-- Evaluating presence of another player behind the target
			
			if (mob.side == 0) then --up
				target2 = mob:getObjectsInCell(mob.m, mob.x, mob.y-2, BL_PC)
			elseif (mob.side == 1) then --right
				target2 = mob:getObjectsInCell(mob.m, mob.x+2, mob.y, BL_PC)
			elseif (mob.side == 2) then --down
				target2 = mob:getObjectsInCell(mob.m, mob.x, mob.y+2, BL_PC)
			elseif (mob.side == 3) then --left
				target2 = mob:getObjectsInCell(mob.m, mob.x-2, mob.y, BL_PC)
			end
			
			for n = 1, #target2 do
			
				local dmg2 = math.random(mob.might, mob.might+2)
				
				if(target2[n].blType == BL_PC) then
					target2[n].attacker = mob.ID
					target2[n]:removeHealthExtend(dmg2, 0, 1, 1, 1, 0)
					mob:addHealth(dmg2)

					-- Look for presence of ID 10 on map and heal it as well
					
					local boss2 = mob:getObjectsInSameMap(BL_MOB)
					local loop, i
					
					for loop = 1, #boss2 do
						if (boss2[loop].mobID == 10) then
							boss2[loop]:sendAnimation(40)
							mob:sendAnimation(40)
							boss2[loop]:addHealth(dmg2)
						end
					end
				end
			end
			
			-- This ensures that ID 10 also gets healed even if there is only one player fighting.
			
			local boss_2 = mob:getObjectsInSameMap(BL_MOB)
			local loop, i
			
			for loop = 1, #boss_2 do
				if (boss_2[loop].mobID == 10) then
					boss_2[loop]:sendAnimation(40)
					mob:sendAnimation(40)
					boss_2[loop]:addHealth(dmg3)
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

	local item = 124
	local amount = 1
	local rate1 = math.random(1000)
	local rate2 = math.random(1000)

	local boss2 = mob:getObjectsInSameMap(BL_MOB)
	
	if (#boss2 == 0) then
	
		-- Decides to give Dung, with a chance to get a double drop
		
		if (rate1 <= 25) then
			mob:dropItemXY(item, amount, 11, mob.x, mob.y)
		end
		
		if (rate2 <= 10) then
			mob:dropItemXY(item, amount, 11, mob.x, mob.y)
		end

		-- If there are no more mobs, the floor caves in, so items are removed from map 6 and put on map 11
		
		local mItems = mob:getObjectsInSameMap(BL_ITEM)
		
		if (#mItems ~= 0) then
			for i = 1, #mItems do
				mob:dropItemXY(mItems[i].id, mItems[i].amount, 11, mItems[i].x, mItems[i].y)
				mItems[i]:delete()
			end	
		end

		-- Refers to script to warp players on to the next map
		
		local players = mob:getObjectsInSameMap(BL_PC)
		
		for i = 1, #players do
			hit_by_a_rock.cast(mob, players[i])
		end
		
	else
	
		-- If another mob was still alive, no cave in, normal drops
		
		if (rate1 <= 25) then
			mob:dropItem(item, amount)
		end
		
		if (rate2 <= 10) then
			mob:dropItem(item, amount)
		end
	end
end
}