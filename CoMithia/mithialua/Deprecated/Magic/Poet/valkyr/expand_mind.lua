expand_mind = {
	cast=function(player,target)

	if(target:hasDuration("expand_mind")==true) then
		player:sendMinitext("Expand mind is already active.")
		return
	end
	if(player.magic<player.maxMagic/20) then
		player:sendMinitext("You do not have enough mana.")
		return
	end
	if(target.state==1) then
		player:sendMinitext("Something went wrong")
		return
	end
	if(player.state==1) then
		player:sendMinitext("Spirits can't do that.")
		return
	end
	if(player.registry["currentspecialization"]~=2) then
		player:sendMinitext("Only Valkyrs may use this ability.")
		return
	end
	if(player.state==3) then
		player:sendMinitext("You can not cast this spell on a mount.")
		return
	end
	if(target.blType==BL_MOB) then
		player:sendMinitext("Something went wrong")
		return
	end
	

		player:sendAction(6,35)
		player:addMana(-player.maxMagic/20)
		player:playSound(31)

		target:sendAnimation(259)

		target.maxMagic=target.maxMagic*1.05
		target:sendStatus()	

		target:setDuration("expand_mind",600000,player.ID)
		player:sendMinitext("You cast Expand mind.")

		if(target.name~=player.name) then
			target:sendMinitext(""..player.name.." expands your mind.")
		end

	end,
	recast=function(player)
		player.maxMagic=player.maxMagic*1.05
		player:sendStatus()
	end,
	uncast=function(player,caster)
		player.maxMagic=player.maxMagic/1.05
		player:sendStatus()
	end,
	fix=function(player,caster)
		player.maxMagic=player.maxMagic*1.05
		player:sendStatus()
	end,


	requirements=function(player)
		local l=76
		local i={0,"tattered_cape","chestnut"}
		local ia={4000,1,50}
		local d={"Expand mind\n\nValkyr Spell\n\nExpands the mana pool of your target","You shall have to sacrifice (1) Tattered cape, (50) Chestnuts and 4000 coins to learn this ability"}
		return l,i,ia,d
	end       
}