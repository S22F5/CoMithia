necromancer = {
	move = function(mob,target)
		local xcoord=mob.x
		local ycoord=mob.y
		local m=mob.m
	        local gMember
		local finding = { }
		local cho
		local count=0
		local ra=math.random(1,30)


		if(mob.sleep>0) then
			return
		end
		
		if(ra==30) then
		for x=1,50 do
			for y=1,50 do
				finding=mob:getObjectsInCell(m,x,y,BL_MOB)
				if(#finding>0) then
					for z=1,#finding do
						count=count+1
					end
				end
			end
		end

		if(count<15) then
		mob:talk(0,"Necromancer: Rise from ashes to assist me, my minions!")
		mob:spawn(64,xcoord,ycoord,1)
		mob:spawn(64,xcoord,ycoord,1)
		mob:spawn(64,xcoord,ycoord,1)
		end
		end


		local moved=true
		if(mob.paralyzed) then
                	return
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

	on_spawn=function(mob)
	end,

	on_death=function(mob,player)

	end


	
}
