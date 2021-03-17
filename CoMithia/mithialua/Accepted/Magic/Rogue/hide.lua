hide = {
on_learn = function(player)
	if (player:hasSpell("sneak")) then
		player:removeSpell("sneak")
	end
	
	if (player:hasSpell("cloak")) then
		player:removeSpell("cloak")
	end
	
	player.registry["learned_sneak"] = 1
	player.registry["learned_cloak"] = 1
end,

cast = function(player, target)
	local duration = 60000
	
	if (not player:canCast(1, 1, 1) or player.state == 2) then
		return
	end
	
	if (player:hasDuration("hide")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:sendAnimation(21, 0)
	player:sendMinitext("You cast Hide.")
	
	if (player:hasDuration("sneak")) then
		player:setDuration("sneak", 0)
	end
	
	if (player:hasDuration("cloak")) then
		player:setDuration("cloak", 0)
	end
	
	player:setDuration("hide", duration)
	player.state = 2
	player:updateState()
	player:sendAction(6, 35)
	player:calcStat()
end,

while_cast_250 = function(player)
	if (player.state ~= 2) then
		player:setDuration("hide", 0)
	end
end,

recast = function(player)
	player.invis = player.invis + 6
end,

uncast = function(player)
	if(player.state == 2) then
		player.state = 0
	end
	
	player:updateState()
	player:calcStat()
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Conceals you from sight"}
	return level, items, itemAmounts, description
end
}