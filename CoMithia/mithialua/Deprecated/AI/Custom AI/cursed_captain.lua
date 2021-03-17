cursed_captain = {
	move = function(mob,target)
		local r=math.random(1,200)
		
			if(r==53) then
				mob:talk(0,"Cursed Captain: Ahoy me hearties!")
			elseif(r==54) then
				mob:talk(0,"Cursed Captain: Shiver me timbers!")
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
	local g=math.random(24,36)
	local h=math.random(6,16)
	if(mob.m==1111) then

	mob.x=g
	mob.y=h
	end
	end,

	on_death=function(mob,player)
		local ra=math.random(1,100)
		local f=math.random(1,9)
		local g=math.random(200,500)
		
		if(ra<=10) then
			mob:dropItem("peg_leg",1)
		elseif(ra>10 and ra<=15) then
			if(f==1) then
				mob:dropItem("recipe_reinforced_armor",1)
			elseif(f==2) then
				mob:dropItem("recipe_reinforced_armor_dress",1)
			elseif(f==3) then
				mob:dropItem("recipe_reinforced_platemail",1)
			elseif(f==4) then
				mob:dropItem("recipe_reinforced_plate_dress",1)
			elseif(f==5) then
				mob:dropItem("recipe_reinforced_mantle",1)
			elseif(f==6) then
				mob:dropItem("recipe_reinforced_drapery",1)
			elseif(f==7) then
				mob:dropItem("recipe_reinforced_clothes",1)
			elseif(f==8) then
				mob:dropItem("recipe_reinforced_skirt",1)
			elseif(f==9) then
				mob:dropItem("recipe_amethyst_trinket",1)
			end
		else
			mob:dropItem(0,g)
		end

	end


	
}
