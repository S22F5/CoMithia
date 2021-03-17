housing179733 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["house179732owner"]==1 or player.registry["house179732guest"]==1) then		
                	local obj=getObject(17,97,32)
			if(obj==394) then
				setObject(17,97,32,362)
				setObject(17,98,32,363)
				player:sendMinitext("Opened.")
			elseif(obj==362) then
				setObject(17,97,32,394)
				setObject(17,98,32,395)
				player:sendMinitext("Closed.")
			end
			
                else
                     player:sendMinitext("You are neither a guest nor the owner of this house.")
                end
	     end
	end
}
housing179833 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["house179732owner"]==1 or player.registry["house179732guest"]==1) then		
                	local obj=getObject(17,98,32)
			if(obj==395) then
				setObject(17,97,32,362)
				setObject(17,98,32,363)
				player:sendMinitext("Opened.")
			elseif(obj==363) then
				setObject(17,97,32,394)
				setObject(17,98,32,395)
				player:sendMinitext("Closed.")
			end
			
                else
                     player:sendMinitext("You are neither a guest nor the owner of this house.")
                end
	     end
	end
}
