bottled_rum = {
	use = function(player)
		
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
	
                player:addMana(700)
                if player.health>100 then
                player:addHealth2(-100)
                end
                player:sendAction(8,25)
	end
}