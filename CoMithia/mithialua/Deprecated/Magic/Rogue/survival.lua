survival = {
	
	cast=function(player,target)
		if(player.magic<110) then
			player:sendMinitext("You do not have enough mana.")
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
		if(target.state==1) then
			player:sendMinitext("The injuries are too deep to be healed this way.")
			return
		end
		player:sendAction(6,35)
		player:addMana(-110)
		player:playSound(19)
		target:sendAnimation(66)
		target:addHealth(220)
		player:sendMinitext("You cast Survival.")
		if(target.ID~=player.ID) then
			target:sendMinitext(player.name .. " casts Survival on you.") 
		end
	end,
	requirements=function(player)
		local l=31
		local i={0,5,66,27}
		local ia={1200,50,2,1}
		local d={"Survival\n\nHeal an injured one","You shall sacrifice (50) Chestnut, (2) Amethyst, (1) Magical powder and 1200 coins to learn this ability."}
		return l,i,ia,d
	end
}