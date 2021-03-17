renew = {
cast = function(player)
	local aether = 120000
	local duration = 10000
	local magicCost = player.maxMagic * .05
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("relinquish") or player:hasDuration("regenerate")) then
		player:sendMinitext("A stronger spell is already running.")
		return
	end
	
	if (player:hasDuration("renew")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("renew", aether)
	player:setDuration("renew", duration)
	player:playSound(98)
	player:sendAnimation(108, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Renew.")
end,

while_cast = function(player)
	local heal = player.maxHealth * .01
	
	player.attacker = player.ID
	player:addHealthExtend(heal, 0, 0, 0, 0, 0)
end,

requirements = function(player)
	local level = 10
	local items = {}
	local itemAmounts = {}
	local description = {"Channels a restoring energy for a small amount"}
	return level, items, itemAmounts, description
end
}