spiked_brew = {
	use = function(player)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
                player:addMana(40)
                if player.health>6 then
                player:addHealth2(-5)
                end
                player:sendAction(8,25)
	end
}