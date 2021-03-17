dexterity = {
	cast=function(player,target)
	if(player.magic<40) then
		player:sendMinitext("You do not have enough mana.")
		return
	end
	if(player:hasDuration("dexterity")) then
		player:sendMinitext("Dexterity is already in effect.")
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
		player:sendMinitext("You cast Dexterity.")
		player:sendAction(6,35)
		player:sendAnimation(20)
		player:playSound(711)
		player:addMana(-40)
		player.grace=player.grace+5
		player:setDuration("dexterity",320000)
		player:sendStatus()
	end,
	recast=function(player,target)
		player.grace=player.grace+5
		player:sendStatus()
	end,
	uncast=function(player,target)
		player.grace=player.grace-5
		player:sendStatus()
	end,
	fix=function(player)
		player.grace=player.grace+5
		player:sendStatus()
	end,
	requirements=function(player)
		local l=13
		local i={0,5,15}
		local ia={150,50,1}
		local d={"Dexterity\n\nFocus to gain extra agility.","You shall sacrifice (50) Chestnut, (1) Control rune and 150 coins to learn this ability."}
		return l,i,ia,d
	end
}