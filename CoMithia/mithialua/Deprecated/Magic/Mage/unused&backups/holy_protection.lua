holy_protection = {
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


		if(player.magic<260) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
		if(target.blType==BL_MOB) then
			player:sendMinitext("Something went wrong.")
			return
		end

		if(target:hasDuration("minor_shielding")) then
			player:sendMinitext("Minor shielding is already in effect.")
			return
		end
		
		if(target:hasDuration("holy_protection")) then
			player:sendMinitext("Holy protection is already in effect.")
			return
		end
		if(target:hasDuration("guardian")) then
				player:sendMinitext("Guardian is already running.")
				return
		end

		     target.deduction=0.5
                     target:sendAnimation(90)
                     player:playSound(67)
                     player:addMana(-260)
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Holy protection on you.")
		     end  
                     target:setDuration("holy_protection",185000)
		     player:sendMinitext("You cast Holy protection.")
                     player:sendAction(6,35)]]--
        end,
	while_cast=function(player)
		if(not player:hasDuration("stone_skin")) then
			player.deduction=0.5
		end
	end,
	uncast=function(player)
		if(player:hasDuration("stone_skin")) then
			player.deduction=0.01  
		else
			player.deduction=0
		end
	end,
requirements=function(player)
		local l=70
		local i={0,58}
		local ia={3500,5}
		local d={"Holy protection\n\nA holy magical protection to reduce damage taken.","You shall have to sacrifice (5) Tiger's eye and 3500 coins to learn this ability"}
		return l,i,ia,d
	end       
}