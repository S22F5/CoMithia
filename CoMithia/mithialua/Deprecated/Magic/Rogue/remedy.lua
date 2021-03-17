remedy = {
	
	cast=function(player,target)
		if(player.magic<230) then
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
		player:addMana(-230)
		player:playSound(19)
		target:sendAnimation(66)
		target:addHealth(410)
		player:sendMinitext("You cast Remedy.")
		if(target.ID~=player.ID) then
			target:sendMinitext(player.name .. " casts Remedy on you.") 
		end
	end,
	requirements=function(player)
		local l=63
		local i={0,29,6}
		local ia={3000,2,1}
		local d={"Remedy\n\nCure an injured one","You shall have to sacrifice (2) Fish, (1) Squirrel fur and 3000 coins to learn this ability."}
		return l,i,ia,d
	end
}