housing1710132 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["house1710131owner"]==1 or player.registry["house1710131guest"]==1) then		
                	local obj=getObject(17,10,131)
			if(obj==15368) then
				setObject(17,10,131,15384)
				player:sendMinitext("Opened.")
			elseif(obj==15384) then
				setObject(17,10,131,15368)
				player:sendMinitext("Closed.")
			end
                else
                     player:sendMinitext("You are neither a guest nor the owner of this house.")
                end
	     end
	end
}
