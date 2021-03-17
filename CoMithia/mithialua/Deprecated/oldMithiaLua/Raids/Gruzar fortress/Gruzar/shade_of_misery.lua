shade_of_misery = {
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

		if(mob.mapRegistry["miseryengage"]<=os.time() and mob.mapRegistry["miseryengagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				mob.mapRegistry["miseryengage"]=os.time()
				mob.mapRegistry["miseryengagetrigger"]=1
		end
		if(os.time()<mob.mapRegistry["miseryengage"]+5 and os.time()>=mob.mapRegistry["miseryengage"]) then
				return
		end
		if(os.time()>=target.mapRegistry["miseryengage"]+15 and os.time()>=mob.mapRegistry["miserysummon"]+20) then
				target.mapRegistry["miserysummon"]=os.time()
				local check=mob:getObjectsInArea(BL_MOB)
				local checkplasma=0
				if(#check>0) then
					for z=1,#check do
						if(check[z].name=="Plasma ball") then
							checkplasma=checkplasma+1
						end
					end
				end
				if(checkplasma==0) then	
					local aoe=mob:getObjectsInArea(BL_PC)
					local xmin=0
					local xmax=0
					local ymin=0
					local ymax=0
					if(#aoe>0) then
						xmin=aoe[1].x
						xmax=aoe[1].x
						ymin=aoe[1].y
						ymax=aoe[1].y
						for z=1,#aoe do
							if(aoe[z].x>xmax) then
								xmax=aoe[z].x
							end
							if(aoe[z].x<xmin) then
								xmin=aoe[z].x
							end
							if(aoe[z].y>ymax) then
								ymax=aoe[z].y
							end
							if(aoe[z].y<ymin) then
								ymin=aoe[z].y
							end
						end
					end
						destx=math.random(xmin,xmax)
						desty=math.random(ymin,ymax)
						mob:spawn(103,destx,desty,1)
				end
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
		mob.mapRegistry["miseryengage"]=0
		mob.mapRegistry["miseryengagetrigger"]=0
	end
	
}
