stable_horse = {
on_healed = function(mob, healer)
	mob_ai_basic.on_healed(mob, healer)
end,

on_attacked = function(mob,attacker)
	mob_ai_basic.on_attacked(mob, attacker)
end,
	
move = function(mob,target)
	local found
	local moved=true
	local oldside = mob.side
	local checkmove = math.random(0,10)

	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	if (math.abs(mob.x - mob.startX) >= 15 or math.abs(mob.y - mob.startY) >= 15) then
		mob:warp(mob.startM, mob.startX, mob.startY)
	end
	
	if ((mob.x == 19) and (mob.y == 51)) or ((mob.x == 127) and (mob.y == 51)) then--West Stable
		mob.side = 0
		mob:move()
		return
	end

	if(checkmove >= 4) then
		mob.side=math.random(0,3)
		mob:sendSide()
		if(mob.side == oldside) then
			mob:move()
		end
	else
		mob:move()
	end
end,

attack=function(mob,target)
	if (mob.paralyzed or mob.sleep ~= 1) then
		return
	end
	
	local amt = mob.maxHealth / math.random(40, 75)

	if (mob.health < mob.maxHealth) then
		if (mob.health + amt >= mob.maxHealth) then
			mob.health = mob.maxHealth
		else
			mob.health = mob.health + amt
		end
	end

end,

on_mount = function(player, mob)
	if (mob.lookColor == 3) then
		player.disguise = 26
	elseif (mob.lookColor == 4) then
		player.disguise = 27
	elseif (mob.lookColor == 9) then
		player.disguise = 32
	end
	
	mob.health = 0
	mob.state = 1
	player.registry["mount_type"] = 1
	player.state = 3
	player:calcStat()
end
}
