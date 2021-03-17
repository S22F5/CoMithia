electrocute = {
 	cast=function(player,target)

		player:sendMinitext("This spell has been deprecated")
		return

--[[                if(player.state==1) then
                    player:sendMinitext("Spirits can't do that") 
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

                 
                if(player.magic<150) then
                    player:sendMinitext("You do not have enough Mana")
                    return
                end
   
                if(target.blType==BL_MOB) then
		      player:sendMinitext("You cast Electrocute.")
                      target.attacker=player.ID
                      target:removeHealthExtend(300, 1, 1, 1, 1, 0)
                      target:sendAnimation(143)
                      player:addMana(-150)  
                      player:sendAction(6,35)
                      player:playSound(73)   
                 elseif(target.blType==BL_PC) then
			if(player.pvp==true) then
				target.attacker=player.ID
				target:sendMinitext(player.name .." casts Electrocute on you.")
				player:sendMinitext("You cast Electrocute.")
                      		target:removeHealthExtend(100, 1, 1, 1, 1, 0)
                      		target:sendAnimation(143)
                      		player:addMana(-150)  
                      		player:sendAction(6,35)
                      		player:playSound(73)
			else
				player:sendMinitext("Something went wrong")
                                player:addMana(-150)
			end	        
                 end]]--
        end,
	requirements=function(player)
		local l=75
		local i={0,58,6}
		local ia={4000,5,1}
		local d={"Electrocute\n\nAn elemental attack to electrocute your enemy with great power.","You shall have to sacrifice (5) Tiger's eye, (1) Squirrel fur and 4000 coins to learn this ability"}
		return l,i,ia,d
	end       
}