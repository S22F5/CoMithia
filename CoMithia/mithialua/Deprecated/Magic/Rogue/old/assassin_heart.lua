assassin_heart = {
--[[
VITA ATTACK BY %

Geistesblitz Geistesblitz says (08:48 a.m.)
I got an idea of how to do another vita attack % based without it getting out of hand
Geistesblitz Geistesblitz says (08:49 a.m.)
with a buffer
and a nerfing buffer
Geistesblitz Geistesblitz says (08:51 a.m.)
hi
Jacob Evans says (08:51 a.m.)
hi
Geistesblitz Geistesblitz says (08:52 a.m.)
basically say a vita attack that goes by % say missing health % of target
leaves a buffer on the target with a buffer rank
so if the target is surrounded by 4 people with that attack
they can't just all do it at once to 1 hit the target
Geistesblitz Geistesblitz says (08:53 a.m.)
and then since stats can have big ranges
it goes like
if total damage > player.maxHealth * x then cap damage
so damage has a min and max
and it prevents from new 50ers ganking the top player and killing it
]]--
cast = function(player)
	local mobTarget = getTargetFacing(player, BL_MOB)
	local pcTarget = getTargetFacing(player, BL_PC)
	local healthCost = player.health / 3
	local magicCost = 100 + (player.magic / 100)
	local aether = 24000
	local damage = (magicCost * 1.5) + (healthCost / 2)
	local missingHealth = 0

	if (player.state ~= 0) then
		player:sendMinitext("You cannot cast that now.")
	end
	
	if (player.health < healthCost) then
		player:sendMinitext("You need more vita to cast that.")
	end
	
	if (player.magic < magicCost) then
		player:sendMinitext("You need more mana to cast that.")
	end

	if (mobTarget == nil and pcTarget == nil) then
		player:setAether("assassin_heart", (aether / 4))
		player.magic = player.magic - (magicCost / 4)
	else
		player:setAether("assassin_heart", aether)

		if (mobTarget ~= nil) then
			missingHealth = ((mobTarget.maxHealth - mobTarget.health) / mobTarget.maxHealth)
			damage = (damage + (damage * missingHealth))
			mobTarget.attacker = player.ID
			mobTarget:removeHealthExtend(damage, 1, 1, 1, 1, 0)
			player.health = player.health - healthCost
			player.magic = player.magic - magicCost
			mobTarget:sendAnimation(7)
			player:sendAction(1, 40)
			player:playSound(35)
		elseif (pcTarget ~= nil) then
			if (pcTarget.pvp > 0) then
				missingHealth = ((pcTarget.maxHealth - pcTarget.health) / pcTarget.maxHealth)
				damage = (damage + (damage * missingHealth))
				pcTarget.attacker = player.ID
				pcTarget:removeHealthExtend(damage, 1, 1, 1, 1, 0)
				player.health = player.health - healthCost
				player.magic = player.magic - magicCost
				pcTarget:sendAnimation(7)
				player:sendAction(1, 40)
				player:playSound(35)
			else
				pcTarget:sendAnimation(7)
				player:sendAction(1, 40)
				player:playSound(35)
				player.magic = player.magic - (magicCost / 4)
				player:setAether("assassin_heart", (aether / 2))				
			end
		end
	end
	
	player:sendStatus()
end,
}