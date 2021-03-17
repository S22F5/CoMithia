curative_incantation = {
	cast=function(player,target)         

                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end

		if(target.state==1) then
			player:sendMinitext("The injuries are too deep to be healed this way.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(player.magic<player.maxMagic/50) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
		healing_done = math.pow(player.level+1,2)/2
		healing_done = healing_done - (healing_done*.40)
		healing_done = healing_done + player.will*player.registry["currenttier"]
		healing_done = healing_done + player.maxMagic * .005
		healing_done = healing_done * math.pow(2,player.rank)

		if(player.registry["currentspecialization"]==1) then
			healing_done=math.ceil(healing_done/5)
		end
		
		target:addHealth(healing_done)
        	target:sendAnimation(298)
        	player:playSound(74)
        	player:addMana(math.ceil(-player.maxMagic/50))
		player:sendAction(6,35)  
        	player:sendMinitext("You cast Curative incantation.")  

		if(player.ID~=target.ID) then
   			target:sendMinitext(""..player.name .." casts Curative incantation on you.")
		end


                end,
                             
		requirements=function(player)
		local l=12
		local i={0,"chestnut"}
		local ia={100,50}
		local d={"Curative incantation\n\nAllows you to heal wounds by through magic","You shall have to sacrifice (50) Chestnut and 100 coins to learn this ability"}
		return l,i,ia,d
		end       
}