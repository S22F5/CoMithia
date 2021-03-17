enlightened_assistance = {
cast = function(player)
	local aether = 120000
	local magicCost = player.magic
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic == 0) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (#player.group > 1) then
		player:sendAction(6, 20)
		player:setAether("enlightened_assistance", aether)
		player.magic = player.magic - magicCost
		player:sendStatus()
		player:sendMinitext("You cast Enlightened Assistance.")
		player:playSound(65)
	
		for i = 1, #player.group do
			if (player.group[i] ~= player.ID and Player(player.group[i]).state ~= 1 and Player(player.group[i]).m == player.m) then
				Player(player.group[i]):sendAnimation(116, 0)
				
				if (Player(player.group[i]).magic + magicCost > Player(player.group[i]).maxMagic) then
					Player(player.group[i]).magic = Player(player.group[i]).maxMagic
				else
					Player(player.group[i]).magic = Player(player.group[i]).magic + magicCost
				end
				
				Player(player.group[i]):sendStatus()
				Player(player.group[i]):sendMinitext(player.name.." provides enlightened assistance.")
			end
		end
	end
end,

requirements = function(player)
	local level = 28
	local items = {}
	local itemAmounts = {}
	local description = {"You share your magical power with your party"}
	
	return level, items, itemAmounts, description
end
}