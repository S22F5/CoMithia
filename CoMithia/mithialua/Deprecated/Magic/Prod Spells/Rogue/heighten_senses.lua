heighten_senses = {
cast = function(player)
	local aether = 60000
	local duration = 600000
	local healthCost = (player.health * .1)
	local minHealth = 100
	local magicCost = 2500
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health < minHealth) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("heighten_senses")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:setAether("heighten_senses", aether)
	player:playSound(62)
	player:sendAnimation(82, 0)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("heighten_senses", duration)
	player.registry["heighten_senses"] = 1
	player:sendMinitext("You cast Heighten Senses.")
	player:calcStat()
end,

on_hit_while_cast = function(player)
	local magicCost
	
	if (player.registry["heighten_senses_swing"] == 1) then
		player.registry["heighten_senses_swing"] = 0
		
		if (player.registry["heighten_senses"] == 12) then
			magicCost = 10000
		elseif (player.registry["heighten_senses"] == 24) then
			magicCost = 20000
		elseif (player.registry["heighten_senses"] == 36) then
			magicCost = 40000
		elseif (player.registry["heighten_senses"] == 49) then
			magicCost = 80000
		elseif (player.registry["heighten_senses"] == 50) then
			return
		else
			magicCost = 0
		end
			
		if (player.magic < magicCost and magicCost > 0) then
			if (player.registry["heighten_senses_nag"] < os.time()) then
				player.registry["heighten_senses_nag"] = os.time() + 60
				player:sendMinitext("Not enough mana.")
			end
			
			return
		end
		
		if (magicCost > 0) then
			player.magic = player.magic - magicCost
			player:sendStatus()
			player:playSound(62)
			player:sendAnimation(82, 0)
			player:sendMinitext("Your senses reach new heights.")
			player:calcStat()
		end
		
		player.registry["heighten_senses"] = player.registry["heighten_senses"] + 1
	else
		player.registry["heighten_senses_swing"] = 1
	end
end,

recast = function(player)
	if (player.registry["heighten_senses"] < 13) then
		player.rage = player.rage + 2
	elseif (player.registry["heighten_senses"] < 25) then
		player.rage = player.rage + 4
	elseif (player.registry["heighten_senses"] < 37) then
		player.rage = player.rage + 5
	elseif (player.registry["heighten_senses"] < 50) then
		player.rage = player.rage + 7
	elseif (player.registry["heighten_senses"] == 50) then
		player.rage = player.rage + 8
	end
end,

uncast = function(player)
	player.registry["heighten_senses_swing"] = 0
	player.registry["heighten_senses"] = 0
	player.registry["heighten_senses_nag"] = 0
	player:calcStat()
end,

requirements = function(player)
	local level = 50
	local items = {}
	local itemAmounts = {}
	local description = {"A great increase to your swing damage that grows stronger as you attack"}
	return level, items, itemAmounts, description
end
}