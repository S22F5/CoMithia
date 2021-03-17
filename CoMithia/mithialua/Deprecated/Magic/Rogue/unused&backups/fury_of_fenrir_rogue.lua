fury_of_fenrir_rogue = {
	cast=function(player,target)
		if(player.magic<30) then
			player:sendMinitext("Your do not have enough mana.")
			return
		end
		if(player:hasDuration("fury_of_fenrir_rogue")) then
			player:sendMinitext("You already cast Fury of Fenrir.")
			return
		end
		if(player:hasDuration("fury_of_nidhogg")) then
			player:sendMinitext("You already Fury of Nidhogg.")
			return
		end
		if(player:hasDuration("fury_of_tyr_rogue")) then
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
			player:setDuration("fury_of_fenrir_rogue",625000)
			player:sendMinitext("You cast Fury of Fenrir.")
	end,
	recast=function(player)
		player.rage=player.rage*2
	end,
	uncast=function(player)
		player.rage=player.rage/2
	end,
	requirements=function(player)
		local l=27
		local i={0,13,66}
		local ia={700,1,5}
		local d={"Fury of Fenrir\n\nConcentrate to hit harder with the power of Fenrir","You shall sacrifice (1) Draazok's club, (5) Amethyst and 700 coins to learn this ability."}
		return l,i,ia,d
	end
}