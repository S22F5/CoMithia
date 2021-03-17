aetherial_displacement = {
cast = function(player)
	local aether = 180000
	local magicCost = (player.magic * .33)
	local minMagic = 2000
	local aethers = {}
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	for i = 1, #player.group do
		aethers = Player(player.group[i]):getAllAethers()
		
		if (#aethers > 0) then
			for x = 1, #aethers, 2 do
				Player(player.group[i]):setAether(aethers[x + 1], (aethers[x] * .33))
				Player(player.group[i]):sendMinitext(player.name.." displaces your aethers.")
			end
		end
	end
	
	player:sendAction(6, 20)
	player:setAether("aetherial_displacement", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:playSound(77)
	player:sendAnimation(81, 0)
	player:sendMinitext("You cast Aetherial Displacement.")
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"You lower the weight of aethers on the minds of your party"}
	
	return level, items, itemAmounts, description
end
}