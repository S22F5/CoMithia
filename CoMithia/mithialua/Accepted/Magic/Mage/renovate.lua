renovate = {
on_learn = function(player)
	if (player:hasSpell("alleviate")) then
		player:removeSpell("alleviate")
	end
	
	player.registry["learned_alleviate"] = 1
end,

cast = function(player)
	local heal = 150
	local magicCost = 50
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:playSound(23)
	player:sendAnimation(5, 0)
	player.magic = player.magic - magicCost
	player.attacker = player.ID
	player:addHealthExtend(heal, 0, 0, 0, 0, 0)
	player:sendStatus()
	player:sendAction(6, 40)
end,

requirements = function(player)
	local level = 30
	local items = {}
	local itemAmounts = {}
	local description = {"Heals moderate wounds"}
	
	return level, items, itemAmounts, description
end
}