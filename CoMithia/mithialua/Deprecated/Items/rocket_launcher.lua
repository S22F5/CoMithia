rocket_launcher = {
	use = function(player)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
                player:sendAnimation(278)
		player:sendAnimation(13)
		player:playSound(58)
		player:addHealth(250)
		player:addMana(250)
	end
}