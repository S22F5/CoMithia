sideswipe = {
	cast=function(player,target)


	player:sendMinitext("That spell has been deprecated")
	return
	end

--[[
		if(player:hasDuration("sideswipe")) then
			player:sendMinitext("You already cast that.")
			return
		end
		if(player.magic<90) then
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
		
		player:addMana(-90)
		player:sendAction(6,10)
		player:playSound(64)
		player:sendAnimation(132)
		player:setDuration("sideswipe",625000)
		player.flank=1
		player:sendMinitext("You cast Sideswipe.")
	end,
	recast=function(player)
		player.flank=1
	end,
	uncast=function(player)
		player.flank=0
	end,
	fix=function(player)
		player.flank=1
	end,
	requirements=function(player)
		local l=20
		local i={0,5,66}
		local ia={300,100,1}
		local d={"Sideswipe\n\nProtect your flanks by hitting your ennemies on the sides.","You shall sacrifice (100) Chestnut, (1) Amethyst and 300 coins to learn this ability"}
		return l,i,ia,d
	end

]]--

}