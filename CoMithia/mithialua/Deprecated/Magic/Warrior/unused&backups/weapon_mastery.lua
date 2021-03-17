weapon_mastery  = {
	cast=function(player,target)


	player:sendMinitext("That spell has been deprecated")
	return
	end

	--[[


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
	if(player.enchant>1) then
		player:sendMinitext("An enchantment is already in effect.")
		return
	end
		player:sendAction(6,35)
		player:addMana(-90)
		player.enchant=2
		player:playSound(2)
		player:sendMinitext("Your use your weapon with grace.")
		
	end,
	requirements=function(player)
		local l=71
		local i={0,58}
		local ia={3000,1}
		local d={"Weapon mastery\n\nUse your weapon with great abilities.","You shall sacrifice (1) Tiger's eye and 3000 coins to learn this ability."}
		return l,i,ia,d
	end

	]]--
}
