honey_rain_mob = {
	cast=function(player,target)         
                     target:addHealth(5000)
                     target:sendAnimation(63)
                     target:playSound(22)
                     if(player.ID~=target.ID) then
   			target:sendMinitext(player.name .." casts Honey rain on you.")
		     end  
                                  
        end
 
}