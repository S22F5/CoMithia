decrepitude = {
	cast=function(player,target)

		player:sendMinitext("This spell has been deprecated and does not exist anymore")
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
			player:sendMinitext("Something went wrong.")
			return
		end
                
                if(player.magic<110) then
                    player:sendMinitext("You do not have enough mana.")
                    return
                end

                if(target:hasDuration("curse")) then
                   player:sendMinitext("A curse is already active on the target [Curse].")
                   return
                end
                
                if(target:hasDuration("feebleness")) then
                   player:sendMinitext("A curse is already active on the target [Feebleness].")
                   return
                end

		 if(target:hasDuration("decrepitude")) then
                   player:sendMinitext("A curse is already active on the target [Decrepitude].")
                   return
                end
		if(target:hasDuration("hex")) then
                   player:sendMinitext("A curse is already active on the target [Hex].")
                   return
                end
			if(target.blType==BL_PC) then
			if(player.pvp==true) then
                                target.ac=target.ac+25	
		         	target:sendAnimation(293)
			   	target:playSound(43)
				player:sendAction(6,35)
				target:sendMinitext(player.name .." casts Decrepitude on you.")
			   	target:setDuration("decrepitude",425000)
				--target:repeatAnimation("decrepitude",34)
                           	player:addMana(-110)
                           	player:sendMinitext("You cast Decrepitude.")
			else
				player:sendMinitext("Something went wrong.")
			end
			end
			if(target.blType==BL_MOB) then
				target.ac=target.ac+25	
		         	target:sendAnimation(293)
			   	target:playSound(43)
				player:sendAction(6,35)
			   	target:setDuration("decrepitude",425000)
				target:repeatAnimation("decrepitude",34)
                           	player:addMana(-110)
                           	player:sendMinitext("You cast Decrepitude.")
			end
]]--
	end,
	uncast=function(player)
		player.ac=player.ac-25
		player:sendStatus()
	end,
        recast = function(player)
                player.ac=player.ac+25
		player:sendStatus()
        end,
        fix = function(player)
                player.ac=player.ac+25
		player:sendStatus()
        end,
	requirements=function(player)
		local l=48
		local i={0,5,66,244}
		local ia={2000,200,10,2}
		local d={"Decrepitude\n\nLosen your target's defenses.","You shall sacrifice (200) Chestnut, (10) Amethyst, (2) Vial of blood and 2000 coins to learn this ability"}
		return l,i,ia,d
	end     
}