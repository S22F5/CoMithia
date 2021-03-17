hid21002932 = {
	click=function(player,npc)

		if(player.mapRegistry["hallexitdoors"]==0) then
			player:warp(2100,24,24)
			player:sendMinitext("The Exit doors have not been set.")
			return
		end

		if(player.armorColor==63) then
			if(player.mapRegistry["hallexitdoors"]==1) then
				player:warp(2101,10,10)
				player:sendMinitext("Congratulations, you won the Carnage.")
				return
			elseif(player.mapRegistry["hallexitdoors"]==2) then
				player:warp(2102,10,10)
				player:sendMinitext("Congratulations, you won the Assault.")
				return
			elseif(player.mapRegistry["hallexitdoors"]==3) then
				player:warp(2103,10,10)
				player:sendMinitext("Congratulations, you won the Domination.")
				return
			elseif(player.mapRegistry["hallexitdoors"]==4) then
				player:warp(2104,10,10)
				player:sendMinitext("Congratulations, you won the Elixir War.")
				return
			end
		else
			player:sendMinitext("You lost! Better luck next time.")
			player:warp(9,3,6)
			return
		end
			
	end
}

hid21003032 = {
	click=function(player,npc)

		if(player.mapRegistry["hallexitdoors"]==0) then
			player:warp(2100,24,24)
			player:sendMinitext("The Exit doors have not been set.")
			return
		end

		if(player.armorColor==63) then
			if(player.mapRegistry["hallexitdoors"]==1) then
				player:warp(2101,10,10)
				player:sendMinitext("Congratulations, you won the Carnage.")
				return
			elseif(player.mapRegistry["hallexitdoors"]==2) then
				player:warp(2102,10,10)
				player:sendMinitext("Congratulations, you won the Assault.")
				return
			elseif(player.mapRegistry["hallexitdoors"]==3) then
				player:warp(2103,10,10)
				player:sendMinitext("Congratulations, you won the Domination.")
				return
			elseif(player.mapRegistry["hallexitdoors"]==4) then
				player:warp(2104,10,10)
				player:sendMinitext("Congratulations, you won the Elixir War.")
				return
			end
		else
			player:sendMinitext("You lost! Better luck next time.")
			player:warp(9,3,6)
			return
		end
			
	end
}
hid21002933 = {
	open=function(player)
		if(player.side==0) then
    	        	if(player.registry["carnagehost"]>0) then		
                		local obj=getObject(2100,29,32)
				if(obj==340) then
					setObject(2100,29,32,360)
					setObject(2100,30,32,361)
					player:sendMinitext("Opened.")
					return
				elseif(obj==360) then
					setObject(2100,29,32,340)
					setObject(2100,30,32,341)
					player:sendMinitext("Closed.")
					return
				end
                	else
                     		player:sendMinitext("You are not a carnage host.")
                	end
		end
	end

}
hid21003033 = {
	open=function(player)
		if(player.side==0) then
    	        	if(player.registry["carnagehost"]>0) then		
                		local obj=getObject(2100,30,32)
				if(obj==341) then
					setObject(2100,29,32,360)
					setObject(2100,30,32,361)
					player:sendMinitext("Opened.")
					return
				elseif(obj==361) then
					setObject(2100,29,32,340)
					setObject(2100,30,32,341)
					player:sendMinitext("Closed.")
					return
				end
                	else
                     		player:sendMinitext("You are not a carnage host.")
                	end
		end
	end

}