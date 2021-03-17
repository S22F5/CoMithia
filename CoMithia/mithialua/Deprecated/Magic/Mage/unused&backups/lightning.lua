lightning = {
 	cast=function(player,target)


		player:sendMinitext("This spell has been deprecated and doesn't exist anymore")
		return


--[[		local calc
                local calc2
 
                if(player.state==1) then
                    player:sendMinitext("Spirits can't do that") 
                    return
                end
		if(target.state==1) then
			player:sendMinitext("Something went wrong.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
                 
                if(player.magic<120) then
                    player:sendMinitext("You do not have enough Mana")
                    return
                end
   
                if(target.blType==BL_MOB) then
		      player:sendMinitext("You cast Lightning.")
                      target.attacker=player.ID
                      target:removeHealthExtend(250, 1, 1, 1, 1, 0)
                      calc2=math.random(1,15)
                      if(calc2==1) then  	   
				target.confused=TRUE
				target.confuseTarget=player.ID
                      end 
                      player:setAether("lightning",2000)
                      target:sendAnimation(30)
                      player:addMana(-120)  
                      player:sendAction(6,35)
                      player:playSound(73)   
                 elseif(target.blType==BL_PC) then
			if(player.pvp==true) then
				target.attacker=player.ID
				player:sendMinitext("You cast Lightning.")
				target:sendMinitext(player.name .." casts Lightning on you.")
                      		target:removeHealthExtend(400, 1, 1, 1, 1, 0)
				player:setAether("lightning",2000)
                      		target:sendAnimation(30)
                      		player:addMana(-120)  
                      		player:sendAction(6,35)
                      		player:playSound(73)
			else
				player:sendMinitext("Something went wrong.")
			end    
                 end]]--
        end,
	requirements=function(player)
		local l=31
		local i={0,5,66,6}
		local ia={1200,80,2,1}
		local d={"Lightning\n\nAn elemental attack that will unleash damage on your enemies, with a chance of confusing them","You shall sacrifice (80) Chestnut, (2) Amethyst, (1) Squirrel fur and 1200 coins to learn this ability"}
		return l,i,ia,d
	end    
}