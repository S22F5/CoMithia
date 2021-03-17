nzap = {
cast = function(player,target)
	if(player.state == 1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.state == 3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	
	local mana_cost = 20
	
	if(player.magic < mana_cost) then
		player:sendMinitext("Not enough mana")
		return
	end

	if (target.state == 1) then
		player:sendMinitext("It's of no use.")
		return
	end

	local amt = 20
	
	if (target.blType == BL_MOB) then
		target:setDuration("nzap", 1000)
		target.paralyzed = true
	elseif (target.blType == BL_PC) then
		if (target.pvp == 0) then
			player:sendMinitext("Something went wrong.")
			player:setAether("nzap", 1000)
			return
		end
	end

	player:addMana(-mana_cost)
	player:setAether("nzap", 2000)

	target.attacker = player.ID
	target:removeHealthExtend(amt, 1, 1, 1, 1, 0)
	target:sendAnimation(27)--23 or 27
	player:sendAction(6, 40)

end,

uncast = function(block)
	block.paralyzed = false
end
}