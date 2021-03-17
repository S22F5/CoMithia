remedy = {
on_learn = function(player)
	if (player:hasSpell("comfort")) then
		player:removeSpell("comfort")
	end
	
	player.registry["learned_comfort"] = 1
end,

cast = function(player, target)
	local heal = 450
	local magicCost = 100
	
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
	player:sendMinitext("You cast Remedy.")
	target.attacker = player.ID
	target:addHealthExtend(heal, 0, 0, 0, 0, 0)
	
	if (target.blType == BL_PC) then
		target:sendMinitext(player.name.." remedies you.")
	end
end,

requirements = function(player)
	local level = 20
	local items = {}
	local itemAmounts = {}
	local description = {"Medium healing spell that allows you to heal others"}
	return level, items, itemAmounts, description
end
}