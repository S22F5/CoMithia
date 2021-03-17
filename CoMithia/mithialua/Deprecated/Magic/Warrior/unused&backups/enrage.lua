enrage = {
	cast=function(player,target)


	player:sendMinitext("That spell has been deprecated")
	return
	end


--[[
	if(player.magic<30) then
		player:sendMinitext("Your will is too weak.")
		return
	end
	if(player:hasDuration("enrage")) then
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
		player:addMana(-30)
		player:sendAnimation(2)
		player:setDuration("enrage",385000)
		player.dam=player.dam+2
		player:sendMinitext("You cast Enrage.")
	end,
	recast=function(player)
		player.dam=player.dam+2
	end,
	uncast=function(player)
		player.dam=player.dam-2
	end,
	fix=function(player)
		player.dam=player.dam+2
	end,
	requirements=function(player)
		local l=35
		local i={0,5,66,244}
		local ia={1500,80,5,1}
		local d={"Enrage\n\nAllows you to hit harder.","You shall sacrifice (80) Chestnut, (5) Amethyst, (1) Vial of blood and 1500 coins to learn this ability."}
		return l,i,ia,d
	end
]]--

}