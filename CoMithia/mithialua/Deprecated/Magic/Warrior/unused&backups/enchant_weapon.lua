enchant_weapon = {
	cast=function(player,target)


	player:sendMinitext("That spell has been deprecated")
	return
	end

--[[
		if(player.magic<60) then
			player:sendMinitext("Your will is too weak")
			return
		end
		if(player.enchant>1) then
			player:sendMinitext("An enchantment is already in effect.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		player:addMana(-60)
		player:playSound(2)
		player:sendAction(6,35)
		player.enchant=1.2
		player:sendMinitext("Your weapon seems more powerful now.")
	end,
	requirements=function(player)
		local l=28
		local i={0,5,15,194}
		local ia={1000,100,5,1}
		local d={"Enchant weapon\n\nInfuse magic into your weapon to make it more performant.","You shall sacrifice (100) Chestnut, (5) Control rune, (1) Bastard sword and 1000 coins to learn this ability."}
		return l,i,ia,d
	end

]]--

}