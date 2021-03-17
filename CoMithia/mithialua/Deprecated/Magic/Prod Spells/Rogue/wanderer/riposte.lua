riposte = {
cast = function(player)
	local mobTarget = getTargetFacing(player, BL_MOB)
	local pcTarget = getTargetFacing(player, BL_PC)
	local itemCellBlocks = {}
	local aether = 50000
	local damage = (player.health * .3)
	local threat
	local healthCost = (player.health * .15)
	local magicCost = 500
	local playerX = player.x
	local playerY = player.y
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health - healthCost <= 0) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (mobTarget == nil and pcTarget == nil) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("riposte", aether)
	player:sendMinitext("You cast Riposte.")
	player:playSound(72)
	
	if (mobTarget ~= nil) then
		player.health = player.health - healthCost
		player.magic = player.magic - magicCost
		player:sendStatus()
		
		mobTarget.attacker = player.ID
		threat = mobTarget:removeHealthExtend(damage, 1, 1, 1, 1, 2)
		player:addThreat(mobTarget.ID, threat)
		mobTarget:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		
		player:warp(mobTarget.m, mobTarget.x, mobTarget.y)
		mobTarget:warp(player.m, playerX, playerY)
		
		if (player.side / 2 < 1) then
			player.side = player.side + 2
			player:sendSide()
			
			if (mobTarget.side == player.side) then
				mobTarget.side = mobTarget.side - 2
				mobTarget:sendSide()
			end
		else
			player.side = player.side - 2
			player:sendSide()
			
			if (mobTarget.side == player.side) then
				mobTarget.side = mobTarget.side + 2
				mobTarget:sendSide()
			end
		end

		mobTarget:sendAnimation(89, 0)
		
		if (#player.group > 1) then
			mobTarget:setGrpDmg(player.ID, threat)
		else
			mobTarget:setIndDmg(player.ID, threat)
		end
	elseif (pcTarget ~= nil) then
		itemCellBlocks = player:getObjectsInCell(pcTarget.m, pcTarget.x, pcTarget.y, BL_ITEM)
		
		if (#itemCellBlocks == 0 or player.pvp > 0) then
			if (player:canPK(pcTarget)) then
				player.health = player.health - healthCost
				player.magic = player.magic - magicCost
				player:sendStatus()
				pcTarget.attacker = player.ID
				pcTarget:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			end
			player:warp(pcTarget.m, pcTarget.x, pcTarget.y)
			pcTarget:warp(player.m, playerX, playerY)
			pcTarget:sendMinitext(player.name.." ripostes your attack.")

			if (player.side / 2 < 1) then
				player.side = player.side + 2
				player:sendSide()
				
				if (pcTarget.side == player.side) then
					pcTarget.side = pcTarget.side - 2
					pcTarget:sendSide()
				end
			else
				player.side = player.side - 2
				player:sendSide()
				
				if (pcTarget.side == player.side) then
					pcTarget.side = pcTarget.side + 2
					pcTarget:sendSide()
				end
			end
			pcTarget:sendAnimation(89, 0)

		end
	end
end,



requirements = function(player)
	local level = 37
	local items = {}
	local itemAmounts = {}
	local description = {"You take the place of your foe damaging them in the process"}
	
	return level, items, itemAmounts, description
end
}