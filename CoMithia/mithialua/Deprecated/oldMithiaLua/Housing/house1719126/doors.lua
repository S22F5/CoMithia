housing1719128 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["house1719127owner"]==1 or player.registry["house1719127guest"]==1) then		
                	local obj=getObject(17,19,127)
			if(obj==358) then
				setObject(17,19,127,364)
				player:sendMinitext("Opened.")
			elseif(obj==364) then
				setObject(17,19,127,358)
				player:sendMinitext("Closed.")
			end
			
                else
                     player:sendMinitext("You are neither a guest nor the owner of this house.")
                end
	     end
	end
}
