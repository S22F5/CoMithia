focus = {
	cast=function(player,target)


	player:sendMinitext("That spell has been deprecated")
	return
	end

--[[
	if(player:hasDuration("focus")) then
		player:sendMinitext("You already cast that.")
		return
	end
	if(player.magic<60) then
		player:sendMinitext("Your will is too weak.")
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
	player:addMana(-60)
	player:sendAnimation(117)
	player:setDuration("focus",190000)
	player.hit=player.hit+2
	player:sendMinitext("You cast Focus.")
	end,
	recast=function(player)
	player.hit=player.hit+2
	end,
	uncast=function(player)
	player.hit=player.hit-2
	end,
	fix=function(player)
	player.hit=player.hit+2
	end,
	requirements=function(player)
		local l=9
		local i={0,5,15}
		local ia={100,50,2}
		local d={"Focus\n\nHelps you concentrate to hit your ennemies","You shall sacrifice 50 Chestnuts, 2 Control runes and 100 coins to learn this ability"}
		return l,i,ia,d
	end
]]--

}