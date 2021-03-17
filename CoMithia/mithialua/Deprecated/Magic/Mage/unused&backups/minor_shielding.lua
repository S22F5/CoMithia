minor_shielding = {
	cast=function(player,target)

	player:sendMinitext("This spell has been deprecated and does not exist anymore")
	return


--[[                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(target.state==1) then
			player:sendMinitext("This wouldn't be of very much help right now.")
			return
		end

		if(player.magic<140) then
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
		     target:sendAnimation(56)
                     player:playSound(65)
                     player:addMana(-140)
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Minor shielding on you.")
		     end  
                     target:setDuration("minor_shielding",320000)
		     player:sendMinitext("You cast Minor shielding.")
                     player:sendAction(6,35)]]--
        end,
	while_cast=function(player)
		if(not player:hasDuration("stone_skin")) then
			player.deduction=0.8
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
		local l=31
		local i={0,5,66,6}
		local ia={800,100,5,1}
		local d={"Minor shielding\n\nA minor magical shield to reduce damage taken.","You shall sacrifice (100) Chestnut, (5) Amethyst, (1) Squirrel fur and 800 coins to learn this ability"}
		return l,i,ia,d
	end       
}