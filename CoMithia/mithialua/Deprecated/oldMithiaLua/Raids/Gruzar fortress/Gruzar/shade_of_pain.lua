shade_of_pain = {
	move = function(mob,target)
		local moved=true
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
		local ra=math.random(1,20)
		local rand=0
		local check = {}
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

		if(mob.mapRegistry["painengage"]<=os.time() and mob.mapRegistry["painengagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				mob.mapRegistry["painengage"]=os.time()
				mob.mapRegistry["painengagetrigger"]=1
		end
		if(os.time()<mob.mapRegistry["painengage"]+5 and os.time()>=mob.mapRegistry["painengage"]) then
				return
		end
		if(os.time()>=target.mapRegistry["painattack"]) then
			target.mapRegistry["painattack"]=os.time()+4
			local checkplayer = {}
			check=mob:getObjectsInArea(BL_PC)
			if(#check>0) then
				rand=math.random(1,#check)
				for x=-1,1 do
					for y=-1,1 do
						checkplayer=mob:getObjectsInCell(mob.m,check[rand].x+x,check[rand].y+y,BL_PC)
						if(#checkplayer>0) then
							for z=1,#checkplayer do
								if(checkplayer[z].state~=1) then
									checkplayer[z]:sendAnimation(43)
									checkplayer[z].attacker=mob.ID
									checkplayer[z]:removeHealthExtend(5000, 1, 1, 1, 1, 0)
								end
							end
						end
					end
				end
			end
			target:playSound(116)
		end
		target.attacker=mob.ID
		target:removeHealthExtend(5000, 1, 1, 1, 1, 0)
						
								
					
						






		
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
		mob.mapRegistry["painwarp"]=0
		mob.mapRegistry["painattack"]=0
		mob.mapRegistry["painengage"]=0
		mob.mapRegistry["painengagetrigger"]=0

	end
	
}
