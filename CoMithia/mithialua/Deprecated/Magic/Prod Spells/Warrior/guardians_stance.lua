guardians_stance = {
on_learn = function(player)
	if (player:hasSpell("defenders_stance")) then
		player:removeSpell("defenders_stance")
	end
	
	if (player:hasSpell("protectors_stance")) then
		player:removeSpell("protectors_stance")
	end
	
	player.registry["learned_defenders_stance"] = 1
	player.registry["learned_protectors_stance"] = 1
end,

cast = function(player)
	local aether = 40000
	local duration = 20000
	local magicCost = 150
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("guardians_stance")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (player:hasDuration("defenders_stance")) then
		player:setDuration("defenders_stance", 0)
	end
	
	if (player:hasDuration("protectors_stance")) then
		player:setDuration("protectors_stance", 0)
	end
	
	player:sendAction(6, 20)
	player:setDuration("guardians_stance", duration)
	player:setAether("guardians_stance", aether)
	player:playSound(21)
	player:sendAnimation(218, 0)
	player:playSound(29)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:calcStat()
	player:sendMinitext("You cast Guardian's Stance.")
end,

recast = function(player)
	player.armor = player.armor * 1.6
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Brace your resolve strengthening your armor by a great amount"}
	return level, items, itemAmounts, description
end
}