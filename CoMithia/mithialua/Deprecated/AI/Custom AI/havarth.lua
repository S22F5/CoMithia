havarth = {
	move = function(mob,target)
		local r=math.random(1,200)
			if(r==53) then
				mob:talk(0,"Havarth: Ah! We are the true defenders of Mithia, " .. target.name)
			end
		local moved=true
		if(mob.paralyzed) then
               return
            end
		if(mob.sleep ~= 0.0) then
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
	local g=math.random(1,3)

	if(g==1) then
		mob.x=11
		mob.y=17
	end
	if(g==2) then
		mob.x=11
		mob.y=17
	end
	if(g==3) then
		mob.x=11
		mob.y=17
	end

	end,

	on_death=function(mob,player)
		local c=math.random(1,100)
		local d=math.random(1,3)
		local e=math.random(2,5)
		local f=math.random(1,9)
		
		if(c>=1 and c<=20) then
			mob:dropItem(195,1)
		elseif(c>20 and c<=40) then
			mob:dropItem(197,1)
		elseif(c>40 and c<=45) then
			mob:dropItem(17,e)
		elseif(c>45 and c<=75) then
			mob:dropItem(66,d)
		elseif(c>75 and c<=85) then
			if(f==1) then
				mob:dropItem("recipe_sturdy_armor",1)
			elseif(f==2) then
				mob:dropItem("recipe_sturdy_armor_dress",1)
			elseif(f==3) then
				mob:dropItem("recipe_sturdy_platemail",1)
			elseif(f==4) then
				mob:dropItem("recipe_sturdy_plate_dress",1)
			elseif(f==5) then
				mob:dropItem("recipe_sturdy_mantle",1)
			elseif(f==6) then
				mob:dropItem("recipe_sturdy_drapery",1)
			elseif(f==7) then
				mob:dropItem("recipe_sturdy_clothes",1)
			elseif(f==8) then
				mob:dropItem("recipe_sturdy_skirt",1)
			elseif(f==9) then
				mob:dropItem("recipe_amethyst_ring",1)
			end
		else
			mob:dropItem(0,100)
		end
	end


	
}
