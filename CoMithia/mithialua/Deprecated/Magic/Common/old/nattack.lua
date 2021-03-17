nattack = {
cast = function(player)
	if(player.state == 1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.state == 3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	
	local mana_cost = 12
	local vita_cost = 15
	
	if(player.magic < mana_cost) then
		player:sendMinitext("Not enough mana")
		return
	end

	if(player.health < vita_cost) then
		player:sendMinitext("Not enough health")
		return
	end
		
	local target = getTargetFacing(player, BL_MOB)
	local target2
	local x = player.x
	local y = player.y
	local m = player.m
	
	if (target ~= nil) then
		if (player.side == 0) then
			y = y - 2
		elseif (player.side == 1) then
			x = x + 2
		elseif (player.side == 2) then
			y = y + 2
		elseif (player.side == 3) then
			x = x - 2
		end
		target2 = getTargetXY(m, x, y, BL_MOB)
	else
		player:setAether("nattack", 1000)
		player:sendMinitext("Something went wrong.")
		return
	end

	if (target.state == 1) then
		player:sendMinitext("It's of no use.")
		return
	end

	local amt = 20
	
	player:addMana(-mana_cost)
	player:removeHealthWithoutDamageNumbers(vita_cost)
	player:setAether("nattack", 3000)
	
	if (target2 ~= nil) and (target2.state ~= 1) then
		amt = amt * (3 / 4)
		amt2 = amt * (1 / 2)
		target2.attacker = player.ID
		target2:removeHealthExtend(amt2, 1, 1, 1, 1, 0)
		target2:sendAnimation(204)
	end

	target.attacker = player.ID
	target:removeHealthExtend(amt, 1, 1, 1, 1, 0)
	target:sendAnimation(224)
	player:sendAction(1, 40)
end
}