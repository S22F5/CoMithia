power_nap = {
cast = function(mob,target)
	--ADD A VIP Option for Tavern VIP's.
	if (target.state == 1) then
		target:sendMinitext("Power nap can't help you.")
		return
	end	
	
	local m = target.m
	local x = {}
	local y = {}
	local i
	target:setDuration("power_nap",13000)
	target.blind = true
	target:lock()
	target:sendMinitext(" ")
	target:sendMinitext("You are fast asleep.")

	if (m == 2) then
		x = {3,4,12,13}
		y = {8,8,8,8}
	elseif (m == 16) then
		x = {13, 14, 16, 17, 13, 14, 16, 17, 13, 14, 16, 17}
		y = {6, 6, 6, 6, 10, 10, 10, 10, 14, 14, 14, 14}
	elseif (m == 21) then
		x = {4, 5, 4, 5}
		y = {7, 7, 10, 10}
	elseif (m == 136) then
		x = {3, 3, 4, 4}
		y = {6, 9, 6, 9}
	else
		broadcast(-1,""..target.name.." is abusing a bug: "..m.." "..target.x.." "..target.y..".")
		target:flushDurationRange(7003, 7003)
		return
	end
	if (#x > 0) then
		i = math.random(#x)
		target:warp(target.m,x[i],y[i])
	end
	target.side = 2
	target:sendSide()
end,

while_cast = function(player)
	local h = player.maxHealth * 0.08
	local m = player.maxMagic * 0.08
	player:sendMinitext(" ")
	player:addHealth2(h)
	player:addMagic(m)
	--player.blind = true
	if ((player:getDuration("power_nap")/1000) % 2 == 0) then
		player:sendAction(16,80)
	end
end,

recast = function(player)
	target.blind = true
	target:lock()
end,

uncast = function(player)
	player.blind = false
	player:unlock()
	player:sendMinitext("As you open your eyes, you realize it's "..curTime()..":00; now that's a power nap!")
end
}