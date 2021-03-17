decoy = {
cast = function(player)
	local aether = 180000
	local duration = 8000
	local magicCost = 250
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("decoy")) then
		player:sendMinitext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("decoy", aether)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:setDuration("decoy", duration)
	player:sendMinitext("You cast Decoy.")
end,

before_death_while_cast = function(player)
	local duration = 60000
	local heal = (player.maxHealth * .1)
	
	player:playSound(80)
	player:setDuration("decoy", 0)
	player.attacker = player.ID
	player:addHealthExtend(heal, 0, 0, 0, 0, 1)
	player:spawn(101, player.x, player.y, 1)
	
	if (player:hasSpell("cloak")) then
		player:setDuration("cloak", duration)
		player.state = 2
		player:updateState()
		player:calcStat()
	elseif (player:hasSpell("hide")) then
		player:setDuration("hide", duration)
		player.state = 2
		player:updateState()
		player:calcStat()
	end
end,

on_spawn = function(mob)
	mob:sendAnimation(16, 0)
	mob.health = 0
	mob.attacker = mob.ID
	mob:removeHealthExtend(0, 0, 0, 0, 0, 0)
end,

requirements = function(player)
	local level = 37
	local items = {}
	local itemAmounts = {}
	local description = {"Creates an illusion if that illusion dies you survive"}
	
	return level, items, itemAmounts, description
end
}