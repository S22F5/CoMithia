hid20010203 = {
	click=function(player,npc)
		if(player.state==1) then
			player:sendMinitext("You need to be alive to participate.")
			player:warp(2001,2,8)
			return
		end

		if(player.class==0) then
			player:sendMinitext("You can not enter as a peasant.")
			local x=math.random(1,4)
            			if(x==1) then
               				player:warp(18,2,4)
            			elseif(x==2) then
               				player:warp(18,27,4)
            			elseif(x==3) then
               				player:warp(9,3,6)
            			else player:warp(9,7,6)
            			end
				
		else
			player:warp(2007,10,13)
		end
	end
}

hid20010303 = {
	click=function(player,npc)
		if(player.state==1) then
			player:sendMinitext("You need to be alive to participate.")
			player:warp(2001,3,8)
			return
		end

		if(player.class==0) then
			player:sendMinitext("You can not enter as a peasant.")
			local x=math.random(1,4)
            			if(x==1) then
               				player:warp(18,2,4)
            			elseif(x==2) then
               				player:warp(18,27,4)
            			elseif(x==3) then
               				player:warp(9,3,6)
            			else player:warp(9,7,6)
            			end
				
		else
			player:warp(2007,11,13)
		end
	end
}

hid20071014 = {

		click=function(player,npc)
		        local x=math.random(1,4)
            		if(x==1) then
               			player:warp(18,2,4)
            		elseif(x==2) then
               			player:warp(18,27,4)
            		elseif(x==3) then
               			player:warp(9,3,6)
            		else player:warp(9,7,6)
            		end

		end
}
hid20071114 = {

		click=function(player,npc)
		        local x=math.random(1,4)
            		if(x==1) then
               			player:warp(18,2,4)
            		elseif(x==2) then
               			player:warp(18,27,4)
            		elseif(x==3) then
               			player:warp(9,3,6)
            		else player:warp(9,7,6)
            		end

		end
}
