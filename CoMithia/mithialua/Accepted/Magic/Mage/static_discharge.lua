static_discharge = {
on_learn = function(player)
	if (player:hasSpell("static_shock")) then
		player:removeSpell("static_shock")
	end
	
	if (player:hasSpell("static_air")) then
		player:removeSpell("static_air")
	end
	
	player.registry["learned_static_shock"] = 1
	player.registry["learned_static_air"] = 1
end,

cast = function(player)
	local aether = 1000
	local magicCost = 350
	local damage = 1500
	local targets = {}
	local threat
	local targetsLeft = player:getObjectsInCell(player.m, player.x - 1, player.y, BL_MOB)
	local targetsRight = player:getObjectsInCell(player.m, player.x + 1, player.y, BL_MOB)
	local targetsUp = player:getObjectsInCell(player.m, player.x, player.y - 1, BL_MOB)
	local targetsDown = player:getObjectsInCell(player.m, player.x, player.y + 1, BL_MOB)
	
	if (#targetsLeft == 0) then
		targetsLeft = player:getObjectsInCell(player.m, player.x - 1, player.y, BL_PC)
		
		if (#targetsLeft > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (not player:canPK(targetsLeft[i])) then
					table.remove(targetsLeft, i)
					i = i - 1
				end
			until (i == #targetsLeft)
		end
	end
	
	if (#targetsRight == 0) then
		targetsRight = player:getObjectsInCell(player.m, player.x + 1, player.y, BL_PC)
		
		if (#targetsRight > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (not player:canPK(targetsRight[i])) then
					table.remove(targetsRight, i)
					i = i - 1
				end
			until (i == #targetsRight)
		end
	end
	
	if (#targetsUp == 0) then
		targetsUp = player:getObjectsInCell(player.m, player.x, player.y - 1, BL_PC)
		
		if (#targetsUp > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (not player:canPK(targetsUp[i])) then
					table.remove(targetsUp, i)
					i = i - 1
				end
			until (i == #targetsUp)
		end
	end
	
	if (#targetsDown == 0) then
		targetsDown = player:getObjectsInCell(player.m, player.x, player.y + 1, BL_PC)
		
		if (#targetsDown > 0) then
			i = 0
			
			repeat
				i = i + 1
				
				if (not player:canPK(targetsDown[i])) then
					table.remove(targetsDown, i)
					i = i - 1
				end
			until (i == #targetsDown)
		end
	end
	
	if (#targetsLeft > 0) then
		table.insert(targets, targetsLeft[1])
	end
	
	if (#targetsRight > 0) then
		table.insert(targets, targetsRight[1])
	end
	
	if (#targetsUp > 0) then
		table.insert(targets, targetsUp[1])
	end
	
	if (#targetsDown > 0) then
		table.insert(targets, targetsDown[1])
	end
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (#targets > 0) then
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:playSound(59)
		player:sendAnimation(51, 0)
		
		for i = 1, #targets do
			if (targets[i].blType == BL_PC) then
				player:setAether("static_discharge", aether)
			end
			--if (checkProtection(player, targets[i], 1500)) then
				--DOES NOT APPLY, MOBS DON'T HAVE STATUS BOX
			--else
			targets[i].attacker = player.ID
			threat = targets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
			player:addThreat(targets[i].ID, threat)
			if (#player.group > 1) then
				targets[i]:setGrpDmg(player.ID, threat)
			else
				targets[i]:setIndDmg(player.ID, threat)
			end			
			targets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			--end
		end
	end
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Weak elemental attack striking foes around the caster"}
	return level, items, itemAmounts, description
end
}