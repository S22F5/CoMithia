infuse_weapon = {
	cast=function(player,target)


	player:sendMinitext("That spell has been deprecated")
	return
	end

--[[
	if(player.magic<90) then
		player:sendMinitext("Your will is too weak.")
		return
	end
	if(player.enchant>1) then
		player:sendMinitext("An enchantment is already in effect.")
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
		player.enchant=1.5
		player:sendMinitext("You weapon shines.")
		
	end,
	recast=function(player)
	end,
	uncast=function(player)
	end,
	fix=function(player)
	end,
	requirements=function(player)
		local l=55
		local i={0,61}
		local ia={2200,5}
		local d={"Enchant weapon\n\nInfuse greater magic into your weapon to make it more performant.","You shall sacrifice (5) Chrysocolla and 2200 coins to learn this ability."}
		return l,i,ia,d
	end

]]--

}