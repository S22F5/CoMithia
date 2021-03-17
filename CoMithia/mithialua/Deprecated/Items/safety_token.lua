safety_token = {
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
		if(player.state==1 or player.state==3) then
			player:sendMinitext("You can't do that.")
			return
		end
		if(player.m>2010 and player.m<2999) then
			player:sendMinitext("You can't use tokens on Carnage maps")
			return
		end

        local x=math.random(1,4)
        player:playSound(361)
        if(x==1) then
                player:warp(18,2,4)
        elseif(x==2) then
                player:warp(18,27,4)
	elseif(x==3) then
		player:warp(9,3,6)
        else
		player:warp(9,7,6)
        end
	player:removeItem("safety_token",1) 
  end
}