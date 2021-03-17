home_token = {
	use = function(player)
		if(player.m==3004) then
			player:sendMinitext("What are you trying to do? Escape from jail? tss tss.")
			return
		end
		if(player.m==3003) then
			player:sendMinitext("You can't use tokens in the court room.")
			return
		end
		if(player.m==52 and player.x<6 and player.y>19) then
			player:sendMinitext("You can't use token while you're claiming a booth")
			return
		end
		if(player.m==52 and player.x>10 and player.y>19) then
			player:sendMinitext("You can't use token while you're claiming a booth")
			return
		end
				
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
		if(player.m>2010 and player.m<2999) then
			player:sendMinitext("You can't use tokens on Carnage maps")
			return
		end
		

		if(player.registry["houseofresidencem"]~=0 and player.registry["houseofresidencex"]~=0 and player.registry["houseofresidencey"]~=0) then
				player:warp(player.registry["houseofresidencem"],player.registry["houseofresidencex"],player.registry["houseofresidencey"])
				player:removeItem("home_token",1)
				player:sendMinitext("You used a Home token and warped to your residence")
		else
				player:sendMinitext("You are not living in a House residence")
		end
  end
}