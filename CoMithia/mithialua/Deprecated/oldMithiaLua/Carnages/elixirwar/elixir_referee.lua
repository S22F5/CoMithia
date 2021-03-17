elixir_referee = {
	move = function(mob,target)
		local check={}
		local xmin
		local ymin
		local xmax
		local ymax

		local xtop
		local ytop
		local xbottom
		local ybottom

		local redcarpetxmin
		local redcarpetxmax
		local redcarpetymin
		local redcarpetymax

		local bluecarpetxmin
		local bluecarpetxmax
		local bluecarpetymin
		local bluecarpetymax

		local leftx
		local rightx
		local redymin
		local redymax
		local blueymin
		local blueymax

		if(mob.m==2081) then
			

			xmin=2
			ymin=10
			xmax=36
			ymax=44

			xtop=math.random(3,35)
			ytop=math.random(2,5)

			xbottom=math.random(3,35)
			ybottom=math.random(49,52)

			redcarpetxmin=3
			redcarpetxmax=7
			redcarpetymin=11
			redcarpetymax=15

			bluecarpetxmin=31
			bluecarpetxmax=35
			bluecarpetymin=39
			bluecarpetymax=43

			leftx=2
			rightx=36

			redymin=2
			redymax=5

			blueymin=49
			blueymax=52

		
		end





		for x=xmin,xmax do
			for y=ymin,ymax do
				check=mob:getObjectsInCell(mob.m,x,y,BL_PC)
				if(#check>0) then

					for z=1,#check do

						if(check[z].armorColor~=check[z].registry["elixircolor"] and check[z].armorColor~=15 and (check[z].x~=check[z].registry["elixirx"] or check[z].y~=check[z].registry["elixiry"])) then
							check[z]:sendMinitext("You've been slain.")
							--send to sidelines
							if(check[z].registry["elixircolor"]==63) then
								check[z]:warp(mob.m,xtop,ytop)
								check[z].armorColor=63
								check[z].registry["elixirarrowsleft"]=0
								check[z]:sendStatus()
								check[z]:updateState()
								if(Player(check[z].registry["elixirkiller"])~=nil) then
									check[z]:broadcast(check[z].m,"-"..check[z].name.." has been slain by "..Player(check[z].registry["elixirkiller"]).name..".")
								else
									check[z]:broadcast(check[z].m,"-"..check[z].name.." has been slain.")
								end
							elseif(check[z].registry["elixircolor"]==65) then
								check[z]:warp(mob.m,xbottom,ybottom)
								check[z].armorColor=65
								check[z].registry["elixirarrowsleft"]=0
								check[z]:sendStatus()
								check[z]:updateState()
								if(Player(check[z].registry["elixirkiller"])~=nil) then
									check[z]:broadcast(check[z].m,"-"..check[z].name.." has been slain by "..Player(check[z].registry["elixirkiller"]).name..".")
								else
									check[z]:broadcast(check[z].m,"-"..check[z].name.." has been slain.")
								end
							end
							check[z]:removeItem("elixir_trophy",1)
						end
					end
				end
			end
		end

		for x=redcarpetxmin,redcarpetxmax do
			for y=redcarpetymin,redcarpetymax do
				check=mob:getObjectsInCell(mob.m,x,y,BL_PC)
				if(#check>0) then
					for z=1,#check do
						if(check[z].registry["elixircolor"]==65) then
							if(check[z]:hasItem("elixir_trophy",1)~=true) then
								if(check[z]:hasSpace("elixir_trophy",1)) then
									check[z]:addItem("elixir_trophy",1)
								end
							end
							
					         end
					end
				end
			end
		end

		for x=bluecarpetxmin,bluecarpetxmax do
			for y=bluecarpetymin,bluecarpetymax do
				check=mob:getObjectsInCell(mob.m,x,y,BL_PC)
				if(#check>0) then
					for z=1,#check do
						if(check[z].registry["elixircolor"]==63) then
							if(check[z]:hasItem("elixir_trophy",1)~=true) then
								if(check[z]:hasSpace("elixir_trophy",1)) then
									check[z]:addItem("elixir_trophy",1)
								end
							end
							
					         end
					end
				end
			end
		end

		for y=redymin,redymax do
			local check=mob:getObjectsInCell(mob.m,leftx,y,BL_PC)
			if(#check>0) then
				for z=1,#check do
					if(check[z].registry["elixircolor"]==63) then
						check[z]:removeItem("elixir_trophy",1)
						check[z].armorColor=63
						check[z].registry["elixirarrowsleft"]=36
						check[z]:warp(mob.m,math.random(redcarpetxmin,redcarpetxmax),math.random(redcarpetymin,redcarpetymax))
						check[z]:sendMinitext("You receive a quiver of 36 arrows!")
						check[z]:sendMinitext("You are ready to fight!")
						check[z]:updateState()
					end
				end
			end
		end

		for y=redymin,redymax do
			local check=mob:getObjectsInCell(mob.m,rightx,y,BL_PC)
			if(#check>0) then
				for z=1,#check do
					if(check[z].registry["elixircolor"]==63) then
						check[z]:removeItem("elixir_trophy",1)
						check[z].armorColor=63
						check[z].registry["elixirarrowsleft"]=36
						check[z]:warp(mob.m,math.random(redcarpetxmin,redcarpetxmax),math.random(redcarpetymin,redcarpetymax))
						check[z]:sendMinitext("You receive a quiver of 36 arrows!")
						check[z]:sendMinitext("You are ready to fight!")
						check[z]:updateState()
					end
				end
			end
		end

		for y=blueymin,blueymax do
			local check=mob:getObjectsInCell(mob.m,leftx,y,BL_PC)
			if(#check>0) then
				for z=1,#check do
					if(check[z].registry["elixircolor"]==65) then
						check[z]:removeItem("elixir_trophy",1)
						check[z].armorColor=65
						check[z].registry["elixirarrowsleft"]=36
						check[z]:warp(mob.m,math.random(bluecarpetxmin,bluecarpetxmax),math.random(bluecarpetymin,bluecarpetymax))
						check[z]:sendMinitext("You receive a quiver of 36 arrows!")
						check[z]:sendMinitext("You are ready to fight!")
						check[z]:updateState()
					end
				end
			end
		end

		for y=blueymin,blueymax do
			local check=mob:getObjectsInCell(mob.m,rightx,y,BL_PC)
			if(#check>0) then
				for z=1,#check do
					if(check[z].registry["elixircolor"]==65) then
						check[z]:removeItem("elixir_trophy",1)
						check[z].armorColor=65
						check[z].registry["elixirarrowsleft"]=36
						check[z]:warp(mob.m,math.random(bluecarpetxmin,bluecarpetxmax),math.random(bluecarpetymin,bluecarpetymax))
						check[z]:sendMinitext("You receive a quiver of 36 arrows!")
						check[z]:sendMinitext("You are ready to fight!")
						check[z]:updateState()
					end
				end
			end
		end
		
			



	end
		
	
}
