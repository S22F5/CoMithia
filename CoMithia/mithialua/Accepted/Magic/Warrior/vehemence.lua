vehemence = {
on_learn = function(player)
	if (player:hasSpell("warriors_rage")) then
		player:removeSpell("warriors_rage")
	end
	
	if (player:hasSpell("fighters_rage")) then
		player:removeSpell("fighters_rage")
	end
	
	if (player:hasSpell("champions_rage")) then
		player:removeSpell("champions_rage")
	end
	
	player.registry["learned_warriors_rage"] = 1
	player.registry["learned_fighters_rage"] = 1
	player.registry["learned_champions_rage"] = 1
end,

cast = function(player)
	local aether = 60000
	local duration = 600000
	local healthCost = (player.health * .5)
	local minHealth = 5000
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
	
	if (player:hasDuration("vehemence")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:setAether("vehemence", aether)
	player:playSound(74)
	player:sendAnimation(83, 0)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("vehemence", duration)
	player.registry["vehemence"] = 1
	player:sendMinitext("You cast Vehemence.")
	player:calcStat()
end,

on_hit_while_cast = function(player)
	local healthCost = (player.health * .5)
	local minHealth = 5000
	local magicCost
	
	if (player.registry["vehemence_swing"] == 1) then
		player.registry["vehemence_swing"] = 0
		
		if (player.registry["vehemence"] == 9) then
			magicCost = 10000
		elseif (player.registry["vehemence"] == 19) then
			magicCost = 20000
		elseif (player.registry["vehemence"] == 29) then
			magicCost = 30000
		elseif (player.registry["vehemence"] == 39) then
			magicCost = 40000
		elseif (player.registry["vehemence"] == 49) then
			magicCost = 50000
		elseif (player.registry["vehemence"] == 50) then
			return
		else
			healthCost = 0
			magicCost = 0
		end
		
		if (player.health < minHealth and healthCost > 0) then
			if (player.registry["vehemence_nag"] < os.time()) then
				player.registry["vehemence_nag"] = os.time() + 60
				player:sendMinitext("Not enough vita.")
			end
			
			return
		end
			
		if (player.magic < magicCost and magicCost > 0) then
			if (player.registry["vehemence_nag"] < os.time()) then
				player.registry["vehemence_nag"] = os.time() + 60
				player:sendMinitext("Not enough mana.")
			end
			
			return
		end
		
		if (healthCost > 0 and magicCost > 0) then
			player.health = player.health - healthCost
			player.magic = player.magic - magicCost
			player:sendStatus()
			player:playSound(74)
			player:sendAnimation(83, 0)
			player:sendMinitext("You are more vehement.")
			player:calcStat()
		end
		
		player.registry["vehemence"] = player.registry["vehemence"] + 1
	else
		player.registry["vehemence_swing"] = 1
	end
end,

recast = function(player)
	if (player.registry["vehemence"] < 10) then
		player.rage = player.rage + 5
	elseif (player.registry["vehemence"] < 20) then
		player.rage = player.rage + 10
	elseif (player.registry["vehemence"] < 30) then
		player.rage = player.rage + 20
	elseif (player.registry["vehemence"] < 40) then
		player.rage = player.rage + 30
	elseif (player.registry["vehemence"] < 50) then
		player.rage = player.rage + 40
	elseif (player.registry["vehemence"] == 50) then
		player.rage = player.rage + 50
	end
end,

uncast = function(player)
	player.registry["vehemence_swing"] = 0
	player.registry["vehemence"] = 0
	player.registry["vehemence_nag"] = 0
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