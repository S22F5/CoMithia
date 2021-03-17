warriorfurytest = {
cast = function(player)
	local manaCost = 8 * player.level
	
	if (player.magic < manaCost) then
		player:sendMinitext("You do not have enough mana.")
		return
	end
	
	if (player.state == 1) then
		player:sendMinitext("You cannot cast that while dead.")
		return
	end
	
	if	(player.state == 3) then
		player:sendMinitext("You cannot cast that while mounted.")
		return
	end
	
	if (player:hasDuration("warriorfurytest")) then
		player:sendMinitext("That spell is already running.")
		return
	end
	
	player:setDuration("warriorfurytest", 36000)
	player:addMagic(-manaCost)
	player.fury = player.fury + 1
	player:setAether("warriorfurytest", 42000)
end,

recast = function(player)
	player.fury = player.fury + 1
end,

uncast = function(player)
	player.fury = player.fury - 1
end,

--[[on_hit_while_cast = function(player, target)
	local stopChance = math.random(100)
	
	if (player.critChance == 2 and target.health <= target.health / 2 and stopChance > 90) then
		target:setDuration("stop", 2000)
	end
end,]]--
}