angered_spirit = {
	move = function(mob,target)
		local count=math.random(1,5000)
		if(count==1) then
			mob:talk(0,"Angered spirit: I serve a new master now...")
		elseif(count==2) then
			mob:talk(0,"Angered spirit: Gruzar will not tolerate your presence, run away while you still can...")
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
	end
	
}
