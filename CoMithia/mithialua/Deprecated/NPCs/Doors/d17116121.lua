d17116121 = {
	open=function(player)
	    if(player.side==0) then
                if(player.mapRegistry["d17116121"]==0) then		
                	local obj=getObject(17,116,120)
			if(obj==791) then
				setObject(17,114,120,782)
				setObject(17,115,120,783)
				setObject(17,116,120,784)
				player:sendMinitext("Closed.")
			elseif(obj==784) then
				setObject(17,114,120,789)
				setObject(17,115,120,790)
				setObject(17,116,120,791)
				player:sendMinitext("Opened.")
			end
                else
                     player:sendMinitext("The door is locked.")
                end
	     end
	end
}

d17115121 = {
	open=function(player)
	    if(player.side==0) then
                if(player.mapRegistry["d17116121"]==0) then		
                	local obj=getObject(17,115,120)
			if(obj==790) then
				setObject(17,114,120,782)
				setObject(17,115,120,783)
				setObject(17,116,120,784)
				player:sendMinitext("Closed.")
			elseif(obj==783) then
				setObject(17,114,120,789)
				setObject(17,115,120,790)
				setObject(17,116,120,791)
				player:sendMinitext("Opened.")
			end
                else
                     player:sendMinitext("The door is locked.")
                end
	     end
	end
}