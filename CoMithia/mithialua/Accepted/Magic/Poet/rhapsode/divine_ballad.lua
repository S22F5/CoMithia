divine_ballad = {
cast = function(player)
	local aether = 180000
	local duration = 240000
	local healthCost = (player.maxHealth * .2)
	local magicCost = (player.maxMagic * .2)
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health < healthCost or player.health - healthCost <= 0) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("divine_ballad", aether)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Divine Ballad.")
	player:playSound(62)
	
	for i = 1, #player.group do
		if (Player(player.group[i]).state ~= 1 and Player(player.group[i]).m == player.m) then
			if (Player(player.group[i]):hasDuration("guard")) then
				Player(player.group[i]):setDuration("guard", 0)
			end
			
			if (Player(player.group[i]):hasDuration("brace")) then
				Player(player.group[i]):setDuration("brace", 0)
			end
			
			if (Player(player.group[i]):hasDuration("protect")) then
				Player(player.group[i]):setDuration("protect", 0)
			end
			
			if (Player(player.group[i]):hasDuration("bolster")) then
				Player(player.group[i]):setDuration("bolster", 0)
			end
			
			if (Player(player.group[i]):hasDuration("barrier")) then
				Player(player.group[i]):setDuration("barrier", 0)
			end
			
			if (Player(player.group[i]):hasDuration("reinforce")) then
				Player(player.group[i]):setDuration("reinforce", 0)
			end
			
			Player(player.group[i]):sendAnimation(98, 0)
			Player(player.group[i]):setDuration("divine_ballad", duration, 0, 1)
			Player(player.group[i]):calcStat()
			Player(player.group[i]):sendMinitext(player.name.." performs a divine ballad.")
		end
	end
end,

recast = function(player)
	player.armor = player.armor * 1.65
	player.deduction = player.deduction - .5
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 31
	local items = {}
	local itemAmounts = {}
	local description = {"Protects your group and raises their armor"}
	
	return level, items, itemAmounts, description
end
}