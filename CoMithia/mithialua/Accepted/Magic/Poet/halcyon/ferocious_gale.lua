ferocious_gale = {
cast = function(player)
	local aether = 180000
	local duration = 10000
	local magicCost = (player.magic * .25)
	local minMagic = 2000
	
	if (not player:canCast(1, 1, 0)) then
		return
	end
	
	if (player.magic < minMagic) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:hasDuration("ferocious_gale")) then
		player:sendMintiext("That spell is already cast.")
		return
	end
	
	player:sendAction(6, 20)
	player:setAether("ferocious_gale", aether)
	player:setDuration("ferocious_gale", duration)
	player:playSound(85)
	player:sendAnimation(115, 0)
	player.magic = player.magic - magicCost
	player:sendStatus()
	player:sendMinitext("You cast Ferocious Gale.")
end,

requirements = function(player)
	local level = 40
	local items = {}
	local itemAmounts = {}
	local description = {"Your healing spells become attacks"}
	
	return level, items, itemAmounts, description
end
}