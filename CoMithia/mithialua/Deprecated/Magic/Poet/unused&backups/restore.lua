restore = {
	cast=function(player,target)         
		
		player:sendMinitext("This spell has been deprecated and does not exist anymore")
		return
                

--[[		if(player.state==1) then
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


		if(player.magic<=180) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

                     target:addHealth(1000/3)
                     target:sendAnimation(63)
                     player:playSound(20)
                     player:addMana(-180)
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Restore on you.")
		     end  
                     player:sendMinitext("You cast Restore.")
                     player:sendAction(6,35)
]]--
        end,
	requirements=function(player)
		local l=57
		local i={0,376}
		local ia={2800,5}
		local d={"Restore\n\nHeal your target's wounds","You shall have to sacrifice (5) Bone and 2800 coins to learn this ability"}
		return l,i,ia,d
	end       
}