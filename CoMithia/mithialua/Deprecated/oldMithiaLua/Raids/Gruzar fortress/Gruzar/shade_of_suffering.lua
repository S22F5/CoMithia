shade_of_suffering = {
	move = function(mob,target)
		local moved=true
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
		local ra=math.random(1,20)
		local countsides=0
		local stompdamage=150000
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

		if(mob.mapRegistry["sufferingengage"]<=os.time() and mob.mapRegistry["sufferingengagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				mob.mapRegistry["sufferingengage"]=os.time()
				mob.mapRegistry["sufferingengagetrigger"]=1
		end
		if(os.time()<mob.mapRegistry["sufferingengage"]+5 and os.time()>=mob.mapRegistry["sufferingengage"]) then
				return
		end
		if(os.time()>=target.mapRegistry["shadesufferingbomb"] and os.time()>=target.mapRegistry["shadesufferingengage"]+10) then
			local find={}
			local ptable = {}
			for x=-10,10 do
				for y=-10,10 do
					find=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
					if(#find>0) then
						for z=1,#find do
							if(find[z].state~=1) then
								table.insert(ptable,""..find[z].ID.."")
							end
						end
					end
				end
			end
			if(#ptable)>0 then
				local count=0
				local ra=math.random(1,#ptable)
				while Player(ptable[ra]).state==1 or Player(ptable[ra]).ID==target.mapRegistry["bomblasthit"] do
					ra=math.random(1,#ptable)
					count=count+1
					if(count==5) then
						break
					end
				end
				mob:sendAction(1,35)
				target:broadcast(mob.m,""..Player(ptable[ra]).name.." has the bomb!!")
				Player(ptable[ra]):setDuration("bomb_spellshade",14000)
				target.mapRegistry["shadesufferingbomb"]=os.time()+30
				target.mapRegistry["bomblasthit"]=Player(ptable[ra]).ID
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
		mob.mapRegistry["sufferingengage"]=0
		mob.mapRegistry["sufferingengagetrigger"]=0
		mob.mapRegistry["shadesufferingbomb"]=0


	end
	
}
