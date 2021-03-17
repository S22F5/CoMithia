metabolism = {
cast = function(player,target)
	local cost = player.mRegenAmount / 3
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end	
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end	
	if(player:hasDuration("metabolism")) then
		player:sendMinitext("You already cast that.")
		return
	end
	
	if(player.magic>=cost) then
		player:sendAction(6,35)
		player:sendMinitext("You increase your metabolism.")
		player:addMana(-cost)
		player:setDuration("metabolism",6000)
		player:setAether("metabolism",12000)
		player:sendAnimation(11)
		player:sendAnimation(12)
		player:calcStat()
		--player:playSound(6)
	else
		player:sendMinitext("You don't have enough Mana.")
	end
end,

uncast=function(player)
	player:calcStat()
end,

recast=function(player)
	player.regen = player.regen + 15 + math.ceil(player.level / 12)
end
}
