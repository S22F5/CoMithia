chill_wand = { 
equip = function(player)
	if (player:canLearnSpell("chill_wand")) then
		player:addSpell("chill_wand")
	end
end,

unequip = function(player)
	if (player:hasSpell("chill_wand")) then
		player:removeSpell(505)
	end
end,

on_break = function(player)
	if (player:hasSpell("chill_wand")) then
		player:removeSpell(505)
	end
end,

cast = function(player, target)

	local mcost = 35
	
	if (player.state == 1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end	
	
	if (player.state == 3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end	
	
	if (target.state == 1) then
		player:sendMinitext("Your target is already dead.")
		return
	end
	if (target.blType == BL_PC) then
		if (target.pvp == 0) then
			player:sendMinitext("Something went wrong.")
			return
		end
	end
	if (player.magic < mcost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	if (player:getEquippedDura(100000070) > 0) then
		player:deductDura(0, 1)
		player:removeMagic(mcost)
	else
		player:sendMinitext("You can not cast it at this moment.")
		return
	end
	
	--player:playSound(29)
	player:sendAction(1, 80)
	target:sendAnimation(22)
	player:setAether("chill_wand", 2000)
	
	local amt = (player.wisdom * 0.15) + (player.will * 1.1) + 40
	
	if (target:hasDuration("chill_wand")) then
		amt = amt * 1.1
	else
		if (target.blType == BL_PC) then
			target.speed = target.speed + 5
			target:calcStat()
			target:setDuration("chill_wand", 3000)
		elseif (target.blType == BL_MOB and target:changeMove(200) ~= false) then
			target:setDuration("chill_wand", 3000)
		end
	end
	target.attacker = player.ID
	target:removeHealthExtend(amt, 1, 1, 0, 1, 0)

end,

recast = function(player)
	player.speed = player.speed + 5
	player:calcStat()
end,

uncast = function(block)
	if (block.blType == BL_PC) then
		block.speed = block.speed - 5
		block:calcStat()
	elseif (block.blType == BL_MOB and block:changeMove(-200) ~= false) then
		--back to normal
	end
end

}