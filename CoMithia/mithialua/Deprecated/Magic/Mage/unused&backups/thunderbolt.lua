thunderbolt = {
	cast=function(player,target)

	player:sendMinitext("This spell has been deprecated and does not exist anymore")
	return
		
--[[		local calc
		
		if(player.magic<30) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		if(target.state==1) then
			player:sendMinitext("Something went wrong.")
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
		
		if(target.blType==BL_PC) then
			if(player.pvp==true) then
				target.attacker=player.ID
				target:removeHealthExtend(20, 1, 1, 1, 1, 0)
				player:addMana(-30)
				player:playSound(73)	
				player:sendMinitext("You cast Thunderbolt.")
				target:sendMinitext(player.name .." casts Thunderbolt on you.")
				target:sendAnimation(29)
				player:sendAction(6,35)
			else
				player:sendMinitext("Something went wrong.")
			end
		elseif(target.blType==BL_MOB) then
				if(target.blType==BL_MOB and target.state ~=MOB_DEAD and target.target==nil) then
					target.state=MOB_HIT
					target.target=player.ID
				end
				player:sendMinitext("You cast Thunderbolt.")
				target.attacker=player.ID
				target:removeHealthExtend(20, 1, 1, 1, 1, 0)
				player:addMana(-30)
				player:playSound(73)	
				
				target:sendAnimation(29)
				player:sendAction(6,35)
		end]]--
        end,
	requirements=function(player)
		local l=7
		local i={0,"Peas","Chestnut"}
		local ia={50,10,10}
		local d={"An elemental attack of Thunder to strike your enemies","You shall have to sacrifice (10) Chestnut, (10) Peas and 50 coins to learn this ability"}
		return l,i,ia,d
	end       
}