shade_of_agony = {
	move = function(mob,target)
		local moved=true
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
		local e= {}
		local f= {}
		local g= {}
		local h= {}
		local check = {}


		e=mob:getObjectsInCell(mmob,xmob+1,ymob,BL_PC)
		f=mob:getObjectsInCell(mmob,xmob,ymob-1,BL_PC)
		g=mob:getObjectsInCell(mmob,xmob-1,ymob,BL_PC)
		h=mob:getObjectsInCell(mmob,xmob,ymob+1,BL_PC)

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

		if(mob.mapRegistry["agonyengage"]<=os.time() and mob.mapRegistry["agonyengagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				mob.mapRegistry["agonyengage"]=os.time()
				mob.mapRegistry["agonyengagetrigger"]=1
		end
		if(os.time()<mob.mapRegistry["agonyengage"]+5 and os.time()>=mob.mapRegistry["agonyengage"]) then
				return
		end

		if(target.mapRegistry["agonyblind"]+15<=os.time()) then
				target.mapRegistry["agonyblind"]=os.time()
				local check=mob:getObjectsInArea(BL_PC)
				if(#check>0) then
					local rand=math.random(1,#check)
					if(check[rand].state~=1) then
						check[rand].blind=1
						check[rand]:setDuration("eye_gouge",4000)
					end
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
		mob.mapRegistry["agonyengage"]=0
		mob.mapRegistry["agonyengagetrigger"]=0

	end
	
}
