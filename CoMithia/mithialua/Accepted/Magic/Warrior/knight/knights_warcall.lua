knights_warcall = {
cast = function(player, target)
	local aether = 45000
	local threat = player.maxHealth
	local healthCost = (player.health * .05)
	local magicCost = (player.magic * .025)
	local minHealth = 250
	local minMagic = 250
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.health < minHealth or player.health - healthCost <= 0) then
		player:sendMinitext("Not enough vita.")
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.blType ~= BL_MOB or target.state == 1) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("knights_warcall", aether)
	player.health = player.health - healthCost
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:addThreat(target.ID, threat)
	player:playSound(60)
	player:sendAnimation(93, 0)
	player:sendMinitext("You cast Knight's Warcall.")
end,

requirements = function(player)
	local level = 31
	local items = {}
	local itemAmounts = {}
	local description = {"Focuses enemies to attacking you"}
	
	return level, items, itemAmounts, description
end
}