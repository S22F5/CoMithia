squirrel = {
	move = function(mob,target)
		local r=math.random(1,20000)
			if(r==53) then
				mob:talk(0,"Squirrel: Squeek")
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
	on_death=function(mob,player)
		local c=math.random(1,100)
		local d=math.random(1,100)
		local e=math.random(0,3)


		if(c<97) then
			if(d<100) then
				if(e~=0) then
				mob:dropItem(5,e)
				end
			else
				mob:dropItem(5,50+e)
			end
		else
			mob:dropItem(6,1)
		end


	end
	
}
