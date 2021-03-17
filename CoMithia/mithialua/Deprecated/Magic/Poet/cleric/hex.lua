hex = {
	cast=function(player,target)
		
                if(player.state==1) then
                    player:sendMinitext("Spirits can't do that.")
                    return
                end
                
                if(player.magic<150) then
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

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Clerics may use this ability.")
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
				target:sendMinitext(player.name .." casts Hex on you.")
		         	target:sendAnimation(262)
			   	target:playSound(55)
				player:sendAction(6,35)
				target.ac=target.ac+30
			   	target:setDuration("hex",425000)
                           	player:addMana(-150)
                           	player:sendMinitext("You cast Hex.")
				target:sendStatus()
			else
				player:sendMinitext("Something went wrong.")
			end
			elseif(target.blType==BL_MOB) then
				target.ac=target.ac+30
				target:sendAnimation(262)
			   	target:playSound(55)
				player:sendAction(6,35)
			   	target:setDuration("hex",425000)
				target:repeatAnimation("hex",34)
                           	player:addMana(-150)
                           	player:sendMinitext("You cast Hex.")
			end
                          
	end,
	uncast=function(player)
		player.ac=player.ac-30
		player:sendStatus()
	end,

        recast = function(player)
                player.ac=player.ac+30
		player:sendStatus()
        end,
	fix = function(player)
                player.ac=player.ac+30
		player:sendStatus()
        end,

        --while_cast=function(player)
        --player:sendAnimation(34)
        --end,

	requirements=function(player)
		local l=42
		local i={0,"amethyst",6}
		local ia={1000,5,1}
		local d={"Hex\n\nA powerful Curse that effect your target's defenses.","You shall have to sacrifice (5) Amethyst, (1) Squirrel fur and 1000 coins to learn this ability"}
		return l,i,ia,d
	end       
}