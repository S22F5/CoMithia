hit_by_a_rock = {
cast=function(mob,target)
	target:setDuration("hit_by_a_rock",2000)
	target.blind = true
	target:lock()
	target:sendMinitext("As the worm dies the tunnels cave in and a rock hits your head.")
	target:warp(11,target.x,target.y)
	local rand = math.random(100)
	if (rand<=75) then
		target:sendAnimation(127)
		target:removeHealth(1)
	elseif (rand >=95) then
		target:sendAnimation(202)
		target:removeHealth(10)
	else
		target:sendAnimation(138)
		target:removeHealth(4)
	end
end,
--[[
while_cast=function(player)
	player.blind = 1 
end,
]]--

uncast=function(player)
	player.blind = false
	player:unlock()
	player:sendMinitext("As you open your eyes, you see a new opening.")
	player:sendAnimationXY(248,8,12,3)
	player:sendAnimationXY(135,8,11,3)
	--possibly change to selfAnimationXY
end
}