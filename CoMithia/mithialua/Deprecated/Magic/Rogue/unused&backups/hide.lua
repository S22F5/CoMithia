hide = {
	cast=function(player,target)
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.state==2) then
		player:sendMinitext("You already are invisible.")
		return
	end
	if(player.state==4) then
		player:sendMinitext("Can't do that transformed.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
		player:sendAction(6,35)
		player:playSound(90)
		player:sendMinitext("You Hide from the the world.")
		player:setDuration("hide",300000)
		player.state=2
		player.invis=9
		player:updateState()
	end,
	recast=function(player)
	end,
	uncast=function(player)
		player:setDuration("hide",0)
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
			hide.uncast(player)
		end
	end,
	requirements=function(player)
		local l=44
		local i={0,5,66,6}
		local ia={1800,200,10,2}
		local d={"Hide\n\nBecome invisible to those nearby.","You shall sacrifice (200) Chestnut, (10) Amethyst, (2) Squirrel fur and 1800 coins to learn this ability."}
		return l,i,ia,d
	end
}