power_candy_cane = {
	use = function(player)
		if(player.state==1) then
			player:sendMinitext("Spirits can't do that")
			return
		end
		
		local a= {}
		for x=-10,10 do
			for y=-10,10 do
				a=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_MOB)
				if(#a>0) then
					if(a[1].paralyzed==false) then
						a[1].paralyzed=true
						a[1]:setDuration("stop",5000)
						a[1]:sendAnimation(191)
					end
					player:playSound(735)
					player:sendAction(6,35)
				end
			end
		end

		player:removeItem("power_candy_cane",1)	
		player:sendMinitext("The candy cane's power stuns your enemies!")

	end
}