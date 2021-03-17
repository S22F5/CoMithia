octojelly = {
		move = function(mob,target)
		local moved=true
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
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

		local acidspill= {}
		player:playSound(730)
		player:broadcast(player.m,"-As it is crushed, the Octojelly release deadly acid all over the place-")

		if(player.mapRegistry["abyssshield"]==1) then
				player:broadcast(player.m,"-The acid released touches and destroys Abyss' Shield!-")
				player.mapRegistry["abyssshield"]=0
		end

		for x=-25,25 do
			for y=-25,25 do
				acidspill=player:getObjectsInCell(player.m,player.x+x,player.y+y,BL_PC)
				if(#acidspill>0) then
					for z=1,#acidspill do
						if(acidspill[z].m==mob.m and acidspill[z].state~=1) then
							acidspill[z]:sendAnimation(32)
							acidspill[z].attacker=mob.ID
							acidspill[z]:removeHealth(acidspill[z].maxHealth/2)
						end
					end
				end
			end
		end
				



	end
	
}
