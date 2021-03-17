adrenaline = {
	cast=function(player,target)
	if(player.magic<230) then
		player:sendMinitext("Your will is too weak.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	if(player:hasDuration("adrenaline")) then
		player:sendMinitext("Adrenaline is already in effect.")
		return
	end
		player.speed=player.speed-30
		player:updateState()
		player.grace=player.grace+10
		player:sendStatus()
		player:sendAction(6,35)
		player:sendAnimation(15)
		player:playSound(512)
		player:addMana(-230)
		player:sendMinitext("You feel the adrenaline rushing to your brain!")
		player:setDuration("adrenaline",40000)
		player:setAether("adrenaline",180000)

	end,
	recast=function(player)
		player.paralyzed=true
		player.speed=player.speed-30
		player:updateState()
		player.grace=player.grace+10
		player:sendStatus()
		player.paralyzed=false
	end,
	uncast=function(player)
		player.paralyzed=true
		player.speed=player.speed+30
		player:updateState()
		player.grace=player.grace-10
		player:sendStatus()
		player.paralyzed=false
	end,
	fix=function(player)
		player.grace=player.grace+10
		player:sendStatus()
	end,
	requirements=function(player)
		local l=72
		local i={0,58,6}
		local ia={3500,5,1}
		local d={"Adrenaline\n\nIncrease your speed considerably and evade attacks more easily","You shall sacrifice (5) Tiger's eye, (1) Squirrel fur and 3500 coins to learn this ability."}
		return l,i,ia,d
	end
}