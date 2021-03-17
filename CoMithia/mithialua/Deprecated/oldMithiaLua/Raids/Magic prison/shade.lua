shade = {
	move = function(mob,target)
		local moved=true
		mob.mapRegistry["shade1x"]=0
		mob.mapRegistry["shade1y"]=0
		mob.mapRegistry["shade1time"]=0		
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
		mob.mapRegistry["shade1x"]=mob.x
		mob.mapRegistry["shade1y"]=mob.y
		mob.mapRegistry["shade1time"]=os.time()
	end	
}
shade2 = {
	move = function(mob,target)
		local moved=true
		mob.mapRegistry["shade2x"]=0
		mob.mapRegistry["shade2y"]=0	
		mob.mapRegistry["shade2time"]=0		
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
		mob.mapRegistry["shade2x"]=mob.x
		mob.mapRegistry["shade2y"]=mob.y
		mob.mapRegistry["shade2time"]=os.time()
	end	
}
shade3 = {
	move = function(mob,target)
		local moved=true
		mob.mapRegistry["shade3x"]=0
		mob.mapRegistry["shade3y"]=0
		mob.mapRegistry["shade3time"]=0
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
		mob.mapRegistry["shade3x"]=mob.x
		mob.mapRegistry["shade3y"]=mob.y
		mob.mapRegistry["shade3time"]=os.time()		
	end	
}
shade4 = {
	move = function(mob,target)
		local moved=true
		mob.mapRegistry["shade4x"]=0
		mob.mapRegistry["shade4y"]=0
		mob.mapRegistry["shade4time"]=0
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
		mob.mapRegistry["shade4x"]=mob.x
		mob.mapRegistry["shade4y"]=mob.y
		mob.mapRegistry["shade4time"]=os.time()
	end	
}