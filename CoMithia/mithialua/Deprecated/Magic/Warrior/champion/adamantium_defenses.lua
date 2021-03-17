adamantium_defenses = {
	cast=function(player,target)

	if(player.magic<player.maxMagic/10) then
		player:sendMinitext("Your will is too weak.")
		return
	end
	if(player:hasDuration("adamantium_defenses")) then
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

		player:sendAction(6,35)
		player:addMana(-player.maxMagic/10)
		player:sendAnimation(418)
		player:setDuration("adamantium_defenses",12000)
		player:setAether("adamantium_defenses",120000)
		player.ac=player.ac-20
		player:sendMinitext("You cast Adamantium defenses.")

	end,
	recast=function(player)
		player.ac=player.ac-20
	end,
	uncast=function(player)
		player.ac=player.ac+20
	end,
	fix=function(player)
		player.ac=player.ac-20
	end,

	requirements=function(player)
		local l=40
		local i={0,5,66,244}
		local ia={1500,80,5,1}
		local d={"Adamantium defenses\n\nChampion Ability\n\nTemporarily raises your defenses.","You shall sacrifice (80) Chestnut, (5) Amethyst, (1) Vial of blood and 1500 coins to learn this ability."}
		return l,i,ia,d
	end


}