lokis_shroud = {
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

	if(player.registry["currentspecialization"]==2) then
		player:sendMinitext("Archers cannot use this ability")
		return
	end

		player:sendAction(6,35)
		player:playSound(11)
		--player:sendAnimation(3)
		player:sendMinitext("You shroud yourself from the the world.")
		player:setDuration("lokis_shroud",300000)
		player.state=2
		local calcinvis
		if(player.level < 99) then
			calcinvis=10+(player.level/6)
		elseif(player.level == 99) then
			-- player.invis=7*(3+(player.maxMagic/4250)+(player.maxHealth/8500))
			-- player.invis=4*(10+(player.maxMagic/5000)+(player.maxHealth/10000))
			calcinvis=40+(player.maxMagic/2500)+(player.maxHealth/2500)
		end
		calcinvis = calcinvis * 1.2
		player.invis = calcinvis
		
 		player:updateState()
	end,
	recast=function(player)
	end,
	uncast=function(player)
		player:setDuration("lokis_shroud",0)
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
			lokis_shroud.uncast(player)
		end
	end,
	requirements=function(player)
		local l=8
		local i={0,"safety_token","amethyst"}
		local ia={200,5,1}
		local d={"rogue_test\n\nBecome invisible to those nearby.","You shall sacrifice (5) Safety token, (1) Amethyst and 200 coins to learn this ability."}
		return l,i,ia,d
	end
}