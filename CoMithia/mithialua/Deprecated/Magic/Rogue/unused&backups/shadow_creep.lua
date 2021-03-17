shadow_creep = {
	cast=function(player,target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	if(player.state==2) then
		player:sendMinitext("You already are invisible.")
		return
	end
	if(player.state==4) then
		player:sendMinitext("You can't do that while transformed.")
		return
	end
		player:sendAction(6,35)
		player:playSound(90)
		player:sendMinitext("You sneak undetected.")
		player:setDuration("shadow_creep",300000)
		player.state=2
		player.invis=3
		player:updateState()
	end,
	recast=function(player)
	end,
	uncast=function(player)
		player:setDuration("shadow_creep",0)
		if(player.state~=1) then
			player.state=0
		end
		player.invis=1
		player:updateState()
	end,
	fix=function(player)
	end,
	while_cast=function(player)
		if(player.state~=2) then
			shadow_creep.uncast(player)
		end
	end,
	requirements=function(player)
		local l=12
		local i={0,5,6}
		local ia={200,100,1}
		local d={"Hide\n\nSneak away undetected.","You shall sacrifice (100) Chestnut, (1) Squirrel fur and 200 coins to learn this ability."}
		return l,i,ia,d
	end
}