magnetism = {
cast = function(player, target)
	local mobBlocks = player:getObjectsInSameMap(BL_MOB)
	local aether = 60000
	local threat = 100000
	local magicCost = (player.magic * .1)
	local minMagic = 2000
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (target.state == 1 or target.blType == BL_MOB) then
		player:sendMinitext("That is no longer useful.")
		return
	end
	
	if (#player.group > 1) then
		for i = 1, #player.group do
			if (i == #player.group and player.group[i] ~= target.ID) then
				player:sendMinitext("That person is not in your party.")
				return
			elseif (player.group[i] == target.ID) then
				break
			end
		end
	elseif (#player.group <= 1 and target.ID ~= player.ID) then
		player:sendMinitext("That person is not in your party.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("magnetism", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Magnetism.")
	player:playSound(75)
	target:sendAnimation(357, 0)
	target:addThreatGeneral(threat)
	target:sendMinitext(player.name.." increases your magnetism.")
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Directs all hostile foes onto your target"}
	
	return level, items, itemAmounts, description
end
}