empower = {
	cast=function(player,target)

		player:sendMinitext("This spell has been deprecated and does not exist anymore")
		return 0


--[[                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		if(target.state==1) then
			player:sendMinitext("This wouldn't be of very much help right now.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.magic<80) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
		if(target.blType==BL_MOB) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(target:hasDuration("empower")) then
			player:sendMinitext("Empower is already in effect.")
			return
		end
		if(target:hasDuration("runic")) then
			player:sendMinitext("Runic is already in effect.")
			return
		end
		if(target:hasDuration("guardian")) then
				player:sendMinitext("Guardian is already running.")
				return
		end

		     target.might=target.might+10
                     target:sendAnimation(94)
                     player:playSound(82)
                     player:addMana(-80)
		     target:sendStatus()
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Empower on you.")
		     end  
                     target:setDuration("empower",320000)
		     player:sendMinitext("You cast Empower.")
		     target:sendMinitext("You feel stronger.")
                     player:sendAction(6,22)
]]--
        end,

	uncast=function(player)
		player.might=player.might-10
		player:sendStatus()
	end,

	recast=function(player)
		player.might=player.might+10
		player:sendStatus()
	end,
	fix=function(player)
		player.might=player.might+10
		player:sendStatus()
	end,

	requirements=function(player)
		local l=38
		local i={0,5,66}
		local ia={1300,70,5}
		local d={"Empower\n\nGrows your target's might.","You shall sacrifice (70) Chestnut, (5) Amethyst and 1300 coins to learn this ability"}
		return l,i,ia,d
	end      
}