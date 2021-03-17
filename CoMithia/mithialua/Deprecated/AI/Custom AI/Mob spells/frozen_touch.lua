frozen_touch = {
	cast=function(player,target)
		if(player.state~=1) then
			player:talk(0,"Raaah!")
                     if(player.ID~=target.ID) then
   			target:sendMinitext("Wilderbeast attacks you with his Frozen Touch")
		     end         
			local x=target.maxHealth*0.30
			target:addHealth(-x)
			target:sendAnimation(26)
			target:playSound(40)

		end                                 
        end
}