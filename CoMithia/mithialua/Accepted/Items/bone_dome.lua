bone_dome = { 
equip = function(player)
	--player:sendMinitext("It feels...")
	--player:sendMinitext("You feel protected.")
end,

unequip = function(player)
end,

on_break = function(player)
	if (player.state ~= 1) then
		player:sendAction(12, 80)
	end
end,

on_takedamage = function(player, attacker)
	if (attacker == nil) then
		return
	end
	
	local chance = math.random(100000)
	if (chance <= 5000) then--5% chance
		local amount = 1000 + math.random(15) + (player.might / 10)
		if (player.health + amount >= player.maxHealth) then
			return
		end
		player:addHealth(amount)
		player:sendMinitext("Your bone dome regens you "..amount.." vitality.")	
	--[[if (chance <= 5000) then--5% chance
			bone_shock.cast(player, attacker)
		end]]--
	end
end
}

bone_shock = {
cast = function(player, target)
	if (target == nil) then
		return
	end
	
	if (distance(player, target) ~= 1) then
		return
	end
	
	if (target:hasDuration("bone_shock") == true) then
		return
	end
	
	if (target.blType == BL_PC) then
		target:sendMinitext("You recoil on the bone dome.")
	end
	target:setDuration("bone_shock", 2000)
	player:sendMinitext(""..target.name.." recoiled on the bone dome.")
	target:calcStat()
end,

recast = function(block)
	block.paralyzed = true
end,

uncast = function(block)
	block.paralyzed = false
end
}