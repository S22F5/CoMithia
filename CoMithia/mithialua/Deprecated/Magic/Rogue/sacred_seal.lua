sacred_seal = {
	
	cast=function(player,target)
		if(player.magic<360) then
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
		player:addMana(-360)
		player:playSound(19)
		target:sendAnimation(66)
		target:addHealth(600)
		player:sendMinitext("You cast Sacred seal.")
		if(target.ID~=player.ID) then
			target:sendMinitext(player.name .. " casts Sacred seal on you.") 
		end
	end,
	requirements=function(player)
		local l=86
		local i={0}
		local ia={1000000}
		local d={"Sacred seal\n\nA seal to heal someone using your energy","You l sacrifice 1000000 coins to learn this ability."}
		return l,i,ia,d
	end
}