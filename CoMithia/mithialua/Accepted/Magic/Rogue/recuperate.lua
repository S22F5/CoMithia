recuperate = {
on_learn = function(player)
	if (player:hasSpell("bandage")) then
		player:removeSpell("bandage")
	end
	
	if (player:hasSpell("first_aid")) then
		player:removeSpell("first_aid")
	end
	
	player.registry["learned_bandage"] = 1
	player.registry["learned_first_aid"] = 1
end,

cast = function(player)
	local heal = 1000
	local magicCost = 1000
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:playSound(22)
	player:sendAnimation(65, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player.attacker = player.ID
	player:addHealthExtend(heal, 0, 0, 0, 0, 0)
	player:sendMinitext("You cast Recuperate.")
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Heals great wounds"}
	return level, items, itemAmounts, description
end
}