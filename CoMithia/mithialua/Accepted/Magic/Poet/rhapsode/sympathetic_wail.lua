sympathetic_wail = {
cast = function(player)
	local aether = 300000
	local healthCost = (player.health * .9)
	local magicCost = (player.magic * .9)
	local minMagic = 2000
	
	if (not player:canCast(0, 1, 0)) then
		return
	end
	
	if (player.health - healthCost <= 0) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("sympathetic_wail", aether)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Sympathetic Wail.")
	player:playSound(81)
	
	for i = 1, #player.group do
		if (Player(player.group[i]).state == 1 and Player(player.group[i]).m == player.m) then
			local heal = (Player(player.group[i]).maxHealth * .5)
			
			Player(player.group[i]):sendAnimation(80, 0)
			Player(player.group[i]).state = 0
			Player(player.group[i]).attacker = player.ID
			Player(player.group[i]):addHealthExtend(heal, 0, 0, 0, 0, 0)
			Player(player.group[i]):updateState()
			Player(player.group[i]):sendMinitext(player.name.." wails sympathetically for you.")
		end
	end
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"You bring your party back from the dead"}
	
	return level, items, itemAmounts, description
end
}