clean_hex = {
	cast=function(player,target)
		
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
                
                if(player.magic<90) then
                    player:sendMinitext("You do not have enough mana.")
                    return
                end
              
                if(not target:hasDuration("hex")) then
                   target:sendAnimation(296)
                   player:playSound(67)
		   player:sendAction(6,35)
                   return
                end
                
                target:sendAnimation(296)
                player:playSound(67)
                player:addMana(-90)
		player:sendAction(6,35)
                target:setDuration("hex",0)
                player:sendMinitext("You cast Clean Hex.")
			if(target.blType==BL_PC) then
				target:sendMinitext(player.name .." casts Clean hex on you.")
			end
		target:sendStatus()                        
	
        end,
	requirements=function(player)
		local l=44
		local i={0,"blue_stinger"}
		local ia={1000,2}
		local d={"Clean Hex\n\nRemoves Hex from your target","You shall have to sacrifice (2) Blue stinger and 1000 coins to learn this ability"}
		return l,i,ia,d
	end       
}