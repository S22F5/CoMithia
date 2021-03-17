bandage = {
cast = function(player)
	local heal = 25
	local magicCost = 25
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:playSound(22)
	player:sendAnimation(5, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player.attacker = player.ID
	player:addHealthExtend(heal, 0, 0, 0, 0, 0)
	player:sendMinitext("You cast Bandage.")
end,

requirements = function(player)
	local level = 10
	local items = {}
	local itemAmounts = {}
	local description = {"Heals moderate wounds" }
	return level, items, itemAmounts, description
end
}