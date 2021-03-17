nheal = {
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
	
	if(player.magic < mana_cost) then
		player:sendMinitext("Not enough mana")
		return
	end

	local target = getTargetFacing(player, BL_PC)
	
	if (target == nil) then
		target = player
		--player:sendMinitext("You need someone to lay your hands on.")
		--player:setAether("nheal", 1000)
		--return
	end
	
	if (target.state == 1) then
		player:sendMinitext("It's of no use.")
		return
	end

	local amt = 20
	
	player:addMana(-mana_cost)
	player:setAether("nheal", 1000)
	
	if (player.id == target.id) then
		target:addHealth(amt)
		target:sendAnimation(5)
		player:sendMinitext("You touch yourself.")
	else
		target:addHealth(amt)
		target:sendAnimation(5)
		player:addHealth(amt / 2)
	end
	player:sendAction(6, 40)
end
}