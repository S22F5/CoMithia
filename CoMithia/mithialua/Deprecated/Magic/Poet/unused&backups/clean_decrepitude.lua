clean_decrepitude = {
	cast=function(player,target)

--[[		player:sendMinitext("This spell has been deprecated and does not exist anymore")
		return


                if(player.state==1) then
                    player:sendMinitext("Spirits can't do that.")
                    return
                end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
		if(target.state==1) then
			player:sendMinitext("Something went wrong.")
			return
		end
                
                if(player.magic<70) then
                    player:sendMinitext("You do not have enough mana.")
                    return
                end
               
                if(not target:hasDuration("decrepitude")) then
                   target:sendAnimation(280)
                   player:playSound(13)
		   player:sendAction(6,22)
                   return
                end
                
                target:sendAnimation(280)
                player:playSound(13)
                player:addMana(-70)
                target:setDuration("decrepitude",0)
                player:sendMinitext("You cast Clean Decrepitude.")
			if(target.blType==BL_PC) then
				target:sendMinitext(player.name .." casts Clean decrepitude on you.")
			end
		target:sendStatus()
]]--
        end,

	requirements=function(player)
		local l=47
		local i={0,5,27,6}
		local ia={1700,80,1,1}
		local d={"Clean Decrepitude\n\nRemoves decrepitude from your target","You shall sacrifice (80) Chestnut, (1) Magical powder, (1) Squirrel fur and 1700 coins to learn this ability"}
		return l,i,ia,d
	end   
}