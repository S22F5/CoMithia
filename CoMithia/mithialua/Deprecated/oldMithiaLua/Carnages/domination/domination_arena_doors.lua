hid200184 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["carnagehost"]>0) then		
                	local obj=getObject(2001,8,3)
			if(obj==338) then
				setObject(2001,8,3,360)
				setObject(2001,9,3,361)
				player:sendMinitext("Opened.")
			elseif(obj==360) then
				setObject(2001,8,3,338)
				setObject(2001,9,3,339)
				player:sendMinitext("Closed.")
			end
                else
                     player:sendMinitext("You are not a carnage host.")
                end
	     end
	end
}

hid200194 = {
	open=function(player)
	    if(player.side==0) then
                if(player.registry["carnagehost"]>0) then		
                	local obj=getObject(2001,9,3)
			if(obj==339) then
				setObject(2001,8,3,360)
				setObject(2001,9,3,361)
				player:sendMinitext("Opened.")
			elseif(obj==361) then
				setObject(2001,8,3,338)
				setObject(2001,9,3,339)
				player:sendMinitext("Closed.")
			end
                else
                     player:sendMinitext("You are not a carnage host.")
                end
	     end
	end
}