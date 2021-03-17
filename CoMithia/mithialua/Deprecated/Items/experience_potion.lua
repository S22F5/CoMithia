experience_potion = {
	use = function(player)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end		
		experience_calc.cast(player,player)
		player:removeItem("experience_potion",1)
	end
}