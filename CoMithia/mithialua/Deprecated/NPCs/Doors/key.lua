key = {
	use = function(player)
	if(player.side==0 and player.m==17 and player.x==115 and player.y==121) then
        	if(player.mapRegistry["d17116121"]==0) then
			player.mapRegistry["d17116121"]=1
			player:sendMinitext("Locked.")
			return
                end
		if(player.mapRegistry["d17116121"]==1) then
			player.mapRegistry["d17116121"]=0
			player:sendMinitext("Unlocked.")
			return
		end
	elseif(player.side==0 and player.m==17 and player.x==116 and player.y==121) then
        	if(player.mapRegistry["d17116121"]==0) then
			player.mapRegistry["d17116121"]=1
			player:sendMinitext("Locked.")
			return
                end
		if(player.mapRegistry["d17116121"]==1) then
			player.mapRegistry["d17116121"]=0
			player:sendMinitext("Unlocked.")
			return
		end
  	end
        end
}