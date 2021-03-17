cure = {
	cast=function(player,target)


	player:sendMinitext("That spell has been deprecated")
	return
	end

--[[
	if(player.magic<60) then
		player:sendMinitext("Your will is too weak.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(target.state==1) then
		player:sendMinitext("The wounds are too severe to be healed that way.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	player:sendAction(6,35)
	player:addMana(-60)
	target:sendAnimation(5)
	target:addHealth(50)
	if(target.ID~=player.ID) then
		target:sendMinitext(player.name .. " cast Cure on you.")
	end
	player:sendMinitext("You cast Cure.")


	end,
	requirements=function(player)
		local l=13
		local i={0,5,29}
		local ia={100,50,5}
		local d={"Cure\n\nAllows you to cure your allies.","You shall sacrifice (50) Chestnut, (5) Fish and 100 coins to learn this ability."}
		return l,i,ia,d
	end

]]--

}