release_focus = {
	cast=function(player,target)         
                local m
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		if(target.state==1) then
			player:sendMinitext("That wouldn't help much.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Clerics may use this ability.")
			return
		end


		if(player.magic<120) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		if(target.blType==BL_MOB) then
			player:sendMinitext("Something went wrong.")
			return
		end
		if(target.ID==player.ID) then
			player:sendMinitext("This would be useless.")
			return
		end

                if((target.maxMagic-target.magic)<player.magic) then

			player:addMana(-(target.maxMagic-target.magic))
			target:addMana(target.maxMagic-target.magic)
		else
			target:addMana(player.magic)
			player:addMana(-(player.magic-1))
		end

		target:sendAnimation(166)
		player:playSound(74)

		if(player.ID~=target.ID) then
			target:sendMinitext(player.name .." casts Release focus on you.")
		end  

		player:setAether("release_focus",3000)

		player:sendAction(6,35)  
		player:sendMinitext("You cast Release focus.")

       
        end,

	requirements=function(player)
		local l=61
		local i={0,"broken_bone"}
		local ia={3200,5}
		local d={"Release focus\n\nTransfer all your energy to your target","You shall have to sacrifice (5) Broken bones and 3200 coins to learn this ability"}
		return l,i,ia,d
	end       
}