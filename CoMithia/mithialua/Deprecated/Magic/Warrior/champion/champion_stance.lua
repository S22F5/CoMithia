champion_stance = {
	cast=function(player,target)

	if(player.magic<player.maxMagic/10) then
		player:sendMinitext("Your will is too weak.")
		return
	end
	if(player:hasDuration("champion_stance")==true) then
		player:sendMinitext("You already cast that.")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.registry["currentspecialization"]~=2) then
		player:sendMinitext("Only Champions may use this ability.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end

		if(player:hasDuration("guardian")==true) then
			player.deduction=0.5
	        else
			player.deduction=0.8
		end

		player:sendAction(6,35)
		player:addMana(-player.maxMagic/10)
		player:sendAnimation(95)
		player:setDuration("champion_stance",600000)
		player:sendMinitext("You cast Champion stance.")

	end,
	recast=function(player)
		if(player:hasDuration("guardian")==true) then
			player.deduction=0.5
	        else
			player.deduction=0.8
		end
	end,
	uncast=function(player)
		if(player:hasDuration("guardian")==true) then
			player.deduction=0.7
	        else
			player.deduction=0
		end
	end,
	fix=function(player)
		if(player:hasDuration("guardian")==true) then
			player.deduction=0.5
	        else
			player.deduction=0.8
		end
	end,

	on_hit_cast=function(player,target)

		local checkdamage=player.damage
		checkdamage=player.damage/10

		local r = math.random(1,100)
		
		if(((player.magic/player.maxMagic)*100)>=r) then
			if(player:hasEquipped(sword_of_healing) == true) then
				player:addHealth(checkdamage * 2)
			else
				player:addHealth(checkdamage)
			end
		end
	end,

	requirements=function(player)
		local l=55
		local i={0,"amethyst"}
		local ia={2000,20}
		local d={"Champion stance\n\nChampion Ability\n\nRaises your defenses and gives everyone of your swings a chance to heal you for a percentage of the damage dealt","You shall sacrifice (20) Amethyst and 2000 coins to learn this ability."}
		return l,i,ia,d
	end


}