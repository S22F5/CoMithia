yucky_candy_cane = {
	use = function(player)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
		
		player:addHealth(50000)
		player:addMana(50000)
		player:playSound(6)
		player:sendAnimation(49)
		player:removeItem("yucky_candy_cane",1)
		player:sendMinitext("The candy cane fills you with energy!")

	end
}