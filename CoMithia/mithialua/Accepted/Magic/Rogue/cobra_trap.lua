cobra_trap = {
on_learn = function(player)
	if (player:hasSpell("leech_trap")) then
		player:removeSpell("leech_trap")
	end
	
	if (player:hasSpell("viper_trap")) then
		player:removeSpell("viper_trap")
	end
	
	player.registry["learned_leech_trap"] = 1
	player.registry["learned_viper_trap"] = 1
end,

cast = function(player)
	local aether = 10000
	local magicCost = 250
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("cobra_trap", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:addNPC("cobra_trap", player.m, player.x, player.y, 0, 3600000, player.ID)
	player:sendMinitext("You cast Cobra Trap.")
	addSpotTrap(player, player.m, player.x, player.y)
end,

click = function(block, npc)
	local duration = 5000
	local owner = npc:getBlock(npc.owner)
	
	if (owner == nil or block:hasDuration("cobra_trap")) then
		return
	end
	
	if (block.blType == BL_MOB) then
		block:playSound(33)
		block:sendAnimation(379, 0)
		block:setDuration("cobra_trap", duration, owner.ID)
		removeTrap(npc)
	elseif (block.blType == BL_PC and owner:canPK(block)) then
		block:playSound(33)
		block:sendAnimation(379, 0)
		block:setDuration("cobra_trap", duration, owner.ID)
		block:sendMinitext("You have been pierced with cobra venom.")
		removeTrap(npc)
	end
end,

endAction = function(npc, owner)
	removeTrap(npc)
end,

while_cast = function(block, caster)
	local damage = 1000
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
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Sets a strong poison trap to damage your foes"}
	return level, items, itemAmounts, description
end
}