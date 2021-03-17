necromancer_curse = {
	cast=function(player,target)
		if(player.state~=1) then
		if(not target:hasDuration("necromancer_curse")) then
			player:talk(0,"Necrosis: Your eyes will rot out, "..target.name.."!")         
			target:setDuration("necromancer_curse",10000)
			target:sendAnimation(145)
                     if(player.ID~=target.ID) then
   			target:sendMinitext("Necrosis targets you with his deadly curse!")
		     end
		end 
		end                                 
        end,
 	
	while_cast=function(player)

		player:removeHealth(player.maxHealth/20)
		player:sendAnimation(101)
		player:playSound(40)
	end
}