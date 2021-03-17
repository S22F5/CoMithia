shove = {
cast = function(player)
	local mobTarget = getTargetFacing(player, BL_MOB)
	local pcTarget = getTargetFacing(player, BL_PC)
	local aether = 5000
	local magicCost = 35
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(1, 20)
	player:setAether("shove", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast shove.")
	player:playSound(2)
	
	if (mobTarget ~= nil and (mobTarget.mobID < 1000000 or mobTarget.mobID > 2000007)) then
		canPush(player, mobTarget)
		mobTarget:sendAnimation(190, 0)
	elseif (pcTarget ~= nil and pcTarget.gmLevel == 0) then
		canPush(player, pcTarget)
		pcTarget:sendAnimation(190, 0)
		pcTarget:sendMinitext(player.name.." shoves you out of their way.")
	end
end,

requirements = function(player)
	local level = 28
	local items = {}
	local itemAmounts = {}
	local description = {"Pushes a target in front of you out of the way"}
	
	return level, items, itemAmounts, description
end
}