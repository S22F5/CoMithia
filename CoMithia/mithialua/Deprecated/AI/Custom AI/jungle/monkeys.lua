monkey = {
	move = function(mob,target)
		local moved=true
		if(mob.paralyzed) then
			return
            	end
		if(mob.sleep>0) then
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
		local gemrng=math.random(1,3)

		if(rng<=15) then
			if(gemrng==1) then
				mob:dropItem("amethyst",1,player.ID)
			elseif(gemrng==2) then
				mob:dropItem("chrysocolla",1,player.ID)
			elseif(gemrng==3) then
				mob:dropItem("tigers_eye",1,player.ID)
			end
		end
	end
	
}









monkey2 = {
	move = function(mob,target)
		local moved=true
		if(mob.paralyzed) then
			return
            	end
		if(mob.sleep>0) then
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
		local gemrng=math.random(1,3)

		if(rng<=15) then
			if(gemrng==1) then
				mob:dropItem("amethyst",1,player.ID)
			elseif(gemrng==2) then
				mob:dropItem("chrysocolla",1,player.ID)
			elseif(gemrng==3) then
				mob:dropItem("tigers_eye",1,player.ID)
			end
		end
	end
	
}





monkey3 = {
	move = function(mob,target)
		local moved=true
		if(mob.paralyzed) then
			return
            	end
		if(mob.sleep>0) then
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
		local gemrng=math.random(1,3)

		if(rng<=15) then
			if(gemrng==1) then
				mob:dropItem("amethyst",1,player.ID)
			elseif(gemrng==2) then
				mob:dropItem("chrysocolla",1,player.ID)
			elseif(gemrng==3) then
				mob:dropItem("tigers_eye",1,player.ID)
			end
		end
	end
	
}

elite_monkey = {
	move = function(mob,target)
		local moved=true

	
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
		local gemrng=math.random(1,3)
		local countrng=math.random(1,5)

		if(rng<=50) then
			if(gemrng==1) then
				mob:dropItem("amethyst",countrng,player.ID)
			elseif(gemrng==2) then
				mob:dropItem("chrysocolla",countrng,player.ID)
			elseif(gemrng==3) then
				mob:dropItem("tigers_eye",countrng,player.ID)
			end
		end
	end
	
}
