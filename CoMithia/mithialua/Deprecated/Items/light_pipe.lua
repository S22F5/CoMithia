light_pipe = {
	use = function(player)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end

                player:addMana(300)
                if player.health>40 then
                player:addHealth2(-30)
                end
                player:sendAction(8,25)
	end
}