bubble = {
	cast=function(player,target)

		player:sendMinitext("This spell has been deprecated and doesn't exist anymore")
		return

--[[		local calc

                if(player.state==1) then
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

                 
                if(player.magic<70) then
                    player:sendMinitext("You do not have enough Mana")
                    return
                end
   
                if(target.blType==BL_MOB) then
		      target.attacker=player.ID
                      target:removeHealthExtend(50, 1, 1, 1, 1, 0)
                      target:sendAnimation(184)
                      player:addMana(-70)  
                      player:sendMinitext("You cast Bubble.")
                      player:sendAction(6,35)
                      player:playSound(33)   
                 elseif(target.blType==BL_PC) then
			if(player.pvp==true) then
				target.attacker=player.ID
				target:sendMinitext(player.name .." casts Bubble on you.")
				target:removeHealthExtend(50, 1, 1, 1, 1, 0)
                      		target:sendAnimation(184)
                      		player:addMana(-70)  
                      		player:sendMinitext("You cast Bubble")
                      		player:sendAction(6,22)
                      		player:playSound(33)
			else
                      		player:sendMinitext("Something went wrong.")
                     		player:addMana(-70)
			end	        
                 end]]--
        end,
requirements=function(player)
		local l=23
		local i={0,5,6,66}
		local ia={1000,150,1,5}
		local d={"Bubble\n\nAn elemental attack of Ice and Water to strike your enemies","You shall have to sacrifice (150) Chestnut, (1) Squirrel's fur, (5) Amethyst and 1000 coins to learn this ability"}
		return l,i,ia,d
	end       
}