freeze_time = {
	cast=function(player,target)
		if(player.state~=1) then
                     if(player.ID~=target.ID) then
   			target:sendMinitext("The snake of Midgard freezes time!")
		     end
			if(not target:hasDuration("freeze_time")) then         
				target:sendAnimation(199)
				target:playSound(7)
				target.paralyzed=true
				target:setDuration("freeze_time",7000)
			end
         	
		end                                 
        end,
        uncast=function(player)
		player.paralyzed=false
	end,
        recast=function(player)
        	player.paralyzed=true
        end


}