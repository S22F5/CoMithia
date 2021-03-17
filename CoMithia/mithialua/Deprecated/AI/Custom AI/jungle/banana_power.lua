banana_power = {

		while_cast=function(player)
			player.registry["bananapowertick"]=player.registry["bananapowertick"]+1
			if(player.registry["bananapowertick"]>5) then
				local monkey=player:getObjectsInArea(BL_MOB)
					if(#monkey>0) then
						for z=1,#monkey do
							if(monkey[z].name=="Monkey lord") then
								monkey[z]:addHealth(monkey[z].maxHealth*0.02)
								monkey[z]:sendAnimation(5)
								player:talk(0,"Must... heal... monkey...")
								player:sendAction(6,40)
							end
						end
					end
			end
		end,

		uncast=function(player,target)
			player.registry["bananapowertick"]=0
		end

     
}



