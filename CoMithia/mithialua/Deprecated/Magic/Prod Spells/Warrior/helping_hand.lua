helping_hand = {
cast = function(player, target)
	local heal = 250
	local magicCost = 250
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1) then
		player:sendMinitext("That cannot save them now.")
		return
	end
	
	player:sendAction(6, 20)
	player:playSound(22)
	target:sendAnimation(65, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Helping Hand.")
	target.attacker = player.ID
	target:addHealthExtend(heal, 0, 0, 0, 0, 0)
	
	if (target.blType == BL_PC) then
		target:sendMinitext(player.name.." lends you a hand.")
	end
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Heals minor wounds on an ally"}
	return level, items, itemAmounts, description
end
}