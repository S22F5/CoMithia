charge = {
	cast=function(player,target)
	if(player.magic<230) then
		player:sendMinitext("You do not have enough Mana.")
		return
	end
	if(player:hasDuration("charge")) then
		player:sendMinitext("Charge is already in effect.")
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
		player:sendAnimation(260)
		player:playSound(512)
		player:addMana(-230)
		player.ac=player.ac-15
		player.speed=player.speed-15
		player:sendMinitext("You get ready to Charge!")
		player:setDuration("charge",25000)
		player:setAether("charge",160000)
		player:updateState()
		player:sendStatus()
	end,
	recast=function(player)
		player.speed=player.speed-15
		player.ac=player.ac-15
		player:updateState()
		player:sendStatus()
	end,
	uncast=function(player)
		player.speed=player.speed+15
		player.ac=player.ac+15
		player:sendStatus()
		player:updateState()
	end,
	fix=function(player)
		player.ac=player.ac-15
		player:sendStatus()
	end,
	requirements=function(player)
		local l=84
		local i={0,350}
		local ia={3500,10}
		local d={"Charge\n\nIncrease your speed for a short while, and makes less vulnerable to attacks","You shall sacrifice (10) Snake meat and 3500 coins to learn this ability."}
		return l,i,ia,d
	end
}