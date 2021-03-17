lure = {
	cast=function(player,target)
	if(player.magic<35) then
		player:sendMinitext("You do not have enough mana.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(target.state==1) then
		player:sendMinitext("Something went wrong.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	if(target.ID==player.ID) then
		player:sendMinitext("You whistle to yourself, realise you look weird and stop.")
		player:sendAnimation(318)
		player:playSound(1)
		player:talk(2,"~whistles~")
		return
	end
		if(target.blType==BL_MOB) then
			target.state=MOB_HIT
			target.target=player.ID
		end
		if(target.blType==BL_PC) then
		target:sendMinitext(player.name .. " casts Lure on you.")
		end
		player:sendAction(6,35)
		target:sendAnimation(318)
		player:playSound(1)
		player:addMana(-35)
		player:sendMinitext("You cast Lure.")
		player:setAether("lure",2000)
		player:talk(2,"~Whistles~")
	end,
	requirements=function(player)
		local l=7
		local i={0,5,7}
		local ia={25,25,25}
		local d={"Lure\n\nPersuade an ennemy to follow you.","You shall sacrifice (25) Chestnut, (25) Peas and 25 coins to learn this ability."}
		return l,i,ia,d
	end
}