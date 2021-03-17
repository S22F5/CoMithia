energy_drain = {
	cast=function(player,target)
		if(player.state~=1) then
                     if(player.ID~=target.ID) then
   			target:sendMinitext("You feel the cold fangs of the snake releasing poison in your body!")
		     end
			if(not target:hasDuration("energy_drain")) then         
				target:sendAnimation(84)
				target:playSound(69)
				target:setDuration("energy_drain",10000)
			end
         	
		end                                 
        end,
	while_cast=function(player)
		local countHealth=player.maxHealth/100*3
		local countMagic=player.maxMagic/100*3
	
		player:addHealth(-countHealth)
		if(player.magic>=countMagic) then		
			player:addMana(-countMagic)
		end	
		player:sendAnimation(84)
	end
}