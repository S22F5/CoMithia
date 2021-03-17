lucky_candy_cane = {
	use = function(player)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end

		for i=1,1000 do
			player:setAether(i,0)
		end
		player:sendMinitext("The candy cane clears your mind!")
		player:removeItem("lucky_candy_cane",1)
	end
}