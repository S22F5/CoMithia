krisalia_weapon = {
on_hit = function(player, target)
	if (player.registry["krisalia_weapon"] == 1) then
		return
	end
	local gfx = {12, 315, 318, 319, 331, 342, 351, 355, 356, 359, 367, 368, 373,
	376, 377, 378, 379, 10006, 10061, 10098, 10118, 10119, 10120, 10122,
	20115, 20119,
	20124, 276, 342, 356, 373, 10120,
	20124, 276, 342, 356, 373, 10120,
	20124, 276, 342, 10120,
	20124, 276, 342, 10120,
	20124, 276, 342, 10120,
	20124, 276}
	
	if (player.gfxClone == 0) then
		player.gfxClone = 1
		player.gfxArmor = 56
	end
	player.gfxWeap = gfx[math.random(#gfx)]
	local pcs = player:getObjectsInArea(BL_PC)
	if (#pcs > 1) then
		for i = i, #pcs do
			if (distance(player, pcs[i]) < 6) then
				pcs[i]:refresh()
			end
		end
	else
		player:refresh()
	end
end,

on_swing = function(player)
	local gfx = player.gfxWeap
	if (gfx == 10120) then
		krisalia_weapon.electric(player)
	elseif (gfx == 373) then
		krisalia_weapon.fire(player)
	elseif (gfx == 342) then
		krisalia_weapon.small_fire(player)		
	end
end,

electric = function(player)
	pcBlock = getTargetFacing(player, BL_PC, 0, 2)
	mobBlock = getTargetFacing(player, BL_MOB, 0, 2)
	if (pcBlock ~= nil) then
		pcBlock:sendAnimation(143)
	end
	if (mobBlock ~= nil) then
		mobBlock:sendAnimation(123)
	end
end,

fire = function(player)
	pcBlock = getTargetFacing(player, BL_PC)
	mobBlock = getTargetFacing(player, BL_MOB)
	if (pcBlock ~= nil) then
		pcBlock:sendAnimation(104)
	end
	if (mobBlock ~= nil) then
		mobBlock:sendAnimation(104)
	end
end,

small_fire = function(player)
	pcBlock = getTargetFacing(player, BL_PC, 0, 2)
	mobBlock = getTargetFacing(player, BL_MOB, 0, 2)
	if (pcBlock ~= nil) then
		pcBlock:sendAnimation(195)
	end
	if (mobBlock ~= nil) then
		mobBlock:sendAnimation(195)
	end
end

}