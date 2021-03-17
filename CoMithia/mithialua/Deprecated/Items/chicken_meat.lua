chicken_meat = {
	use = function(player)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
		player:addHealth2(10)
                player:sendAction(8,25)
	end
}