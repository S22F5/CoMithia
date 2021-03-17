fury_of_nidhogg = {
	cast=function(player,target)
	


	player:sendMinitext("That spell has been deprecated")
	return
	end

--[[
	if(player.magic<150) then
		player:sendMinitext("Your will is too weak.")
		return
	end
	if(player:hasDuration("fury_of_nidhogg")) then
		player:sendMinitext("You already cast that.")
		return
	end
	if(player:hasDuration("fury_of_tyr")) then
		player:sendMinitext("You already cast that.")
		return
	end
	if(player:hasDuration("fury_of_fenrir")) then
		player:sendMinitext("You already cast that.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end

		player:sendAction(6,35)
		player:addMana(-150)
		player:playSound(31)
		player:sendAnimation(94)
		player.rage=player.rage*4
		player:setDuration("fury_of_nidhogg",625000)
		player:sendMinitext("Your cast Fury of Nidhogg.")
	end,
	recast=function(player)
		player.rage=player.rage*4
	end,
	uncast=function(player)
		player.rage=player.rage/4
	end,
	requirements=function(player)
		local l=48
		local i={0,5,244,246}
		local ia={2000,200,2,1}
		local d={"Fury of Nidhogg\n\nConcentrate to hit harder with the power of Nidhogg","You shall sacrifice (200) Chestnut, (2) Vial of blood, (1) Blue stinger and 2000 coins to learn this ability."}
		return l,i,ia,d
	end

]]--

}
