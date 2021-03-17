vigor = {
	cast=function(player,target)


	player:sendMinitext("That spell has been deprecated")
	return
	end

--[[
	local calc=280+player.will
	if(player.magic<180) then
		player:sendMinitext("Your will is too weak.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not do that on a mount.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	player:sendAction(6,20)
	player:addMana(-180)
	player:sendAnimation(5)
	player:addHealth(calc)
	player:sendMinitext("You cast Vigor.")
	
	end,
	requirements=function(player)
		local l=92
		local i={0}
		local ia={1000000}
		local d={"Vigor\n\nUse your will to heal your injuries","You shall sacrifice 1000000 coins to learn this ability."}
		return l,i,ia,d
	end
]]--

}