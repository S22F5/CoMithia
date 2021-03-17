regenerate = {
on_learn = function(player)
	if (player:hasSpell("renew")) then
		player:removeSpell("renew")
	end
	
	if (player:hasSpell("relinquish")) then
		player:removeSpell("relinquish")
	end
	
	player.registry["learned_renew"] = 1
	player.registry["learned_relinquish"] = 1
end,

cast = function(player)
	local aether = 120000
	local duration = 10000
	local magicCost = player.maxMagic * .15
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("regenerate")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	if (player:hasDuration("renew")) then
		player:setDuration("renew", 0)
	end
	
	if (player:hasDuration("relinquish")) then
		player:setDuration("relinquish", 0)
	end
	
	player:sendAction(6, 20)
	player:setAether("regenerate", aether)
	player:setDuration("regenerate", duration)
	player:playSound(98)
	player:sendAnimation(108, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Regenerate.")
end,

while_cast = function(player)
	local heal = player.maxHealth * .03
	
	player.attacker = player.ID
	player:addHealthExtend(heal, 0, 0, 0, 0, 0)
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Channels a restoring energy for a great amount"}
	return level, items, itemAmounts, description
end
}