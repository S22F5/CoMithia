vital_spark = {
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


		if(player.magic<90) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

                     target:addHealth(200)
                     target:sendAnimation(65)
                     player:playSound(22)
                     player:addMana(-90)
		     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Vital spark on you.")
		     end  
                     player:sendMinitext("You cast Vital spark.")
                     player:sendAction(6,35)
]]--
        end,
requirements=function(player)
		local l=8
		local i={0,5,27}
		local ia={10,10,1}
		local d={"Vital Spark\n\nFocus to heal allies","You shall have to sacrifice (10) Chestnut, (1) Magical powder and 10 coins to learn this ability"}
		return l,i,ia,d
	end       
}