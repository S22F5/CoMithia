vailed_strike = {
	cast=function(player,target)



	player:sendMinitext("That spell has been deprecated")
	return
	end


--[[
		if(player.magic<90) then
			player:sendMinitext("Your will is too weak.")
			return
		end
		if(player:hasDuration("vailed_strike")) then
			player:sendMinitext("You already cast that.")
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

			player:addMana(-90)
			player:sendAnimation(171)
			player:setDuration("vailed_strike",625000)
			player:sendMinitext("You cast Vailed strike.")
			player.backstab=1
	end,
	recast=function(player)
			player.backstab=1
	end,
	uncast=function(player)
			player.backstab=0
	end,
	fix=function(player)
			player.backstab=1
	end,
	requirements=function(player)
		local l=15
		local i={0,5,192}
		local ia={250,100,1}
		local d={"Vailed strike\n\nHit ennemies in your back.","You shall sacrifice (100) Chestnut, (1) Warrior's longsword and 250 coins to learn this ability."}
		return l,i,ia,d
	end

]]--

}