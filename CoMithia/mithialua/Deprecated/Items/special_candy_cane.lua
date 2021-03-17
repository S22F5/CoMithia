special_candy_cane = {
	use = function(player)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
		
		santas_disguise.cast(player,player)

		player:removeItem("special_candy_cane",1)		
		player:sendMinitext("Ho ho ho!")

	end
}