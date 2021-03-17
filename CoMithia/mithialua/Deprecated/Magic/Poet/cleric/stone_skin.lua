stone_skin = {
	cast=function(player,target)
		local r
                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end
		if(player:hasDuration("stone_skin")) then
			player:sendMinitext("Stone skin is already in effect.")
			return
		end

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Clerics may use this ability.")
			return
		end

		if(player.magic<280) then
			player:sendMinitext("You do not have enough mana.")
			return
		end

		   if(player.pvp==false) then
		   	r=math.random(1,150)
		   else
			r=math.random(1,200)
		   end
		   if(player.will>r) then			
		     	player.deduction=0.01
                     	player:sendAnimation(141)
                     	player:playSound(53)
                     	player:addMana(-280)
		     	player:setDuration("stone_skin",12000)
		     	player:sendMinitext("You cast Stone skin.")
                     	player:sendAction(6,22)

			if(player.pvp==false) then
				player:setAether("stone_skin",300000)
			else
				player:setAether("stone_skin",3000)
			end
			
	            else
			player:sendMinitext("You didn't focus enough.")
			player:setAether("stone_skin",3000)               
        	    end
	end,

	while_cast=function(player)
	end,

	uncast=function(player)
		
		if(player:hasDuration("holy_protection")) then
			player.deduction=0.6
		elseif(player:hasDuration("guardian")) then
			player.deduction=0.6
		elseif(player:hasDuration("minor_shielding")) then
			player.deduction=0.8
	        else
			player.deduction=0
		end
	end,

	requirements=function(player)
		local l=78
		local i={0,58,432}
		local ia={4500,10,1}
		local d={"Stone skin\n\nYour skin hardens and protect you from damage.","You shall have to sacrifice (10) Tiger's eye, (1) Winter's chill and 4500 coins to learn this ability"}
		return l,i,ia,d
	end       
}