back_up_carnages_key = {
	use = function(player)

	if(player.side==0 and player.m==2001 and player.x==2 and player.y==4) then
        	if(player.mapRegistry["d20010203"]==0) then
			player.mapRegistry["d20010203"]=1
			player:sendMinitext("Locked.")
			return
                end
		if(player.mapRegistry["d20010203"]==1) then
			player.mapRegistry["d20010203"]=0
			player:sendMinitext("Unlocked.")
			return
		end
	end
	if(player.side==0 and player.m==2001 and player.x==3 and player.y==4) then
        	if(player.mapRegistry["d20010203"]==0) then
			player.mapRegistry["d20010203"]=1
			player:sendMinitext("Locked.")
			return
                end
		if(player.mapRegistry["d20010203"]==1) then
			player.mapRegistry["d20010203"]=0
			player:sendMinitext("Unlocked.")
			return
		end
	end


 



        end
}