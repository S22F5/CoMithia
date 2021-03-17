snake_of_midgard = {
	move = function(mob,target)
		local moved=true
		local e={}
		local f={}
		local m=mob.m
		local x=mob.x
		local y=mob.y
		local ran=0
		local cho
		local cho1
		local cho2
		local ma=0
		local mb=0
		local sl=math.random(1,3)
		local ra=math.random(1,40)
		local ra2=math.random(1,20)
		if(mob.sleep>0 and sl==3) then
		   	return
		end	

		if(target.group~=nil) then	
			if(target.blType==BL_PC and #target.group>1 and ra==1) then
				for cho=1,#target.group do
					if(Player(target.group[cho]).state~=1 and Player(target.group[cho]).m==target.m) then
						freeze_time.cast(mob,Player(target.group[cho]))
					end
				end
			end
                else
			if(ra==1 and target.state~=1) then
				freeze_time.cast(mob,target)
			end				
		end
		if(target.group~=nil) then	
			if(target.blType==BL_PC and #target.group>1 and ra==40) then
				mob:talk(0,"Let me tassssste you")
				for cho1=1,#target.group do
					if(Player(target.group[cho1]).state~=1 and Player(target.group[cho1]).m==target.m) then
						energy_drain.cast(mob,Player(target.group[cho1]))
					end
				end
			end
                else
			if(target.state~=1 and ra==40) then
				mob:talk(0,"Let me tassssste you")
				energy_drain.cast(mob,target)
			end				
		end

		if(mob.side==0) then y=y-1 end
		if(mob.side==1) then x=x+1 end
		if(mob.side==2) then y=y+1 end
		if(mob.side==3) then x=x-1 end

		if(ra2==1) then
				e=target:getObjectsInCell(m,x,y,BL_PC)
				if(#e>0) then
					if(e[1].name==target.name) then
						ma=e[1].maxHealth/2
						e[1]:sendMinitext("You feel the Wrath of Snake!")
						e[1]:addHealth(-ma)
						e[1]:sendAnimation(93)
						e[1]:playSound(508)
					end
				end
		end
		
		f=target:getObjectsInCell(m,x,y,BL_PC)
			if(#f>0) then
				if(not f[1].name==target.name) then
					if(f[1].mapRegistry["midgardsolo"]==7) then
						f[1].mapRegistry["midgardsolo"]=0
					end
					f[1].mapRegistry["midgardsolo"]=f[1].mapRegistry["midgardsolo"]+1
					if(f[1].mapRegistry["midgardsolo"]==7) then
						if(target.group~=nil) then					
							cho2=math.random(1,#target.group)
								while(Player(target.group[cho2]).m~=mob.m or Player(target.group[cho2]).state==1) do
									cho2=math.random(1,#target.group)
									ran=ran+1
									if(ran>100) then break end
								end
							mob:talk(0,"You can't flee me, "..Player(target.group[cho2]).name.." !")
							mb=Player(target.group[cho2]).maxHealth/3
							Player(target.group[cho2]):sendMinitext("The Snake of Midgard attacks you from distance!")
							Player(target.group[cho2]):addHealth(-mb)
							Player(target.group[cho2]):sendAnimation(9)
							Player(target.group[cho2]):playSound(10)
						else
							if(target.state~=1) then
							mob:talk(0,"You can't flee me, "..target.name.." !")
							mb=target.maxHealth/3
							target:sendMinitext("The Snake of Midgard attacks you from distance!")
							target:addHealth(-mb)
							target:sendAnimation(9)
							target:playSound(10)
							end					
						end
					end
				end

			else
				if(target.blType==BL_PC and target.state~=1) then
					if(target.mapRegistry["midgardsolo"]==5) then
						target.mapRegistry["midgardsolo"]=0
					end
					target.mapRegistry["midgardsolo"]=target.mapRegistry["midgardsolo"]+1
					if(target.mapRegistry["midgardsolo"]==5) then
						if(target.group~=nil) then					
							cho2=math.random(1,#target.group)
								while(Player(target.group[cho2]).m~=mob.m or Player(target.group[cho2]).state==1) do
									cho2=math.random(1,#target.group)
									ran=ran+1
									if(ran>100) then break end
								end
							mob:talk(0,"You can't flee me, "..Player(target.group[cho2]).name.." !")
							mb=Player(target.group[cho2]).maxHealth/3
							Player(target.group[cho2]):sendMinitext("The Snake of Midgard attacks you from distance!")
							Player(target.group[cho2]):addHealth(-mb)
							Player(target.group[cho2]):sendAnimation(9)
							Player(target.group[cho2]):playSound(10)
						else
							if(target.state~=1) then
							mob:talk(0,"You can't flee me, "..target.name.." !")
							mb=target.maxHealth/3
							target:sendMinitext("The Snake of Midgard attacks you from distance!")
							target:addHealth(-mb)
							target:sendAnimation(9)
							target:playSound(10)
							end					
						end
					end
				end
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
	on_spawn=function(mob)
	local f=math.random(1804,1806)

	if(f==1804) then
		mob.m=1804
		mob.x=17
		mob.y=2
	elseif(f==1805) then
		mob.m=1805
		mob.x=2
		mob.y=2
	elseif(f==1806) then
		mob.m=1806
		mob.x=17
		mob.y=4
	end


	end,
	on_death=function(mob,player)
	local e=math.random(1,100)
	local d=math.random(1,9)
	local c=math.random(1,100)
	local gold=math.random(1000,1500)
		mob:talk(0,"Avenge your Master, my snakes!")
		player:broadcast(mob.m,"-As the Snake of Midgard perishes, his minions come to his rescue!-")
		mob:spawn(84,mob.x,mob.y,1)
		mob:spawn(84,mob.x,mob.y,1)
		mob:spawn(84,mob.x,mob.y,1)
		mob:spawn(84,mob.x,mob.y,1)
		mob:spawn(84,mob.x,mob.y,1)

		mob:spawn(82,mob.x,mob.y,1)
		mob:spawn(82,mob.x,mob.y,1)
		mob:spawn(82,mob.x,mob.y,1)
		mob:spawn(82,mob.x,mob.y,1)
		mob:spawn(82,mob.x,mob.y,1)

		mob:spawn(81,mob.x,mob.y,1)
		mob:spawn(81,mob.x,mob.y,1)
		mob:spawn(81,mob.x,mob.y,1)
		mob:spawn(81,mob.x,mob.y,1)
		mob:spawn(81,mob.x,mob.y,1)

		if(e>0 and e<=10) then
			mob:dropItem(0,gold)
		elseif(e>10 and e<=45)	then
			mob:dropItem("serpents_eye",1)
		elseif(e>45 and e<=95) then
			mob:dropItem("serpents_head",1)
		elseif(e>95 and e<=100) then
			if(d==1) then
				mob:dropItem("recipe_repellent_armor",1)
			elseif(d==2) then
				mob:dropItem("recipe_repellent_armor_dress",1)
			elseif(d==3) then
				mob:dropItem("recipe_repellent_platemail",1)
			elseif(d==4) then
				mob:dropItem("recipe_repellent_plate_dress",1)
			elseif(d==5) then
				mob:dropItem("recipe_repellent_mantle",1)
			elseif(d==6) then
				mob:dropItem("recipe_repellent_drapery",1)
			elseif(d==7) then
				mob:dropItem("recipe_repellent_clothes",1)
			elseif(d==8) then
				mob:dropItem("recipe_repellent_skirt",1)
			elseif(d==9) then
				mob:dropItem("recipe_tigers_eye_necklace",1)
			end
		end
	end
}
