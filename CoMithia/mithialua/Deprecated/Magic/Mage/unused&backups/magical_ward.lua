magical_ward = {
	cast=function(player,target)

	player:sendMinitext("This spell has been deprecated and does not exist anymore")
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

		if(player.magic<170) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
		if(target.blType==BL_MOB) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(target:hasDuration("ice_ward")) then
			player:sendMinitext("Ice ward is already in effect.")
			return
		end
		if(target:hasDuration("magical_ward")) then
			player:sendMinitext("Magical ward is already in effect.")
			return
		end
		if(target:hasDuration("guardian")) then
				player:sendMinitext("Guardian is already running.")
				return
		end

		     target.ac=target.ac-5
                     target:sendAnimation(110)
                     player:playSound(78)
                     player:addMana(-170)
		     target:sendStatus()
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Magical ward on you.")
		     end  
                     target:setDuration("magical_ward",185000)
		     player:sendMinitext("You cast Magical ward.")
		     target:sendMinitext("You feel your armor thickening.")
                     player:sendAction(6,35)]]--
        end,

	uncast=function(player)
		player.ac=player.ac+5
		player:sendStatus()
	end,
	recast=function(player)
		player.ac=player.ac-5
		player:sendStatus()
	end,
	fix=function(player)
		player.ac=player.ac-5
		player:sendStatus()
	end,
	requirements=function(player)
		local l=63
		local i={0,39}
		local ia={2700,5}
		local d={"Magical ward\n\nThickens your target's armor.","You shall have to sacrifice (5) Stolen coin and 2700 coins to learn this ability"}
		return l,i,ia,d
	end       
}