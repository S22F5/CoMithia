sturdy_woodcutting_axe = {
	on_swing = function(player)
		local x=0
		local l=0
		local f= {}
		local mplayer=player.m
		local xplayer=player.x
		local yplayer=player.y
		if(player.registry["woodcutter"]>25) then l=1 end
		if(player.registry["woodcutter"]>220) then l=2 end
		if(player.registry["woodcutter"]>840) then l=3 end
		if(player.registry["woodcutter"]>2200) then l=4 end
		if(player.registry["woodcutter"]>18000) then l=5 end
		if(player.registry["woodcutter"]>124000) then l=6 end
		if(player.registry["woodcutter"]>400000) then l=7 end
		if(player.registry["woodcutter"]>680000) then l=8 end

		if(player.side==0) then yplayer=yplayer-1 end
		if(player.side==1) then xplayer=xplayer+1 end
		if(player.side==2) then yplayer=yplayer+1 end
		if(player.side==3) then xplayer=xplayer-1 end


		x=math.random(9-l,10)
		l=2000000000/x

			f=player:getObjectsInCell(mplayer,xplayer,yplayer,BL_MOB)
			if(#f>0) then
				if(f[1].name=="Ash tree") then
					f[1]:removeHealth(l)
				end
				if(f[1].name=="Tier 1 Rare tree") then
					if(player.registry["woodcutter"]>=220) then
						f[1]:removeHealth(l)
					else
						player:sendMinitext("You are not experienced enough to cut Tier1 rare Trees.")
					end
				end
				if(f[1].name=="Cedar tree") then
					if(player.registry["woodcutter"]>=2200) then
						f[1]:removeHealth(l)
					else
						player:sendMinitext("You are not experienced enough to cut Cedar trees.")
					end
				end
				if(f[1].name=="Oak tree") then
						player:sendMinitext("Your woodcutting axe isn't good enough to cut trees of that quality.")
				end
			end
	end
}