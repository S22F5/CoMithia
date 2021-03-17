summon_healer_spell = {
cast = function(player)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	
	if(player.state==3) then
		player:sendMinitext("You cannot cast this spell on a mount.")
		return
	end

	local mmagic = player.maxMagic * 0.15
	local mvita = player.maxHealth * 0.15
	local health = player.health
	local magic = player.magic
		if (magic < mmagic) or (health < mvita) then
		return
	end
	player:addMana(-mvita)
	player:addHealth(-mmagic)

	player:spawn(1000, player.x, player.y, 1)
	
	local cell = player:getObjectsInCell(player.m, player.x, player.y, BL_MOB)
	
	if (#cell > 0) then
		if (cell[1].owner == 0) then
			cell[1].owner = player.ID
			cell[1].target = cell[1].ID
			summon_healer_d.cast(cell[1])
		end
	end
end,
}