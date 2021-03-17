increasing = {
cast=function(player,target)

	if(target:hasDuration("increasing")) then
		return
	end

	target:setDuration("increasing",20000)
	target:calcStat()
	--target:sendStatus()
end,

uncast=function(player)
	player:calcStat()
	player:sendStatus()
end,

while_cast=function(player)
	player.ac = player.ac - (20 - math.floor(player:getDuration("increasing")/1000))
	player:calcStat()
end,

recast = function(player)
	player.ac = player.ac - (20 - math.floor(player:getDuration("increasing")/1000))
	player:sendStatus()
end
}