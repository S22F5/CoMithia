ancient_legacy = {
cast = function(player)
	local aether = 420000
	local duration = 180000
	local magicCost = (player.maxMagic * .45)
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("ancient_legacy", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:playSound(81)
	player:sendAnimation(341, 0)
	player:sendMinitext("You cast Ancient legacy.")
	
	for i = 1, #player.group do
		if (not Player(player.group[i]):hasDuration("ancient_legacy")) then
			Player(player.group[i]):setDuration("ancient_legacy", duration, player.ID)
			Player(player.group[i]):calcStat()
			Player(player.group[i]):sendMinitext(player.name.." provides you with ancient legacy.")
		end
	end
end,

recast = function(player, caster)
	if (caster ~= nil) then
		local healthGiven = (player.maxHealth * .1)
		local magicGiven = (player.maxMagic * .1)
		
		if (healthGiven > 50000) then
			healthGiven = 50000
		end
		
		if (magicGiven > 50000) then
			magicGiven = 50000
		end
		
		player.maxHealth = player.maxHealth + healthGiven
		player.maxMagic = player.maxMagic + magicGiven
	end
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Strengthens your entire group by providing magic and health"}
	
	return level, items, itemAmounts, description
end
}