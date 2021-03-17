stop = {
cast=function(player,target)
	if(target:hasDuration("stop")) then
		--player:sendMinitext("Stop is already in effect.")
		return     
	end
	if(target.paralyzed==true) then
		--player:sendMinitext("The target is already paralyzed.")
		return
	end
	target.paralyzed=true
	target:setDuration("stop",2000)
end,

uncast=function(player)
	player.paralyzed=false
end,


while_cast=function(player)
	player.paralyzed=true
end,


recast=function(player)
	player.paralyzed=true
end
}