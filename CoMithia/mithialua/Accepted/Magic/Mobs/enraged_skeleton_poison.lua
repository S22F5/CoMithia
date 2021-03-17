enraged_skeleton_poison = {
	while_cast = function(player)
		local damage = math.random(100,150)
		player.attacker = player.ID
		player:removeHealthExtend(damage, 1, 1, 1, 1, 0)
		player:sendAnimation(144)
	end,

	recast = function(player)
		player.ac = player.ac + 30
	end,

	uncast = function(block)
		if (block.blType == BL_MOB) then
			block.ac = block.ac - 30
		elseif (block.blType == BL_PC) then
			block:calcStat()
		end
	end
}