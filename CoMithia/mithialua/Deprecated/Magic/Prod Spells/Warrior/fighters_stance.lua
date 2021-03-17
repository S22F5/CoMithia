fighters_stance = {
on_learn = function(player)
	if (player:hasSpell("warriors_stance")) then
		player:removeSpell("warriors_stance")
	end
	
	player.registry["learned_warriors_stance"] = 1
end,

cast = function(player)
	local aether = 30000
	local duration = 600000
	local magicCost = 100
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("champions_stance")) then
		player:sendMinitxt("A stronger spell is already cast.")
		return
	end
	
	if (player:hasDuration("fighters_stance")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (player:hasDuration("warriors_stance")) then
		player:setDuration("warriors_stance", 0)
	end
	
	player:sendAction(6, 20)
	player:setDuration("fighters_stance", duration)
	player:setAether("fighters_stance", aether)
	player:playSound(35)
	player:sendAnimation(207, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:calcStat()
	player:sendMinitext("You cast Fighter's Stance.")
end,

recast = function(player)
	player.enchant = player.enchant + 3
	player.dam = player.dam + 6
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Increases your fighting ability by a moderate amount"}
	return level, items, itemAmounts, description
end
}