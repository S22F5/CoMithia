first_aid = {
on_learn = function(player)
	if (player:hasSpell("bandage")) then
		player:removeSpell("bandage")
	end
	
	player.registry["learned_bandage"] = 1
end,

cast = function(player)
	local heal = 250
	local magicCost = 250
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:playSound(22)
	player:sendAnimation(66, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player.attacker = player.ID
	player:addHealthExtend(heal, 0, 0, 0, 0, 0)
	player:sendMinitext("You cast First Aid.")
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Heals average wounds"}
	return level, items, itemAmounts, description
end
}