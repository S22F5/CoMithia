shout = {
on_learn = function(player)
	if (player:hasSpell("taunt")) then
		player:removeSpell("taunt")
	end
	
	player.registry["learned_taunt"] = 1
end,

cast = function(player)
	local mobBlocks = player:getObjectsInArea(BL_MOB)
	local targets = {}
	local threat = 2750
	local damage = 1
	local distance = 3
	local aether = 5000
	local magicCost = 25
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("shout", aether)
	player:playSound(52)
	player:sendAnimation(362, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Shout.")
	
	if (#mobBlocks > 0) then
		for i = 1, #mobBlocks do
			if (distanceSquare(player, mobBlocks[i], distance)) then
				table.insert(targets, mobBlocks[i])
			end
		end
	end
	
	if (#targets > 0) then
		for i = 1, #targets do
			player:addThreat(targets[i].ID, threat)
			targets[i].attacker = player.ID
			targets[i]:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		end
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Forces nearby enemies to attack you"}
	return level, items, itemAmounts, description
end
}