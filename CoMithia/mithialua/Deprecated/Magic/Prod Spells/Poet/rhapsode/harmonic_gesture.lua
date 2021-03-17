harmonic_gesture = {
cast = function(player)
	local aether = 10000
	local heal = 2000
	local magicCost = 350
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("harmonic_gesture", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Harmonic Gesture.")
	player:playSound(67)
	
	for i = 1, #player.group do
		if (Player(player.group[i]).state ~= 1 and Player(player.group[i]).m == player.m) then
			Player(player.group[i]):sendAnimation(64, 0)
			Player(player.group[i]).attacker = player.ID
			Player(player.group[i]):addHealthExtend(heal, 0, 0, 0, 0, 0)
			Player(player.group[i]):sendMinitext(player.name.." gestures harmonicly for you.")
		end
	end
end,

requirements = function(player)
	level = 25
	items = {}
	itemAmounts = {}
	description = {"Moderate heal for your entire party"}
	
	return level, items, itemAmounts, description
end
}