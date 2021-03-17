esuna = {
	cast=function(player,target)         


		player:sendMinitext("This spell has been deprecated and does not exist anymore")
		return


--[[                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		if(target.state==1) then
			player:sendMinitext("The injuries are too deep to be healed this way.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.magic<130) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

                     target:addHealth(500/3)
                     target:sendAnimation(65)
                     player:playSound(22)
                     player:addMana(-130)
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Esuna on you.")
		     end  
                     player:sendMinitext("You cast Esuna.")
                     player:sendAction(6,35)
]]--
        end,
	requirements=function(player)
		local l=33
		local i={0,5,244}
		local ia={1200,130,2}
		local d={"Esuna\n\nHeal your target wounds","You shall sacrifice (130) Chestnut, (2) Vial of blood and 1200 coins to learn this ability"}
		return l,i,ia,d
	end        
}