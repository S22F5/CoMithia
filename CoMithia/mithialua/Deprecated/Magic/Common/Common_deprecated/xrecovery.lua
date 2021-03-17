--[[recovery = {
	cast = function(player,target)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that.")
			return
		end	
		if(player.state==3) then
			player:sendMinitext("You can not cast this spell on a mount.")
			return
		end	


		if(player.magic>=5) then
			player:sendAction(6,35)
			player:sendMinitext("You cast Recovery.")
			player:addMana(-5)
			player:addHealth(50)
			player:sendAnimation(5)
			player:playSound(61)
		else
                        player:sendMinitext("You don't have enough Mana.")
                end
		
	end
}
]]--