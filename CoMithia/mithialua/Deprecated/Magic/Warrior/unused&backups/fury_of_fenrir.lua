fury_of_fenrir = {
	cast=function(player,target)


	player:sendMinitext("That spell has been deprecated")
	return
	end

--[[
		if(player.magic<30) then
			player:sendMinitext("Your will is too weak.")
			return
		end
		if(player:hasDuration("fury_of_fenrir")) then
			player:sendMinitext("You already cast Fury of Fenrir.")
			return
		end
		if(player:hasDuration("fury_of_nidhogg")) then
			player:sendMinitext("You already Fury of Nidhogg.")
			return
		end
		if(player:hasDuration("fury_of_tyr")) then
			player:sendMinitext("You already cast Fury of Tyr.")
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
			player:addMana(-30)
			player.rage=player.rage*2
			player:sendAnimation(103)
			player:playSound(31)
			player:setDuration("fury_of_fenrir",625000)
			player:sendMinitext("You cast Fury of Fenrir.")
	end,
	recast=function(player)
		player.rage=player.rage*2
	end,
	uncast=function(player)
		player.rage=player.rage/2
	end,
	requirements=function(player)
		local l=7
		local i={0,5,7}
		local ia={50,25,25}
		local d={"Fury of Fenrir\n\nConcentrate to hit harder with the power of Fenrir","You shall sacrifice 25 Peas, 25 Chesnuts, 50 coins to learn this ability."}
		return l,i,ia,d
	end

]]--
}