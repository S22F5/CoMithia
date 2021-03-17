hid200154 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["carnagehost"]>0) then		
                	local obj=getObject(2001,5,3)
			if(obj==338) then
				setObject(2001,5,3,360)
				setObject(2001,6,3,361)
				player:sendMinitext("Opened.")
			elseif(obj==360) then
				setObject(2001,5,3,338)
				setObject(2001,6,3,339)
				player:sendMinitext("Closed.")
			end
                else
                     player:sendMinitext("You are not a carnage host.")
                end
	     end
	end
}

hid200164 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["carnagehost"]>0) then		
                	local obj=getObject(2001,6,3)
			if(obj==339) then
				setObject(2001,5,3,360)
				setObject(2001,6,3,361)
				player:sendMinitext("Opened.")
			elseif(obj==361) then
				setObject(2001,5,3,338)
				setObject(2001,6,3,339)
				player:sendMinitext("Closed.")
			end
                else
                     player:sendMinitext("You are not a carnage host.")
                end
	     end
	end
}