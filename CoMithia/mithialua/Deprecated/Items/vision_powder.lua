vision_powder = {
	use = function(player)
		if(player.registry["thewell"]==3) then
	           	player:sendAction(8,25)
			player.registry["thewell"]=4
			player:sendMinitext("You should be able to notice the tools should you stumble on them now.")
			
		end
	end
}