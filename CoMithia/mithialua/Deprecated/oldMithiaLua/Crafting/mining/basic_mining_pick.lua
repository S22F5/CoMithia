basic_mining_pick = {
	on_swing = function(player)
		local f={}

		local z=0
		local m=player.m
		local x=player.x
		local y=player.y

		local l=0

		if(player.registry["miner"]>25) then l=1 end
		if(player.registry["miner"]>220) then l=2 end
		if(player.registry["miner"]>840) then l=3 end
		if(player.registry["miner"]>2200) then l=4 end
		if(player.registry["miner"]>18000) then l=5 end
		if(player.registry["miner"]>124000) then l=6 end
		if(player.registry["miner"]>400000) then l=7 end
		if(player.registry["miner"]>680000) then l=8 end

		if(player.side==0) then y=y-1 end
		if(player.side==1) then x=x+1 end
		if(player.side==2) then y=y+1 end
		if(player.side==3) then x=x-1 end


		z=math.random(9-l,10)
		l=2000000000/z


			f=player:getObjectsInCell(m,x,y,BL_MOB)
			if(#f>0) then
				if(f[1].name=="Stone of Empowerment") then
					f[1]:removeHealth(8000)
				end
				if(f[1].name=="Tin vein") then
					f[1]:removeHealth(l)
				end
				if(f[1].name=="Bronze vein") then
					if(player.registry["miner"]>=220) then
						f[1]:removeHealth(l)
					else
						player:sendMinitext("You are not experienced enough to mine Bronze veins.")
					end
				end
				if(f[1].name=="Copper vein") then
					player:sendMinitext("You mining pick isn't good enough to extract ore of that quality.")
				end
				if(f[1].name=="Silver vein") then
					player:sendMinitext("You mining pick isn't good enough to extract ore of that quality.")
				end
				if(f[1].name=="Iron vein") then
					player:sendMinitext("You mining pick isn't good enough to extract ore of that quality.")
				end
				if(f[1].name=="Gold vein") then
					player:sendMinitext("You mining pick isn't good enough to extract ore of that quality.")
				end
			end
	end
}