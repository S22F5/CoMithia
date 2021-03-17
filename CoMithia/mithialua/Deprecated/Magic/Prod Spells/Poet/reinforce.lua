reinforce = {
on_learn = function(player)
	if (player:hasSpell("brace")) then
		player:removeSpell("brace")
	end
	
	if (player:hasSpell("bolster")) then
		player:removeSpell("bolster")
	end
	
	player.registry["learned_brace"] = 1
	player.registry["learned_bolster"] = 1
end,

cast = function(player, target)
	local duration = 240000
	local magicCost = 50
	
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
	
	if (target:hasDuration("divine_ballad")) then
		player:sendMinitext("A stronger version is already running.")
		return
	end
	
	player:sendAction(6, 20)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Reinforce.")
	player:playSound(92)
	
	if (target:hasDuration("brace")) then
		target:setDuration("brace", 0)
	end
	
	if (target:hasDuration("bolster")) then
		target:setDuration("bolster", 0)
	end
	
	target:setDuration("reinforce", duration, 0, 1)
	target:sendAnimation(110, 0)
	
	if (target.blType == BL_PC) then
		target:sendMinitext(player.name.." reinforces your armor.")
	end
	
	target:calcStat()
end,

recast = function(block)
	block.armor = block.armor * 1.6
end,

uncast = function(block)
	block:calcStat()
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Increases armor by a great amount on a target"}
	return level, items, itemAmounts, description
end
}