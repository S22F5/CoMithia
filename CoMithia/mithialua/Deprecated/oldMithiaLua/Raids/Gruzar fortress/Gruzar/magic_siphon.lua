magic_siphon = {
	cast=function(player,target)
		if(player.state~=1) then         
			target:setDuration("darken_soul",30000)
			target:sendAnimation(145)
                     if(player.ID~=target.ID) then
   			target:sendMinitext("Gruzar darkens your soul!")
		     end
		end                                 
        end,
 	
	while_cast=function(player)
		local count=player.maxMagic*0.05
				
		if(player.magic>count) then
			player:addMana(-count)
		end
		player:sendAnimation(403)
		--player:playSound(40)
	end
}