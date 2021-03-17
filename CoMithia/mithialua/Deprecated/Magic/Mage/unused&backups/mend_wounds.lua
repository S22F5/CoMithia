mend_wounds = {
	cast=function(player,target)         

		player:sendMinitext("This spell has been deprecated and doesn't exist anymore")
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
                        player:sendMinitext("The injuries are too deep to be healed this way.")
                        return
                end
                if(player.magic<350) then
			player:sendMinitext("You do not have enough mana.")
                        return
                end
                     target:addHealth(1200)
                     target:sendAnimation(66)
                     player:playSound(92)
                     player:addMana(-350)  
                     player:sendMinitext("You cast Mend wounds.")
                     player:sendAction(6,35)
                     player:setAether("mend_wounds",5000)]]--
        end,
requirements=function(player)
		local l=86
		local i={0}
		local ia={1000000}
		local d={"Mend wounds\n\nUsed to mend and heal allies wounds.","You shall have to sacrifice 1000000 coins to learn this ability"}
		return l,i,ia,d
	end       
}