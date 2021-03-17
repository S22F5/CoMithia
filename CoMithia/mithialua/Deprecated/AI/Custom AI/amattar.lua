amattar = {
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
			if(target~=nil) then
			mobAIbasic.move_hit(mob,target)
			end
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
	local d=math.random(1,9)
	local c=math.random(1,100)
		if(c<=80) then
			mob:dropItem("tainted_leaf",1)
		elseif(c>80 and c<=85) then
			if(d==1) then
				mob:dropItem("recipe_strong_armor",1)
			elseif(d==2) then
				mob:dropItem("recipe_strong_armor_dress",1)
			elseif(d==3) then
				mob:dropItem("recipe_strong_platemail",1)
			elseif(d==4) then
				mob:dropItem("recipe_strong_plate_dress",1)
			elseif(d==5) then
				mob:dropItem("recipe_strong_mantle",1)
			elseif(d==6) then
				mob:dropItem("recipe_strong_drapery",1)
			elseif(d==7) then
				mob:dropItem("recipe_strong_clothes",1)
			elseif(d==8) then
				mob:dropItem("recipe_strong_skirt",1)
			elseif(d==9) then
				mob:dropItem("recipe_amethyst_necklace",1)
			end
		end

	end


	
}
