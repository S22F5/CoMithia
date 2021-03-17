viper_trap = {
on_learn = function(player)
	if (player:hasSpell("leech_trap")) then
		player:removeSpell("leech_trap")
	end
	
	player.registry["learned_leech_trap"] = 1
end,

cast = function(player)
	local aether = 10000
	local magicCost = 150
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("viper_trap", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:addNPC("viper_trap", player.m, player.x, player.y, 0, 3600000, player.ID)
	player:sendMinitext("You cast Viper Trap.")
	addSpotTrap(player, player.m, player.x, player.y)
end,

click = function(block, npc)
	local duration = 5000
	local owner = npc:getBlock(npc.owner)
	
	if (owner == nil or block:hasDuration("viper_trap")) then
		return
	end
	
	if (block.blType == BL_MOB and not block:hasDuration("viper_trap")) then
		block:playSound(33)
		block:sendAnimation(336, 0)
		block:setDuration("viper_trap", duration, owner.ID)
		removeTrap(npc)
	elseif (block.blType == BL_PC and owner:canPK(block) and not block:hasDuration("viper_trap")) then
		block:playSound(33)
		block:sendAnimation(336, 0)
		block:setDuration("viper_trap", duration, owner.ID)
		block:sendMinitext("You have been pierced with viper venom.")
		removeTrap(npc)
	end
end,

endAction = function(npc, owner)
	removeTrap(npc)
end,

while_cast = function(block, caster)
	local damage = 200
	local threat
	
	block.attacker = caster.ID
	
	if (block.blType == BL_MOB) then
		threat = block:removeHealthExtend(damage, 1, 1, 1, 1, 2)
		caster:addThreat(block.ID, threat)
		
		if (#caster.group > 1) then
			block:setGrpDmg(caster.ID, threat)
		else
			block:setIndDmg(caster.ID, threat)
		end
	end
	
	block:removeHealthExtend(damage, 1, 1, 1, 1, 0)
end,

requirements = function(player)
	local level = 25
	local items = {}
	local itemAmounts = {}
	local description = {"Sets a moderate poison trap to damage your foes"}
	return level, items, itemAmounts, description
end
}