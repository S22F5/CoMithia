housing559795 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["house559794owner"]==1 or player.registry["house559794guest"]==1) then		
                	local obj=getObject(55,97,94)
			if(obj==8377) then
				setObject(55,97,94,8379)
				player:sendMinitext("Opened.")
			elseif(obj==8379) then
				setObject(55,97,94,8377)
				player:sendMinitext("Closed.")
			end
                else
                     player:sendMinitext("You are neither a guest nor the owner of this house.")
                end
	     end
	end
}
