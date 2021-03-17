draazok = {
	move = function(mob,target)
		local r=math.random(1,200)
			if(r==53) then
				mob:talk(0,"Draazok: Gnnnrr!")
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
	local g=math.random(17,24)
	local h=math.random(10,14)
	if(mob.m==26) then

	mob.x=g
	mob.y=h
	end
	end,

	on_death=function(mob,player)
	local d=math.random(1,8)
	local c=math.random(1,100)
		mob:dropItem(0,50)
		if(c<=80) then
			mob:dropItem(13,1)
		elseif(c>80 and c<=85) then
			if(d==1) then
				mob:dropItem(247,1)
			elseif(d==2) then
				mob:dropItem(305,1)
			elseif(d==3) then
				mob:dropItem(278,1)
			elseif(d==4) then
				mob:dropItem(323,1)
			elseif(d==5) then
				mob:dropItem(267,1)
			elseif(d==6) then
				mob:dropItem(288,1)
			elseif(d==7) then
				mob:dropItem(161,1)
			elseif(d==8) then
				mob:dropItem(315,1)
			end
		end

	end


	
}
