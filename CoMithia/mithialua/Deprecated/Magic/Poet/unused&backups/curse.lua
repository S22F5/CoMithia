curse = {
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
                
                if(player.magic<30) then
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
                                	target.ac=target.ac+8	
		         		target:sendAnimation(170)
			   		target:playSound(93)
					player:sendAction(6,35)
			   		target:setDuration("curse",30000)
					--target:repeatAnimation("curse",34)
                           		player:addMana(-30)
                           		player:sendMinitext("You cast Curse.")
					target:sendMinitext(player.name .." casts Curse on you.")
				else				
					player:sendMinitext("Something went wrong.")
				end
			end
			if(target.blType==BL_MOB) then
					target.ac=target.ac+8	
		         		target:sendAnimation(170)
			   		target:playSound(93)
			   		target:setDuration("curse",30000)
					target:repeatAnimation("curse",34)
					player:sendAction(6,35)
                           		player:addMana(-30)
                           		player:sendMinitext("You cast Curse.")
		
                       end
]]--
	end,
	uncast=function(player)
		player.ac=player.ac-8
		player:sendStatus()
	end,
        recast = function(player)
                player.ac=player.ac+8
		player:sendStatus()
        end,
        fix = function(player)
                player.ac=player.ac+8
		player:sendStatus()
        end,
requirements=function(player)
		local l=9
		local i={0,"Peas","Chestnut","squirrel_fur"}
		local ia={100,20,20,1}
		local d={"Curse\n\nA basic curse to strike down your ennemies defenses.","You shall have to sacrifice (20) Chestnut, (20) Peas, (1) Squirrel fur and 100 coins to learn this ability"}
		return l,i,ia,d
	end       
}