holy_hands = {
	cast=function(player,target)
	if(player.magic<player.maxMagic/10) then
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
		player:sendMinitext("Only Clerics may use this ability.")
		return
	end


	if(target.blType==BL_MOB or target.blType==BL_NPC) then
		player:sendMinitext("Something went wrong.")
		return
	end
	if(target.state==1) then
		player:sendMinitext("The injuries are too deep to be healed this way.")
		return
	end

	target:addHealth(player.maxMagic/2)
	player:addMana(-player.maxMagic/10)
	player:playSound(74)
	target:sendAnimation(123)

	if(player.ID~=target.ID) then
   		target:sendMinitext(""..player.name .." casts Holy hands on you.")
	end  

        player:sendMinitext("You cast Holy hands.")
        player:sendAction(6,35)
	player:setAether("holy_hands",120000)

	end,

	requirements=function(player)
		local l=74
		local i={0,58,244}
		local ia={4200,2,10}
		local d={"Holy hands\n\nLay your hands upon a target to heal serious wounds","You shall sacrifice (2) Tiger's eye, (10) Vial of blood and 4200 coins to learn this ability."}
		return l,i,ia,d
		
	end
}
