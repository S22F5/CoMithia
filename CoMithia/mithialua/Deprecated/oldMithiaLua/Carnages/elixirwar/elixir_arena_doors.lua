hid2001114 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["carnagehost"]>0) then		
                	local obj=getObject(2001,11,3)
			if(obj==338) then
				setObject(2001,11,3,360)
				setObject(2001,12,3,361)
				player:sendMinitext("Opened.")
			elseif(obj==360) then
				setObject(2001,11,3,338)
				setObject(2001,12,3,339)
				player:sendMinitext("Closed.")
			end
                else
                     player:sendMinitext("You are not a carnage host.")
                end
	     end
	end
}

hid2001124 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["carnagehost"]>0) then		
                	local obj=getObject(2001,12,3)
			if(obj==339) then
				setObject(2001,11,3,360)
				setObject(2001,12,3,361)
				player:sendMinitext("Opened.")
			elseif(obj==361) then
				setObject(2001,11,3,338)
				setObject(2001,12,3,339)
				player:sendMinitext("Closed.")
			end
                else
                     player:sendMinitext("You are not a carnage host.")
                end
	     end
	end
}