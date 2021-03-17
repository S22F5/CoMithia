fury_of_tyr = {
	cast=function(player,target)


	player:sendMinitext("That spell has been deprecated")
	return
	end

--[[
	
	if(player.magic<90) then
		player:sendMinitext("Your will is too weak.")
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
	if(player:hasDuration("fury_of_nidhogg")) then
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
		player:addMana(-90)
		player:playSound(31)
		player:sendAnimation(11)
		player.rage=player.rage*3
		player:setDuration("fury_of_tyr",625000)
		player:sendMinitext("Your cast Fury of Tyr.")
	end,
	recast=function(player)
		player.rage=player.rage*3
	end,
	uncast=function(player)
		player.rage=player.rage/3
	end,
	fix=function(player)
	end,
	requirements=function(player)
		local l=26
		local i={0,6,66,168}
		local ia={500,1,5,1}
		local d={"Fury of Tyr\n\nConcentrate to hit harder with the power of Tyr.","You shall sacrifice (1) Squirrel's fur, (5) Amethyst, (1) Luminous leaf and 500 coins to learn this ability."}
		return l,i,ia,d
	end

]]--
}