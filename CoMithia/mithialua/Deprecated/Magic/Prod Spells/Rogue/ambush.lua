ambush = {
cast = function(player)
	local mobTarget = getTargetFacing(player, BL_MOB)
	local pcTarget = getTargetFacing(player, BL_PC)
	local npcTarget = getTargetFacing(player, BL_NPC)
	local weapon = player:getEquippedItem(EQ_WEAP)
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (weapon ~= nil and weapon.yname == "fishing_pole") then
		player:sendMinitext("You would get entangled with the line.")
		return
	end
	
	if (mobTarget ~= nil and canAmbush(player, mobTarget)) then
		player:sendMinitext("You cast Ambush.")
		
		if (player.ambushTimer < ((os.time() * 1000) + timeMS())) then
			player.ambushTimer = (((os.time() * 1000) + timeMS()) + ((player.attackSpeed * 1000) / 50))
			player:swing()
		end
	elseif (pcTarget ~= nil and canAmbush(player, pcTarget)) then
		player:sendMinitext("You cast Ambush.")
		
		if (player.ambushTimer < ((os.time() * 1000) + timeMS())) then
			player.ambushTimer = (((os.time() * 1000) + timeMS()) + ((player.attackSpeed * 1000) / 50))
			player:swing()
		end
	elseif (npcTarget ~= nil and canAmbush(player, npcTarget)) then
		player:sendMinitext("You cast Ambush.")
		
		if (player.ambushTimer < ((os.time() * 1000) + timeMS())) then
			player.ambushTimer = (((os.time() * 1000) + timeMS()) + ((player.attackSpeed * 1000) / 50))
			player:swing()
		end
	end
end,

requirements = function(player)
	local level = 15
	local items = {}
	local itemAmounts = {}
	local description = {"Leap over your foe dealing damage"}
	return level, items, itemAmounts, description
end
}