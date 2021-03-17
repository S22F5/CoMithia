awaken_soul = {
cast = function(player, target)
	local aether = 60000
	local heal = (target.maxHealth * .3)
	local magicCost = (player.magic * .5)
	local minMagic = 1000
	
	if (not player:canCast(0, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state ~= 1) then
		player:sendMinitext("That cannot save them now.")
		return
	end
	
	if (target.blType ~= BL_PC) then
		player:sendMinitext("You cannot do that.")
		return
	end
	
	if (player.showGhosts == 1) then
		player:sendMinitext("Your ethereal call doesn't reach here.")
		return
	end
	
	player:sendAction(6, 20)
	player:playSound(81)
	target:sendAnimation(291, 0)
	player:setAether("awaken_soul", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Awaken Soul.")
	target.state = 0
	target.attacker = player.ID
	target:addHealthExtend(heal, 0, 0, 0, 0, 0)
	target:updateState()
	target:sendMinitext(player.name.." awakens your soul.")
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Resurrects a target from the dead"}
	return level, items, itemAmounts, description
end
}