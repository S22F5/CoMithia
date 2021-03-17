cloak = {
on_learn = function(player)
	if (player:hasSpell("sneak")) then
		player:removeSpell("sneak")
	end
	
	player.registry["learned_sneak"] = 1
end,

cast = function(player, target)
	local duration = 60000
	
	if (not player:canCast(1, 1, 1) or player.state == 2) then
		return
	end
	
	if (player:hasDuration("hide")) then
		player:sendMinitext("A stronger version is already running.")
		return
	end
	
	if (player:hasDuration("cloak")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:sendAnimation(21, 0)
	player:sendMinitext("You cast Cloak.")
	
	if (player:hasDuration("sneak")) then
		player:setDuration("sneak", 0)
	end
	
	player:setDuration("cloak", duration)
	player.state = 2
	player:updateState()
	player:sendAction(6, 35)
	player:calcStat()
end,

while_cast_250 = function(player)
	if (player.state ~= 2) then
		player:setDuration("cloak", 0)
	end
end,

recast = function(player)
	player.invis = player.invis + 5
end,

uncast = function(player)
	if(player.state == 2) then
		player.state = 0
	end
	
	player:updateState()
	player:calcStat()
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Conceals you from sight"}
	return level, items, itemAmounts, description
end
}