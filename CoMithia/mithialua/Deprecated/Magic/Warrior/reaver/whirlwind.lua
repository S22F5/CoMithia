whirlwind = {
	cast=function(player,target)
	
		if(player.magic<(player.maxMagic/3)) then
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

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Reavers may use this ability.")
			return
		end
		if(player.extendHit==1 and player.enchant>1) then
			player:sendMinitext("Whirlwind is already in effect")
			return
		end

		local enchantcalc=0
		player:sendAction(6,35)
		player:addMana(-player.maxMagic/3)
		player:playSound(25)
		player:sendAnimation(294)

		if(player.level < 99) then
			enchantcalc=3+(player.level/30)
		elseif(player.level >= 99) then
            		if(player:hasDuration("tenacity")) then
                		--enchantcalc=8*(3+(player.maxMagic/4000)+((player.maxHealth/1.25)/8000))/4
						enchantcalc=(22+(player.maxMagic/2500)+((player.maxHealth/1.25)/2500))/4
            		else
                		--enchantcalc=8*(3+(player.maxMagic/4000)+(player.maxHealth/8000))/4
						enchantcalc=22+(player.maxMagic/2500)+(player.maxHealth/2500)/4
            		end
		end
		player.enchant=enchantcalc/1.5
		player.extendHit=1
		player.backstab=1
		player.flank=1

		player:sendMinitext("You extend the reach of your weapon.")

	end,

	requirements=function(player)
		local l=25
		local i={0,"chestnut","blue_stinger"}
		local ia={500,10,1}
		local d={"Whirlwind\n\nReaver spell\n\nAn alternative stance to Searing Edge, sacrificing brute power to hit a greater number of enemies.","You shall sacrifice (10) Chestnut, (1) Blue stinger and 500 coins to learn this ability."}
		return l,i,ia,d
	end

}
