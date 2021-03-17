dizzying_smash = {
cast = function(player)
	local pcTarget = getTargetFacing(player, BL_PC)
	local aether = 30000
	local duration = 8000
	local magicCost = 200
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (pcTarget == nil) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	player:sendAction(1, 20)
	player:setAether("dizzying_smash", aether)
	player:sendMinitext("You cast Knockout Blow.")
	player:playSound(13)
	
	if (pcTarget ~= nil) then
		pcTarget:sendAnimation(86, 0)
		
		if (player:canPK(pcTarget)) then
			player.magic = player.magic - magicCost
			player:sendStatus()
			pcTarget:setDuration("dizzying_smash", duration)
			pcTarget:calcStat()
			pcTarget:sendMinitext(player.name.." hits you with a dizzying smash.")
		end
	end
end,

recast = function(player)
	player.drunk = 255
end,

uncast = function(player)
	player:calcStat()
end,

requirements = function(player)
	local level = 31
	local items = {}
	local itemAmounts = {}
	local description = {"Moderate attack that also disorients the target"}
	
	return level, items, itemAmounts, description
end
}