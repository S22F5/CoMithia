rewind = {
cast = function(player, target)
	local magicCost = 30
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That cannot save them now.")
		return
	end
	
	if (not target:hasDuration("stop_time")) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	player:sendAction(6, 20)
	player:playSound(21)
	target:sendAnimation(132, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Rewind.")
	
	if (target:hasDuration("stop_time")) then
		target:setDuration("stop_time", 0)
	end
end,

requirements = function(player)
	local level = 20
	local items = {}
	local itemAmounts = {}
	local description = {"Frees a target's movements"}
	return level, items, itemAmounts, description
end
}