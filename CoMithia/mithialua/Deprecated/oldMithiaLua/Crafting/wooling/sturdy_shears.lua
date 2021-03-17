sturdy_shears = {
	on_swing = function(player)
		local x=0
		local l=0
		local f= {}
		local mplayer=player.m
		local xplayer=player.x
		local yplayer=player.y
		if(player.registry["shepherd"]>25) then l=1 end
		if(player.registry["shepherd"]>220) then l=2 end
		if(player.registry["shepherd"]>840) then l=3 end
		if(player.registry["shepherd"]>2200) then l=4 end
		if(player.registry["shepherd"]>18000) then l=5 end
		if(player.registry["shepherd"]>124000) then l=6 end
		if(player.registry["shepherd"]>400000) then l=7 end
		if(player.registry["shepherd"]>680000) then l=8 end

		if(player.side==0) then yplayer=yplayer-1 end
		if(player.side==1) then xplayer=xplayer+1 end
		if(player.side==2) then yplayer=yplayer+1 end
		if(player.side==3) then xplayer=xplayer-1 end


		x=math.random(9-l,10)
		l=2000000000/x

			f=player:getObjectsInCell(mplayer,xplayer,yplayer,BL_MOB)
			if(#f>0) then

				if(f[1].state~=MOB_HIT and f[1].state~=MOB_DEAD) then
					f[1].state=MOB_HIT
				end
				f[1].attacker=player.ID
				f[1].target=player.ID


				if(f[1].name=="Sheep") then
					f[1]:removeHealth(l)
				end
				if(f[1].name=="Romney sheep") then
					if(player.registry["shepherd"]>=220) then
						f[1]:removeHealth(l)
					else
						player:sendMinitext("You are not experienced enough to shear a Romney sheep.")
					end
				end
				if(f[1].name=="Perendale sheep") then
					if(player.registry["shepherd"]>=2200) then
						f[1]:removeHealth(l)
					else
						player:sendMinitext("You are not experienced enough to shear a Perendale sheep.")
					end
				end
				if(f[1].name=="Shetland sheep") then
					if(player.registry["shepherd"]>=6400) then
						f[1]:removeHealth(l)
					else
						player:sendMinitext("You are not experienced enough to shear a Shetland sheep.")
					end
				end
				if(f[1].name=="Merino sheep") then
					player:sendMinitext("Your shears are not good enough to shear a Merino sheep.")
				end
				if(f[1].name=="Rambouillet sheep") then
					player:sendMinitext("Your shears are not good enough to shear a Rambouillet sheep.")
				end
			end
	end
}