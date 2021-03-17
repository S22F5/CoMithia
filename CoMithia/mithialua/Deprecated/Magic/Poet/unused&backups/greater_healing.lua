greater_healing = {
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


		if(player.magic<=220) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

                     target:addHealth(2000/3)
                     target:sendAnimation(63)
                     player:playSound(20)
                     player:addMana(-220)
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Greater healing on you.")
		     end  
                     player:sendMinitext("You cast Greater healing.")
                     player:sendAction(6,35)
]]--
        end,

	requirements=function(player)
		local l=75
		local i={0,"tigers_eye","shining_amethyst"}
		local ia={4500,5,1}
		local d={"Greater healing\n\nHeal your target's wounds with great effect","You shall have to sacrifice (5) Tiger's eye, (1) Shining amethyst and 4500 coins to learn this ability"}
		return l,i,ia,d
	end       
}