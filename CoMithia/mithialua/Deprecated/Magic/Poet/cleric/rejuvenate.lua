rejuvenate = {

	cast=function(player,target)

		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		if(player.magic<player.maxMagic/20) then
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

		if(target:hasDuration("rejuvenate")) then
			player:sendMinitext("Rejuvenate is already active")
			return
		end

		if(target.blType==BL_MOB or target.blType==BL_NPC) then
			player:sendMinitext("Something went wrong")
			return
		end

		player:addMana(-player.maxMagic/20)
		target:sendAnimation(72)
		player:sendAction(6,35)
		player:playSound(75)

		local spellduration=(player.level+1)*150

                target:setDuration("rejuvenate",spellduration,player.ID)

		if(player.ID~=target.ID) then
			target:sendMinitext(player.name .." casts Rejuvenate on you.")
		end

		player:setAether("rejuvenate",15000)
		player:sendMinitext("You cast Rejuvenate.")

	end,

	while_cast=function(player,caster)

		if(player.state==1 or player.health==0) then
			return
		end
	
		player:sendAnimation(347)

		local regenamount = caster.maxMagic/100
		local willcheck = 0

		if(caster.will>100) then		
			willcheck = player.will-100
		end

		regenamount = regenamount + (willcheck*regenamount/100)	
	
		player:addMana(regenamount)

	end,


	requirements=function(player)
		local l=51
		local i={0,61}
		local ia={2500,5}
		local d={"Rejuvenate\n\nCleric Spell\n\nSlowly regenerates your target's mana.","You shall have to sacrifice (5) Chrysocolla and 2500 coins to learn this ability"}
		return l,i,ia,d
	end       
}

