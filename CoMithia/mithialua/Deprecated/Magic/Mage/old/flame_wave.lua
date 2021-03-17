flame_wave = {
cast=function(player)

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
	local mcost = 65 + (mmana * 0.1235)
	
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
	amt = amt / 1.75
	
	local px = player.x
	local py = player.y
	local m = player.m
	local x = {}
	local y = {}
	if (player.side == 0) then
		x = {px-1, px-1, px, px, px, px, px+1, px+1}
		y = {py-4, py-3, py-4, py-3, py-2, py-1, py-4, py-3}
	elseif (player.side == 1) then
		x = {px+3,px+4,px+1,px+2,px+3,px+4,px+3,px+4}
		y = {py-1,py-1,py,py,py,py,py+1,py+1}
	elseif (player.side == 2) then
		x = {px-1, px-1, px, px, px, px, px+1, px+1}
		y = {py+4, py+3, py+4, py+3, py+2, py+1, py+4, py+3}
	elseif (player.side == 3) then
		x = {px-3,px-4,px-1,px-2,px-3,px-4,px-3,px-4}
		y = {py-1,py-1,py,py,py,py,py+1,py+1}
	end
	local target
	player:addMana(-mcost)
	player:sendMinitext("You release a wave of fire.")
	player:setAether("flame_wave",3500)
	
	for i = 1, #x do
		target = getTargetXY(m, x[i], y[i], BL_MOB,0)
		if (target == nil) then
			target = getTargetXY(m, x[i], y[i], BL_PC,0)
		end
		player:sendAnimationXY(46,x[i],y[i])
		if (target ~= nil) then
			target.attacker = player.ID
			target:setDuration("flame_wave",3000,player.ID)
			target:removeHealthExtend(amt, 1, 1, 0, 1, 0)
		end
	end
end,

while_cast_250 = function(player,caster)
	local cmmana = caster.maxMagic
	local amt = 1 + (cmmana * 0.002)
	player.target = player.ID
	player:removeHealth(1)
	player:removeHealthExtend(amt, 1, 1, 0, 1, 0)
end,

uncast=function(player,caster)
end
}
