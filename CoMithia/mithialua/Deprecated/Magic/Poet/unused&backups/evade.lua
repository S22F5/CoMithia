evade = {
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


		if(player.magic<60) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
		if(target.blType==BL_MOB) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(target:hasDuration("evade")) then
			player:sendMinitext("Evade is already in effect.")
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

		     target.grace=target.grace+5
                     target:sendAnimation(74)
                     player:playSound(25)
                     player:addMana(-60)
		     target:sendStatus()
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Evade on you.")
		     end  
                     target:setDuration("evade",320000)
		     player:sendMinitext("You cast Evade.")
		     target:sendMinitext("You feel a little quicker.")
                     player:sendAction(6,35)
]]--
        end,

	uncast=function(player)
		player.grace=player.grace-5
		player:sendStatus()
	end,

	recast=function(player)
		player.grace=player.grace+5
		player:sendStatus()
	end,
	fix=function(player)
		player.grace=player.grace+5
		player:sendStatus()
	end,
requirements=function(player)
		local l=13
		local i={0,5,17}
		local ia={150,70,5}
		local d={"Evade\n\nBetter one's grace to evade attacks.","You shall have to sacrifice (70) Chestnut, (5) Safety token and 150 coins to learn this ability"}
		return l,i,ia,d
	end       
}