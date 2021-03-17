healing_seed = {

	cast=function(player,target)

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		if(player.magic<player.maxMagic/10) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
		if(target.state==1) then
			player:sendMinitext("The wounds are to deep to be healed that way.")
			return
		end

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Clerics may use this ability.")
			return
		end
			
		if(target:hasDuration("healing_seed")) then
			player:sendMinitext("A Seed is already blooming on that target")
			return
		end

		player:addMana(-player.maxMagic/20)


		local spellaether = 0

		if(player.level>=25 and player.level<50) then
			spellaether = 3000
		end

		if(player.level>=50 and player.level<75) then
			spellaether = 2000
		end

		if(player.level>=75 and player.level<99) then
			spellaether = 1000
		end




		target:sendAnimation(59)
		player:sendAction(6,35)
		player:playSound(75)

		if(spellaether>0) then
                	player:setAether("healing_seed",spellaether)
		end

                target:setDuration("healing_seed",6000,player.ID)

		if(player.ID~=target.ID) then
			target:sendMinitext(player.name .." plants a Healing seed on you.")
		end

		player:sendMinitext("You cast Healing seed.")

	end,


	while_cast=function(player,caster)

		if(player.state==1 or player.health==0) then
			return
		end
	
		player:sendAnimation(321)
		player:addHealth2(caster.maxMagic/50)

	end,



	uncast=function(player,caster)

		if(player.health>0) then

				player:sendAnimation(58)
				player:addHealth(caster.maxMagic/5)

		else
			player:sendMinitext("Your injuries are too deep to be healed this way")

		end

	end,


	requirements=function(player)
		local l=25
		local i={0,"amethyst"}
		local ia={1250,10}
		local d={"Healing seed\n\nCleric Spell\n\nPlaces a seed on your target which blooms after a while, healing the target. Aether depends on level","You shall have to sacrifice (10) Amethyst and 1250 coins to learn this ability"}
		return l,i,ia,d
	end       
}

