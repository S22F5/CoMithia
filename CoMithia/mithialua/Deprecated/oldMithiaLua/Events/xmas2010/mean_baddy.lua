mean_baddy = {
	move = function(mob,target)
		local moved=true

		local check=0
		if(math.random(1,25)==1) then
			mob:sendAction(2,50)
			mob:addHealth(10000)
			mob:talk(0,"Mean baddy: Eeeeeek!")
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
		local rng=math.random(1,100)

		if(rng<=20) then
			mob:dropItem("xmas2010_soulfragment",1)
		end
	end
	
}
