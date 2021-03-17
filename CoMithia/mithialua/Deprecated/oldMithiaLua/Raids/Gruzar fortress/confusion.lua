confusion_mob = {
	cast=function(player,target)
		if(player.state~=1) then
                     if(player.ID~=target.ID) then
   			target:sendMinitext("The Avatar of Pain confuses you !")
		     end
			if(not target:hasDuration("confusion_mob")) then         
				target:sendAnimation(34)
				target:playSound(19)
				target.drunk=255
				target:setDuration("confusion_mob",6000)
			end
         	
		end                                 
        end,
        uncast=function(player)
		player.drunk=0
		--player:talk(0,"debug")
	end,
        recast=function(player)
        	player.drunk=255
        end


}