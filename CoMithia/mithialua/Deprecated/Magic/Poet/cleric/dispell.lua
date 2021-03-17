dispell = {
	cast=function(player,target)
		local r
		local calc
		local w
		
                if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end

		if(target.state==1) then
			player:sendMinitext("This wouldn't be of very much help right now.")
			return
		end

		if(player.registry["currentspecialization"]~=1) then
			player:sendMinitext("Only Clerics may use this ability.")
			return
		end

		if(player.magic<140) then
			player:sendMinitext("You do not have enough mana.")
			return
		end
		
		     --r=player.will/4
		     w=math.random(1,40)
		     --calc=w+(player.will/32)
		     if(w>=15) then
			target:flushDurationRange(1, 999)
			target:sendStatus()
                     	target:sendAnimation(77)
                 	player:playSound(34)
        	        player:addMana(-140)
			     if(player.ID~=target.ID) then
   					target:sendMinitext(player.name .." casts Dispell on you.")
		     	     end  
                     	player:sendMinitext("You cast Dispell.")
                     	player:sendAction(6,35)
		     else
			player:sendMinitext("You didn't focus enough.")
		     end              
        end,
	requirements=function(player)
		local l=83
		local i={0,466,471}
		local ia={5000,2,1}
		local d={"Dispell\n\nRemoves all common spells from target.","You shall have to sacrifice (2) Bottled rum, (1) Ship plank and 5000 coins to learn this ability"}
		return l,i,ia,d
	end       
}