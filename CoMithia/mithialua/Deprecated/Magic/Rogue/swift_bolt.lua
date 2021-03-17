swift_bolt = {
	cast=function(player,target)
		local calc
		if(player.magic<50) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.") 
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
		
		if(target.blType==BL_PC) then
			if(player.pvp==true) then
				target.attacker=player.ID
				target:removeHealthExtend(20, 1, 1, 1, 1, 0)
				player:addMana(-50)
				player:playSound(73)	
				player:sendMinitext("You cast Swift bolt.")
				target:sendMinitext(player.name .." casts  Swift bolt on you.")
				target:sendAnimation(29)
				player:sendAction(6,35)
			else
				player:sendMinitext("Something went wrong.")
			end
		elseif(target.blType==BL_MOB) then
				target.attacker=player.ID
				target:removeHealthExtend(20, 1, 1, 1, 1, 0)
				player:addMana(-30)
				player:playSound(73)	
				player:sendMinitext("You cast Swift bolt.")
				target:sendAnimation(29)
				player:sendAction(6,35)
		end						              
        end,
requirements=function(player)
		local l=23
		local i={0,5,27}
		local ia={500,150,1}
		local d={"An swift bolt to attack ennemies","You shall have to sacrifice (150) Chestnut, (1) Magical powder and 500 coins to learn this ability"}
		return l,i,ia,d
	end       
}