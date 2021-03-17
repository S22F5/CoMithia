feebleness = {
	cast=function(player,target)


		player:sendMinitext("This spell has been deprecated and does not exist anymore")
		return


		
--[[                if(player.state==1) then
                    player:sendMinitext("Spirits can't do that.")
                    return
                end
                
                if(player.magic<70) then
                    player:sendMinitext("You do not have enough mana.")
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
                                target.ac=target.ac+15
				target:sendMinitext(player.name .."casts Feebleness on you.")	
		         	target:sendAnimation(249)
			   	target:playSound(26)
				player:sendAction(6,35)
			   	target:setDuration("feebleness",425000)
				--target:repeatAnimation("feebleness",34)
                           	player:addMana(-70)
                           	player:sendMinitext("You cast Feebleness.")
			else
				player:sendMinitext("Something went wrong.")
			end
			elseif(target.blType==BL_MOB) then
				target.ac=target.ac+15
				target:sendAnimation(249)
			   	target:playSound(26)
				player:sendAction(6,35)
			   	target:setDuration("feebleness",425000)
				target:repeatAnimation("feebleness",34)			
                           	player:addMana(-70)
                           	player:sendMinitext("You cast Feebleness.")
			end
]]--
	end,
	uncast=function(player)
		player.ac=player.ac-15
		player:sendStatus()
	end,
        recast = function(player)
                player.ac=player.ac+15
		player:sendStatus()
        end,
        fix = function(player)
                player.ac=player.ac+15
		player:sendStatus()
        end,
requirements=function(player)
		local l=26
		local i={0,5,215,92}
		local ia={1200,100,1,1}
		local d={"Feebleness\n\nLosen your enemies defenses.","You shall have to sacrifice (100) Chestnut, (1) Shadow flame, (1) Hardened garb and 1200 coins to learn this ability"}
		return l,i,ia,d
	end       
}