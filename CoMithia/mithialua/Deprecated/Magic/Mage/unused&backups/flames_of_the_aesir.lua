flames_of_the_aesir = {
 	cast=function(player,target)


	player:sendMinitext("This spell has been deprecated")
	return

--[[                if(player.state==1) then
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
                if(player.magic<150) then
                    player:sendMinitext("You do not have enough Mana")
                    return
                end
		local dam=(player.will*10)+(player.magic*0.025*player.will/130)
   
                if(target.blType==BL_MOB) then
			if(player.health>player.maxHealth/20) then
				player:removeHealth(player.maxHealth/20)
			end
			player:sendMinitext("You cast Flames of the Aesir.")
                	target.attacker=player.ID
                	target:removeHealthExtend(dam, 1, 1, 1, 1, 0)
                	target:sendAnimation(414)
                	player:addMana(-150)  
                	player:sendAction(6,35)
			player:setAether("flames_of_the_aesir",2000)  
		elseif(target.blType==BL_PC) then
			player:sendMinitext("Something went wrong.")	        
                end]]--

        
        end,
	requirements=function(player)
		local l=99
		local i={0,"experience_gem","soulstone"}
		local ia={7500,10,5}
		local d={"Flames of the Aesir\n\nConjure the Flames of the Aesir to strike your enemy.","You shall have to sacrifice (10) Experience gem, (5) Soulstone and 7500 coins to learn this ability"}
		return l,i,ia,d
	end       
}