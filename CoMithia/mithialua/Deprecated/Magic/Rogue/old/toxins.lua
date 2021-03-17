toxins = {
cast = function(player,target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end

	player:setDuration("toxins",15000)
	player:calcStat()
end,

recast = function(player)
	local bHealth = player.baseHealth
	local mHealth = player.maxHealth
	local health = player.health
	local hperc = health/mHealth
	local level = player.level
	local amt1 = (bHealth * 0.07)
	player.maxHealth = mHealth - amt1
	local amt2 = player.maxHealth * hperc
	player.health = amt2
	local vregen = player.vRegen
	player.vRegen = vregen - math.ceil(level / 5)
end,

while_cast = function(player)
	local vRegen = player.vRegenAmount
	player:removeHealth(math.ceil(vRegen/30))
	player:removeHealth(math.ceil(vRegen/30))
end,

uncast = function(player)
	player:calcStat()
end
}