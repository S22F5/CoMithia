pounce = {
cast = function(player)
	local mobTargets = {getTargetFacing(player, BL_MOB), getTargetFacing(player, BL_MOB, 0, 2)}
	local pcTargets = {getTargetFacing(player, BL_PC), getTargetFacing(player, BL_PC, 0 , 2)}
	local aether = 25000
	local duration = 2000
	local damage = (((player.health * 1.3) + (player.magic * .9)) / 2)
	local threat
	local healthCost = (player.health * .5)
	local magicCost = (player.magic * .5)
	local minHealth = 100
	local minMagic = 100
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (not player:hasDuration("pounce")) then
		if (player.health < minHealth or player.health - healthCost <= 0) then
			player:sendMinitext("Not enough vita.")
			return
		end
		
		if (player.magic < minMagic) then
			player:sendMinitext("Not enough mana.")
			return
		end
	end
	
	if (player.registry["pounce"] > 0) then
		damage = player.registry["pounce"]
	end
	
	player:sendAction(1, 20)
	player:playSound(65)
	
	if (mobTargets[2] ~= nil) then
		if (not player:hasDuration("pounce")) then
			player.health = player.health - healthCost
			player.magic = player.magic - magicCost
			player:sendStatus()
			player:sendMinitext("You cast Pounce.")
			player:setDuration("pounce", duration)
			player.registry["pounce"] = damage
		else
			player:sendMinitext("You cast Pounce.")
			player:setAether("pounce", aether)
			player.registry["pounce"] = 0
		end
	
		canAmbush(player, mobTargets[2])
		
		if (mobTargets[1] ~= nil) then
			mobTargets[1]:sendAnimation(69, 0)
			mobTargets[1].attacker = player.ID
			threat = mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
			player:addThreat(mobTargets[1].ID, threat)
			
			if (#player.group > 1) then
				mobTargets[1]:setGrpDmg(player.ID, threat)
			else
				mobTargets[1]:setIndDmg(player.ID, threat)
			end
			
			mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		elseif (pcTargets[1] ~= nil) then
			pcTargets[1]:sendAnimation(69, 0)
			
			if (player:canPK(pcTargets[1])) then
				pcTargets[1].attacker = player.ID
				pcTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				pcTargets[1]:sendMinitext(player.name.." pounces you.")
			end
		end
		
		mobTargets[2]:sendAnimation(69, 0)
		mobTargets[2].attacker = player.ID
		threat = mobTargets[2]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
		player:addThreat(mobTargets[2].ID, threat)
		
		if (#player.group > 1) then
			mobTargets[2]:setGrpDmg(player.ID, threat)
		else
			mobTargets[2]:setIndDmg(player.ID, threat)
		end
		
		mobTargets[2]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
	elseif (pcTargets[2] ~= nil) then
		if (not player:hasDuration("pounce")) then
			player.health = player.health - healthCost
			player.magic = player.magic - magicCost
			player:sendStatus()
			player:sendMinitext("You cast Pounce.")
			player:setDuration("pounce", duration)
			player.registry["pounce"] = damage
		else
			player:sendMinitext("You cast Pounce.")
			player:setAether("pounce", aether)
			player.registry["pounce"] = 0
		end
	
		canAmbush(player, pcTargets[2])
		
		if (mobTargets[1] ~= nil) then
			mobTargets[1]:sendAnimation(69, 0)
			mobTargets[1].attacker = player.ID
			threat = mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
			player:addThreat(mobTargets[1].ID, threat)
			
			if (#player.group > 1) then
				mobTargets[1]:setGrpDmg(player.ID, threat)
			else
				mobTargets[1]:setIndDmg(player.ID, threat)
			end
			
			mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		elseif (pcTargets[1] ~= nil) then
			pcTargets[1]:sendAnimation(69, 0)
			
			if (player:canPK(pcTargets[1])) then
				pcTargets[1].attacker = player.ID
				pcTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				pcTargets[1]:sendMinitext(player.name.." pounces you.")
			end
		end
		
		pcTargets[2]:sendAnimation(69, 0)
			
		if (player:canPK(pcTargets[2])) then
			pcTargets[2].attacker = player.ID
			pcTargets[2]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			pcTargets[2]:sendMinitext(player.name.." pounces you.")
		end
	else
		local checkPCNorth = player:getObjectsInCell(player.m, player.x, player.y - 3, BL_PC)
		local checkMobNorth = player:getObjectsInCell(player.m, player.x, player.y - 3, BL_MOB)
		local checkNPCNorth = player:getObjectsInCell(player.m, player.x, player.y - 3, BL_NPC)
		
		local checkPCEast = player:getObjectsInCell(player.m, player.x + 3, player.y, BL_PC)
		local checkMobEast = player:getObjectsInCell(player.m, player.x + 3, player.y, BL_MOB)
		local checkNPCEast = player:getObjectsInCell(player.m, player.x + 3, player.y, BL_NPC)
		
		local checkPCWest = player:getObjectsInCell(player.m, player.x - 3, player.y, BL_PC)
		local checkMobWest = player:getObjectsInCell(player.m, player.x - 3, player.y, BL_MOB)
		local checkNPCWest = player:getObjectsInCell(player.m, player.x - 3, player.y, BL_NPC)

		local checkPCSouth = player:getObjectsInCell(player.m, player.x, player.y + 3, BL_PC)
		local checkMobSouth = player:getObjectsInCell(player.m, player.x, player.y + 3, BL_MOB)
		local checkNPCSouth = player:getObjectsInCell(player.m, player.x, player.y + 3, BL_NPC)
		
		if (#checkNPCNorth > 0) then
			for i = 1, #checkNPCNorth do
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			end
		end
		
		if (#checkNPCEast > 0) then
			for i = 1, #checkNPCEast do
				if (checkNPCEast[i].subType == 2 or checkNPCEast[i].subType == 3) then
					table.remove(checkNPCEast, i)
					i = i - 1
				end
			end
		end
		
		if (#checkNPCWest > 0) then
			for i = 1, #checkNPCWest do
				if (checkNPCWest[i].subType == 2 or checkNPCWest[i].subType == 3) then
					table.remove(checkNPCWest, i)
					i = i - 1
				end
			end
		end
		
		if (#checkNPCSouth > 0) then
			for i = 1, #checkNPCNorth do
				if (checkNPCNorth[i].subType == 2 or checkNPCNorth[i].subType == 3) then
					table.remove(checkNPCNorth, i)
					i = i - 1
				end
			end
		end
		
		if (player.side == 0 and (#checkPCNorth + #checkMobNorth + #checkNPCNorth) == 0 and player:objectCanMove(player.x, player.y - 3, 0) and player:objectCanMoveFrom(player.x, player.y - 2, 0) and getPass(player.m, player.x, player.y - 3) == 0) then
			if (mobTargets[1] ~= nil or pcTargets[1] ~= nil) then
				if (not player:hasDuration("pounce")) then
					player.health = player.health - healthCost
					player.magic = player.magic - magicCost
					player:sendStatus()
					player:sendMinitext("You cast Pounce.")
					player:setDuration("pounce", duration)
					player.registry["pounce"] = damage
				else
					player:sendMinitext("You cast Pounce.")
					player:setAether("pounce", aether)
					player.registry["pounce"] = 0
				end
			
				player:warp(player.m, player.x, player.y - 3)
				player.side = 2
				player:sendSide()
			end
				
			if (mobTargets[1] ~= nil) then
				mobTargets[1]:sendAnimation(69, 0)
				mobTargets[1].attacker = player.ID
				threat = mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
				player:addThreat(mobTargets[1].ID, threat)
				
				if (#player.group > 1) then
					mobTargets[1]:setGrpDmg(player.ID, threat)
				else
					mobTargets[1]:setIndDmg(player.ID, threat)
				end
				
				mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			elseif (pcTargets[1] ~= nil) then
				pcTargets[1]:sendAnimation(69, 0)
			
				if (player:canPK(pcTargets[1])) then
					pcTargets[1].attacker = player.ID
					pcTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
					pcTargets[1]:sendMinitext(player.name.." pounces you.")
				end
			else
				player:sendMinitext("That is no longer useful.")
				return
			end			
		elseif (player.side == 1 and (#checkPCEast + #checkMobEast + #checkNPCEast) == 0 and player:objectCanMove(player.x + 3, player.y, 1) and player:objectCanMoveFrom(player.x + 2, player.y, 1) and getPass(player.m, player.x + 3, player.y) == 0) then
			if (mobTargets[1] ~= nil or pcTargets[1] ~= nil) then
				if (not player:hasDuration("pounce")) then
					player.health = player.health - healthCost
					player.magic = player.magic - magicCost
					player:sendStatus()
					player:sendMinitext("You cast Pounce.")
					player:setDuration("pounce", duration)
					player.registry["pounce"] = damage
				else
					player:sendMinitext("You cast Pounce.")
					player:setAether("pounce", aether)
					player.registry["pounce"] = 0
				end
			
				player:warp(player.m, player.x + 3, player.y)
				player.side = 3
				player:sendSide()
			end
			
			if (mobTargets[1] ~= nil) then
				mobTargets[1]:sendAnimation(69, 0)
				mobTargets[1].attacker = player.ID
				threat = mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
				player:addThreat(mobTargets[1].ID, threat)
				
				if (#player.group > 1) then
					mobTargets[1]:setGrpDmg(player.ID, threat)
				else
					mobTargets[1]:setIndDmg(player.ID, threat)
				end
				
				mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			elseif (pcTargets[1] ~= nil) then
				pcTargets[1]:sendAnimation(69, 0)
				
				if (player:canPK(pcTargets[1])) then
					pcTargets[1].attacker = player.ID
					pcTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
					pcTargets[1]:sendMinitext(player.name.." pounces you.")
				end
			else
				player:sendMinitext("That is no longer useful.")
				return
			end
		elseif (player.side == 2 and (#checkPCSouth + #checkMobSouth + #checkNPCSouth) == 0 and player:objectCanMove(player.x, player.y + 3, 2) and player:objectCanMoveFrom(player.x, player.y + 2, 2) and getPass(player.m, player.x, player.y + 3) == 0) then
			if (mobTargets[1] ~= nil or pcTargets[1] ~= nil) then
				if (not player:hasDuration("pounce")) then
					player.health = player.health - healthCost
					player.magic = player.magic - magicCost
					player:sendStatus()
					player:sendMinitext("You cast Pounce.")
					player:setDuration("pounce", duration)
					player.registry["pounce"] = damage
				else
					player:sendMinitext("You cast Pounce.")
					player:setAether("pounce", aether)
					player.registry["pounce"] = 0
				end
			
				player:warp(player.m, player.x, player.y + 3)
				player.side = 0
				player.sendSide()
			end
			
			if (mobTargets[1] ~= nil) then
				mobTargets[1]:sendAnimation(69, 0)
				mobTargets[1].attacker = player.ID
				threat = mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
				player:addThreat(mobTargets[1].ID, threat)
				
				if (#player.group > 1) then
					mobTargets[1]:setGrpDmg(player.ID, threat)
				else
					mobTargets[1]:setIndDmg(player.ID, threat)
				end
				
				mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			elseif (pcTargets[1] ~= nil) then
				pcTargets[1]:sendAnimation(69, 0)
				
				if (player:canPK(pcTargets[1])) then
					pcTargets[1].attacker = player.ID
					pcTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
					pcTargets[1]:sendMinitext(player.name.." pounces you.")
				end
			else
				player:sendMinitext("That is no longer useful.")
				return
			end
		elseif (player.side == 3 and (#checkPCWest + #checkMobWest + #checkNPCWest) == 0 and player:objectCanMove(player.x - 3, player.y, 3) and player:objectCanMoveFrom(player.x - 2, player.y, 3) and getPass(player.m, player.x - 3, player.y) == 0) then
			if (mobTargets[1] ~= nil or pcTargets[1] ~= nil) then
				if (not player:hasDuration("pounce")) then
					player.health = player.health - healthCost
					player.magic = player.magic - magicCost
					player:sendStatus()
					player:sendMinitext("You cast Pounce.")
					player:setDuration("pounce", duration)
					player.registry["pounce"] = damage
				else
					player:sendMinitext("You cast Pounce.")
					player:setAether("pounce", aether)
					player.registry["pounce"] = 0
				end
			
				player:warp(player.m, player.x - 3, player.y)
				player.side = 1
				player:sendSide()
			end
			
			if (mobTargets[1] ~= nil) then
				mobTargets[1]:sendAnimation(69, 0)
				mobTargets[1].attacker = player.ID
				threat = mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
				player:addThreat(mobTargets[1].ID, threat)
				
				if (#player.group > 1) then
					mobTargets[1]:setGrpDmg(player.ID, threat)
				else
					mobTargets[1]:setIndDmg(player.ID, threat)
				end
				
				mobTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			elseif (pcTargets[1] ~= nil) then
				pcTargets[1]:sendAnimation(69, 0)
				
				if (player:canPK(pcTargets[1])) then
					pcTargets[1].attacker = player.ID
					pcTargets[1]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
					pcTargets[1]:sendMinitext(player.name.." pounces you.")
				end
			else
				player:sendMinitext("That is no longer useful.")
				return
			end
		else
			player:setAether("pounce", aether)
			player:sendMinitext("You have nowhere to land.")
			return
		end
	end
end,

uncast = function(player)
	local aether = 25000
	
	player:setAether("pounce", aether)
	player.registry["pounce"] = 0
end,

requirements = function(player)
	local level = 31
	local items = {}
	local itemAmountes = {}
	local description = {"Strong scaling attack that leaps through enemies and then back around"}
	
	return level, items, itemAmounts, description
end
}