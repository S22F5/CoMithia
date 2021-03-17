champions_stance = {
on_learn = function(player)
	if (player:hasSpell("warriors_stance")) then
		player:removeSpell("warriors_stance")
	end
	
	if (player:hasSpell("fighters_stance")) then
		player:removeSpell("fighters_stance")
	end
	
	player.registry["learned_warriors_stance"] = 1
	player.registry["learned_fighters_stance"] = 1
end,

cast = function(player)
	local aether = 30000
	local duration = 600000
	local magicCost = 150
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("champions_stance")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (player:hasDuration("warriors_stance")) then
		player:setDuration("warriors_stance", 0)
	end
	
	if (player:hasDuration("fighters_stance")) then
		player:setDuration("fighters_stance", 0)
	end
	
	player:sendAction(6, 20)
	player:setDuration("champions_stance", duration)
	player:setAether("champions_stance", aether)
	player:playSound(48)
	player:sendAnimation(205, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:calcStat()
	player:sendMinitext("You cast Champion's Stance.")
end,

recast = function(player)
	player.enchant = player.enchant + 4
	player.dam = player.dam + 9
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Increases your fighting ability by a great amount"}
	return level, items, itemAmounts, description
end
}