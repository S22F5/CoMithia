expunge = {
cast = function(player)
	local mobTargets = {getTargetFacing(player, BL_MOB), getTargetFacing(player, BL_MOB, 0, 2), getTargetFacing(player, BL_MOB, 0, 3)}
	local pcTargets = {getTargetFacing(player, BL_PC), getTargetFacing(player, BL_PC, 0, 2), getTargetFacing(player, BL_PC, 0, 3)}
	local aether = 15000
	local damage = ((.6 * player.health) + (1.4 * player.magic))
	local threat
	local healthCost = (.5 * player.health)
	local magicCost = (.25 * player.magic)
	local minHealth = 100
	local minMagic = 300
	local counter = false
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health < minHealth or player.health - healthCost <= 0) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(1, 20)
	player:setAether("expunge", aether)
	player:playSound(35)
	player:sendMinitext("You cast Expunge.")
	
	for i = 1, 3 do
		if (mobTargets[i] ~= nil) then
			if (not counter) then
				player.health = player.health - healthCost
				player.magic = player.magic - magicCost
				player:sendStatus()
				counter = true
			end
			
			mobTargets[i]:sendAnimation(281, 1)
			mobTargets[i].attacker = player.ID
			threat = mobTargets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 2)
			player:addThreat(mobTargets[i].ID, threat)
			
			if (#player.group > 1) then
				mobTargets[i]:setGrpDmg(player.ID, threat)
			else
				mobTargets[i]:setIndDmg(player.ID, threat)
			end
			
			mobTargets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		elseif (pcTargets[i] ~= nil) then
			pcTargets[i]:sendAnimation(281, 1)
			
			if (player:canPK(pcTargets[i])) then
				if (not counter) then
					player.health = player.health - healthCost
					player.magic = player.magic - magicCost
					player:sendStatus()
					counter = true
				end
				
				pcTargets[i].attacker = player.ID
				pcTargets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				pcTargets[i]:sendMinitext(player.name.." expunges you.")
			end
		else
			if (player.side == 0) then
				player:sendAnimationXY(281, player.x, player.y - i, 1)
			elseif (player.side == 1) then
				player:sendAnimationXY(281, player.x + i, player.y, 1)
			elseif (player.side == 2) then
				player:sendAnimationXY(281, player.x, player.y + i, 1)
			elseif (player.side == 3) then
				player:sendAnimationXY(281, player.x - i, player.y, 1)
			end
		end
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"A moderate attack striking three foes"}
	return level, items, itemAmounts, description
end
}