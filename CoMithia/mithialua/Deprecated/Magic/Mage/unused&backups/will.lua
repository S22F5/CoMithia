will = {
	cast=function(player,target)

		player:sendMinitext("This spell has been deprecated and doesn't exist anymore")
		return

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

		if(player.magic<110) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
		if(target.blType==BL_MOB) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(target:hasDuration("will")) then
			player:sendMinitext("Will is already in effect.")
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

		     target.will=target.will+8
                     target:sendAnimation(171)
                     player:playSound(41)
                     player:addMana(-110)
		     target:sendStatus()
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Will on you.")
		     end  
                     target:setDuration("will",320000)
		     player:sendMinitext("You cast Will.")
		     target:sendMinitext("You concentrade easier.")
                     player:sendAction(6,35)]]--
        end,

	uncast=function(player)
		player.will=player.will-8
		player:sendStatus()
	end,
	
	recast=function(player)
		player.will=player.will+8
		player:sendStatus()
	end,
	fix=function(player)
		player.will=player.will+8
		player:sendStatus()
	end,

	requirements=function(player)
		local l=27
		local i={0,5,215,27}
		local ia={500,50,1,2}
		local d={"Will\n\nHelps one focusing.","You shall have to sacrifice (50) Chestnut, (1) Shadow flame, (2) Magical powder and 500 coins to learn this ability"}
		return l,i,ia,d
	end       
}