skeletor = {
	move = function(mob,target)
		local c=math.random(1,15)
		if(c==1) then
				mob:talk(0,"Skeletor: You've been very naughty!")
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
	if(player.registry["xmas2008step"]>=1) then
		local c=math.random(1,50)
		local ra=math.random(1,100)

		if(ra<=10) then
			mob:dropItem("christmas_spirit",1)
		elseif(ra>10 and ra<=30) then
			mob:dropItem("rocket_launcher",1)
		elseif(ra>30 and ra<=40) then
			mob:dropItem("special_candy_cane",1)
		elseif(ra>40 and ra<=50) then
			mob:dropItem("power_candy_cane",1)
		elseif(ra>50 and ra<=60) then
			mob:dropItem("lucky_candy_cane",1)
		elseif(ra>60 and ra<=70) then
			mob:dropItem("yucky_candy_cane",1)
		elseif(ra>70 and ra<=99) then
			mob:dropItem(0,c)
		else
			mob:dropItem("christmas_present",1)
		end
	end
	end
	
}
