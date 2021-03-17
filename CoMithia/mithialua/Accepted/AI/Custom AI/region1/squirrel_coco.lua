squirrel_coco = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob, attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,
	
move = function(mob,target)
	local randTalk = math.random(20000)
	local checkItems = findObjects(mob, 8)
	local player = {}
	local item, founditem
	local moved, found
	local dist = 100
	
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (randTalk == 53) then
		mob:talk(0,"Squirrel: Squeak")
	end
	
	if (#checkItems > 0) then
		for i = 1, #checkItems do
			founditem = FloorItem(checkItems[i].ID)
			player = mob:getObjectsInCell(founditem.m, founditem.x, founditem.y, BL_PC)
			if ((founditem.id == 120 or founditem.id == 121 or founditem.id == 122) and #player < 1) then
				if (distance(mob, founditem) < dist) then
					dist = distance(mob, founditem)
					item = founditem
				end
			end
		end
		
		if (dist ~= 100) then
			found = toObject(mob, item)
			if (found == true) then
				if (item.amount > 1) then
					item.amount = item.amount - 1
				else
					item:delete()
				end
			end
		else
			mob_ai_basic.move(mob,target)
		end
	else
		mob_ai_basic.move(mob,target)	
	end
end,

attack=function(mob,target)
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
			--We are right next to them, so attack!
			--CRIT
			local crit = math.random(1,20)  -- 1,20
			if(crit==15)then
				local dmg=math.random(mob.might,mob.might*3)
				local dmg2=math.random(2,dmg)
				local dropchance=math.random(1,100)
				target:removeHealth(dmg)
				--[[if(mob.health<=dmg2)then
					--mob.attacker = 0
					mob:attackIT(target,mob.might,mob.might/2)
					return
				else
					mob:removeHealth(dmg2)
				end]]-- no suicide
				if(mob.health<=dmg2)then--suicide
					mob.attacker = 0
				else
				end
				mob:removeHealth(dmg2)--

				if (dropchance>87) then
					target:dropItem(122,1,target.ID)
					target:sendMinitext("The squirrel hits you with a coconut!")
				else
					target:sendMinitext("The squirrel broke a coconut on you!")
				end
			else
				mob:attack(target.ID)
			end
		else
			mob.state = MOB_ALIVE
		end
	else
		mob.state = MOB_ALIVE
	end
end,

after_death=function(mob,block)
	local e = math.random(100000)
	if (e <= 5000) then
		local c = math.random(1,2)
		local d = math.random(0,3)
		local loop
		local i = 0
		local h = {}
		h = mob:getObjectsInSameMap(BL_MOB)
		for loop = 1,#h do
			if (h[loop].mobID == 11) then
				i = i + 1
			end
		end
		if (i < 1) then
			local f = math.random(1,10)
			local x, y
			if (f==1) then
				x = 64
				y = 62
			elseif (f==2) then
				x = 13
				y = 55
			elseif (f==3) then
				x = 15
				y = 29
			elseif (f==4) then
				x = 18
				y = 13
			elseif (f==5) then
				x = 39
				y = 14
			elseif (f==6) then
				x = 53
				y = 16
			elseif (f==7) then
				x = 51
				y = 31
			elseif (f==8) then
				x = 41
				y = 42
			elseif (f==9) then
				x = 23
				y = 21
			elseif (f==10) then
				x = 47
				y = 16
			end
			block:spawn(11,x,y,1)
			broadcast(1, "The squirrel's leader has become enraged. ("..x..", "..y..")")
		end
	end
end
}
