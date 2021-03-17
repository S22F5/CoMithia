runic_shards = {
cast = function (player)

	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end

	local mana = player.magic
	local mmana = player.maxMagic
	local will = player.will
	local level = player.level
	local mcost = 40 + (mmana * 0.095)
	
	if (mana < mcost) then
		player:sendMinitext("Not enough mana.")
		return
	end
	
	local willperc
	if (level >= 40) then
		willperc = will / 96
	else
		willperc = will / (2.4 * level)
	end
	
	local amt = (willperc * will * mmana * 0.0012)
	amt = amt * (5 - math.floor(level / 10))
	amt = amt + 5
	
	local target = getTargetFacing(player,BL_MOB,0)
	if (target == nil) then
		target = getTargetFacing(player,BL_PC,0)
	end
	if (target == nil) then
		player:sendMinitext("No target in range.")
		return
	end
	player:addMana(-mcost)
	player:sendMinitext("You strike your foe with shards of an ancient rune.")
	player:setAether("runic_shards",500)
	target.attacker = player.ID
	target:setDuration("runic_shards",2000,player.ID)
	target:removeHealthExtend(amt, 1, 1, 0, 1, 0)
	target:sendAnimation(12)
end,

while_cast = function(player,caster)
	local cmmana = caster.maxMagic
	local amt = cmmana * 0.012
	player.target = player.ID
	player:removeHealthExtend(amt, 1, 1, 0, 1, 0)
end,

uncast=function(player,caster)
end
}
