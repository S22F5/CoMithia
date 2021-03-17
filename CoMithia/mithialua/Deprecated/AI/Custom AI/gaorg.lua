gaorg = {
	move = function(mob,target)
		local moved=true
		local c={}
		local e = {}
		local cho
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
		local ra=math.random(1,5)
		local count=0
	
	

		if(mob.side==0) then ymob=ymob-1 end
		if(mob.side==1) then xmob=xmob+1 end
		if(mob.side==2) then ymob=ymob+1 end
		if(mob.side==3) then xmob=xmob-1 end

		if(ra==1 and target.state~=1 and os.time()>=target.mapRegistry["gaorgattack"]+4) then
				e=target:getObjectsInCell(mmob,xmob,ymob,BL_PC)
				if(#e>0) then
					for a=1,#e do
					if(e[a].name==target.name) then
						e[1]:addHealth(-2500)
						e[1]:sendAnimation(60)
						e[1]:playSound(68)
						target.mapRegistry["gaorgattack"]=os.time()
					end
					end
				end
		end

		e=target:getObjectsInCell(mmob,xmob,ymob,BL_PC)
		if(ra==1 and target.state~=1) then
			if(#e>0) then
				if(e[1].name~=target.name and os.time()>=target.mapRegistry["gaorgattack"]+4) then
					if(math.random(1,10)==10) then
						mob:talk(0,"Gaorg: Trying to get smart with me?! Let's see about that!")
					end
					target:addHealth(-3000)
					target:sendAnimation(60)
					target:playSound(68)
					target.mapRegistry["gaorgattack"]=os.time()
				end
			else
				if(os.time()>=target.mapRegistry["gaorgattack"]+4) then
				if(math.random(1,10)>=10) then
					mob:talk(0,"Gaorg: I won't run forever, I'll just kill you.")
				end
					target:addHealth(-3000)
					target:sendAnimation(60)
					target:playSound(68)
					target.mapRegistry["gaorgattack"]=os.time()
				end
			end
		end	
		
		if(mob.health<=127500 and target.mapRegistry["gaorghelp"]==0) then
			if(target.blType==BL_PC) then
				for x=-20,20 do
					for y=-20,20 do
						c=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_MOB)
						if(#c>0) then
							for z=1,#c do
								if(c[z].name=="Arhagar") then
									mob:talk(0,"Gaorg: I'm in danger! Help me Brother!")
									target.mapRegistry["gaorghelp"]=1
								end
							end
						end
					end
				end
			end
		elseif(mob.health<=127500 and target.mapRegistry["gaorghelp"]==1) then
			if(target.blType==BL_PC) then
				for x=-20,20 do
					for y=-20,20 do
						c=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_MOB)
						if(#c>0) then
							for z=1,#c do
								if(c[z].name=="Arhagar") then
									if(c[z].health>134000) then
										c[z]:talk(0,"Arhagar: I wouldn't let them harm you!")
										mob:addHealth(1000000)
										target:playSound(25)
										mob:sendAnimation(18)
										target.mapRegistry["gaorghelp"]=0
										target.mapRegistry["gaorgelse"]=0
									else
										if(target.mapRegistry["gaorgelse"]==0) then
											c[z]:talk(0,"Arhagar: I'm sorry Brother, but I'm in a little bit of trouble myself here!")
											target.mapRegistry["gaorgelse"]=1
										end
									end
					
								end
							end
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

	end,
	on_death=function(mob,player)

		local r=math.random(1,100)
		local s=math.random(1,100)
		local d=math.random(1,4)
		local gold=math.random(1000,1500)
	
		player.mapRegistry["gaorghelp"]=0
		player.mapRegistry["gaorgelse"]=0

		if(r<=45) then
			mob:dropItem("gaorgs_blade",1)
		elseif(r>45 and r<=50) then
			mob:dropItem("recipe_pirate_buckler",1)
		elseif(r>50 and r<=60) then
			if(d==1) then
				mob:dropItem("recipe_impenetrable_armor",1)
			elseif(d==2) then
				mob:dropItem("recipe_impenetrable_armor_dress",1)
			elseif(d==3) then
				mob:dropItem("recipe_impenetrable_platemail",1)
			elseif(d==4) then
				mob:dropItem("recipe_impenetrable_plate_dress",1)
			end
		else
			mob:dropItem(0,gold)
		end
		
		if(s<=75) then
			mob:dropItem("burning_rum",1)
		end
		local item
		local invcheck=0
		local firstpiece=mob:getObjectsInArea(BL_PC)
			if(#firstpiece>0) then
				for z=1,#firstpiece do
					if(firstpiece[z].registry["gruzaraccessquest"]==1 and firstpiece[z].registry["runefirstpiecedrop"]==0) then
						for x=0,25 do
							item=firstpiece[z]:getInventoryItem(x)
							if(item==nil) then
								invcheck=invcheck+1
							end
						end
						if(invcheck>0) then
							firstpiece[z]:addItem("rune_first_piece",1)
							firstpiece[z]:sendMinitext("You defeat Gaorg and retrieve his Broken rune part!")
							firstpiece[z].registry["runefirstpiecedrop"]=1
						else
							firstpiece[z]:sendMinitext("You try to grab Gaorg's Broken rune part but have no room in your inventory!")
						end
					end
				end
			end
							
							

	end
}
