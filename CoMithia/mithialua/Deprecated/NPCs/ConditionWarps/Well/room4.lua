hid360307 = {
	click=function(player)
		local r
		r=math.random(1,2)		

		if(r==1) then
			player:warp(35,3,3)
			return
		end
		if(r==2) then
			player:warp(35,11,3)
			return
		end
	end
}