abyss = {
	move = function(mob,target)
		local moved=true
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y


		local checkplayeralive = {}
		local checkalive=0
		for x=-25,25 do
			for y=-25,25 do
				checkplayeralive=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
				if(#checkplayeralive>0) then
					for z=1,#checkplayeralive do
						if(checkplayeralive[z].state~=1) then
							checkalive=checkalive+1
						end
					end
				end
			end
		end
		if(checkalive==0) then
			mob:addHealth(1000000000)
			for x=-25,25 do
				for y=-25,25 do
					checkplayeralive=target:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_MOB)
					if(#checkplayeralive>0) then
						for z=1,#checkplayeralive do
							if(checkplayeralive[z].name=="Octojelly") then
								checkplayeralive[z].attacker=target.ID
								checkplayeralive[z]:removeHealth(50000)
							end
						end
					end
				end
			end
		end

		local e= {}
		local f= {}
		local g= {}
		local h= {}
		e=target:getObjectsInCell(mmob,xmob+1,ymob,BL_PC)
		f=target:getObjectsInCell(mmob,xmob,ymob-1,BL_PC)
		g=target:getObjectsInCell(mmob,xmob-1,ymob,BL_PC)
		h=target:getObjectsInCell(mmob,xmob,ymob+1,BL_PC)

		if(#e>0) then
			for a=1,#e do
				if(e[a].state==1) then
					e[a]:warp(mob.m,mob.x,mob.y)
				end
			end
		end
		if(#f>0) then
			for a=1,#f do
				if(f[a].state==1) then
					f[a]:warp(mob.m,mob.x,mob.y)
				end
			end
		end
		if(#g>0) then
			for a=1,#g do
				if(g[a].state==1) then
					g[a]:warp(mob.m,mob.x,mob.y)
				end
			end
		end
		if(#h>0) then
			for a=1,#h do
				if(h[a].state==1) then
					h[a]:warp(mob.m,mob.x,mob.y)
				end
			end
		end

		

		if(os.time()>=target.mapRegistry["abyssconvoke"]) then
			target.mapRegistry["abyssconvoke"]=os.time()+60
			target.mapRegistry["abyssconvokecount"]=0
		end
		if(os.time()>=target.mapRegistry["abyssconvoke"]-30 and os.time()<=target.mapRegistry["abyssconvoke"]-5) then
				if(target.mapRegistry["abyssshield"]==1) then
					target:broadcast(mob.m,"-Abyss lowers his shield and calls for help-")
				end
				target.mapRegistry["abyssshield"]=0

				if(target.mapRegistry["abyssconvokecount"]<3) then
					for x=-25,25 do
						for y=-25,25 do
							checkplayeralive=target:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_MOB)
							if(#checkplayeralive>0) then
								for z=1,#checkplayeralive do
									if(checkplayeralive[z].name=="Octojelly") then
										target.mapRegistry["abyssconvokecount"]=target.mapRegistry["abyssconvokecount"]+1
									end
								end
							end
						end
					end
				end

				if(target.mapRegistry["abyssconvokecount"]<3 and target.m==mob.m) then
					if(target.x==10 and target.y==17) then
						target:spawn(122,13,19,1)
					else
						target:spawn(122,target.x,target.y,1)
					end
				end
		end
		if(os.time()>=target.mapRegistry["abyssconvoke"]-5 and target.mapRegistry["abyssshield"]==0 and os.time()>=target.mapRegistry["abysslastshield"]) then
			target.mapRegistry["abyssshield"]=1
			target.mapRegistry["abyssshielddelay"]=0
			target.mapRegistry["abysslastshield"]=os.time()+20
			mob:sendAnimation(193)
			target:broadcast(mob.m,"-Abyss raises his shield and is about to start regenerating-")
			
		end
		if(target.mapRegistry["abyssshield"]==1) then
				if(target.mapRegistry["abyssshielddelay"]>=2) then
					mob:sendAnimation(250)
					mob:addHealth(15000)
				end
				target.mapRegistry["abyssshielddelay"]=target.mapRegistry["abyssshielddelay"]+1
		end


		if(mob.state ~= MOB_HIT) then
			
			--while moved==true do

			--math.randomseed( os.time() )
				mob.side=math.random(0,3)
				moved=mob:move()
			--end
				
			
		else

			mobAIbasic.move_hit(mob,target)
		
		end
		
		
	end,
	move_hit=function(mob,target)
		
	
		if target then
			
				
				local moved=FindCoords(mob,target,1)
				if(moved) then
					--We are right next to them, so attack!	
					
					mob:attackIT(target,mob.might,mob.might/2)
				end
				-- mob:spawn(1,mob.x+1,mob.y,1,5)	
				
			
		end
		
	end,
	on_death=function(mob,player)
		local ra=math.random(1,100)
		local a=math.random(2500,3000)
		local c=math.random(1,8)
		if(ra<=30) then
			mob:dropItem("tsunami_guard",1)
		elseif(ra>30 and ra<=60) then
			mob:dropItem("abyss_shard",1)
		elseif(ra>60 and ra<=90) then
			mob:dropItem("aqua_stone",1)
		else
			mob:dropItem(0,a)
		end

		local item
		local invcheck=0
		local thirdpiece=mob:getObjectsInArea(BL_PC)
			if(#thirdpiece>0) then
				for z=1,#thirdpiece do
					if(thirdpiece[z].registry["gruzaraccessquest"]==1 and thirdpiece[z].registry["runethirdpiecedrop"]==0) then
						if(player:hasSpace("rune_third_piece",1)==true) then
							thirdpiece[z]:addItem("rune_third_piece",1)
							thirdpiece[z]:sendMinitext("You defeat Abyss and retrieve his Broken rune part!")
							thirdpiece[z].registry["runethirdpiecedrop"]=1
						else
							thirdpiece[z]:sendMinitext("You try to grab Gaorg's Broken rune part but have no room in your inventory!")
						end
					end
				end
			end

	end
	
}
