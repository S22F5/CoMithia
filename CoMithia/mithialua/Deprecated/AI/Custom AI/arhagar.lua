arhagar = {
	move = function(mob,target)
		local moved=true
		local c={}
		local e = {}
		local f = {}
		local g = {}
		local h = {}
		local cho
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
		local ra=math.random(1,20)
		local rb=math.random(1,2)
		local count=0
		local u=0
		local v=0
		local w=0




		e=target:getObjectsInCell(mmob,xmob+1,ymob,BL_PC)
		f=target:getObjectsInCell(mmob,xmob,ymob-1,BL_PC)
		g=target:getObjectsInCell(mmob,xmob-1,ymob,BL_PC)
		h=target:getObjectsInCell(mmob,xmob,ymob+1,BL_PC)

				
		if(rb==1 and target.state~=1 and os.time()>=target.mapRegistry["arhagarattacktwo"]+5) then
				if(#e>0) then
					for a=1,#e do
					if(e[a].state~=1) then
						e[a]:addHealth(-2000)
						e[a]:sendAnimation(149)
						e[a]:playSound(116)
						target.mapRegistry["arhagarattacktwo"]=os.time()
					else
						e[a]:warp(mmob,xmob,ymob)
						if(ra<=5) then
							mob:talk(0,"Arhagar: Fool! Get off my way!")
						end
					end
					end
				end
				if(#f>0) then
					for a=1,#f do
					if(f[a].state~=1) then
						f[a]:addHealth(-2000)
						f[a]:sendAnimation(149)
						f[a]:playSound(116)
						target.mapRegistry["arhagarattacktwo"]=os.time()
					else
						f[a]:warp(mmob,xmob,ymob)
						if(ra>5 and ra<=10) then
							mob:talk(0,"Arhagar: Fool! Get off my way!")
						end
					end
					end
				end
				if(#g>0) then
					for a=1,#g do
					if(g[a].state~=1) then
						g[a]:addHealth(-2000)
						g[a]:sendAnimation(149)
						g[a]:playSound(116)
						target.mapRegistry["arhagarattacktwo"]=os.time()
					else
						g[a]:warp(mmob,xmob,ymob)
						if(ra>10 and ra<=15) then
							mob:talk(0,"Arhagar: Fool! Get off my way!")
						end
					end
					end
				end
				if(#h>0) then
					for a=1,#h do
					if(h[a].state~=1) then
						h[a]:addHealth(-2000)
						h[a]:sendAnimation(149)
						h[a]:playSound(116)
						target.mapRegistry["arhagarattacktwo"]=os.time()
					else
						h[a]:warp(mmob,xmob,ymob)
						if(ra>15) then
							mob:talk(0,"Arhagar: Fool! Get off my way!")
						end
					end
					end
				end
		end

		local checkplayeralive = {}
		local checkalive=0
		for x=-25,25 do
			for y=-25,25 do
				checkplayeralive=target:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
				if(#checkplayeralive>0) then
					for z=1,#checkplayeralive do
						if(checkplayeralive[z].state~=1) then
							checkalive=checkalive+1
						end
					end
				end
			end
		end
		if(checkalive==0) then
			mob:addHealth(1000000000)
		end


		
		if(mob.side==0) then ymob=ymob-1 end
		if(mob.side==1) then xmob=xmob+1 end
		if(mob.side==2) then ymob=ymob+1 end
		if(mob.side==3) then xmob=xmob-1 end


		c=target:getObjectsInCell(mmob,xmob,ymob,BL_PC)
		if(target.state~=1) then
			if(#c>0) then
				if(c[1].name~=target.name and os.time()>=target.mapRegistry["arhagarattack"]+3) then
					if(math.random(1,10)==10) then
						mob:talk(0,"Arhagar: Ah! Your plan won't work!")
					end
					target:addHealth(-3000)
					target:sendAnimation(149)
					target:playSound(116)
					target.mapRegistry["arhagarattack"]=os.time()
				end
			else
				if(math.random(1,10)==10) then
					mob:talk(0,"Arhagar: Fool! I will just blast magic at you then!")
				end
					if(os.time()>=target.mapRegistry["arhagarattack"]+3) then
					target:addHealth(-2000)
					target:sendAnimation(149)
					target:playSound(68)
					target.mapRegistry["arhagarattack"]=os.time()
					end
			end
		end

		if(mob.health<=100500 and target.mapRegistry["arhagarhelp"]==0) then
			if(target.blType==BL_PC) then
				for x=-20,20 do
					for y=-20,20 do
						c=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_MOB)
						if(#c>0) then
							for z=1,#c do
								if(c[z].name=="Gaorg") then
									mob:talk(0,"Arhagar: My magic won't protect me forever Gaorg!")
									target.mapRegistry["arhagarhelp"]=1
								end
							end
						end
					end
				end
			end
		elseif(mob.health<=100500 and target.mapRegistry["arhagarhelp"]==1) then
			if(target.blType==BL_PC) then
				for x=-20,20 do
					for y=-20,20 do
						c=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_MOB)
						if(#c>0) then
							for z=1,#c do
								if(c[z].name=="Gaorg") then
									if(c[z].health>170000) then
										c[z]:talk(0,"Gaorg: I won't let you die, we still have to raid this village tomorrow, you promised me!")
										mob:addHealth(1000000)
										target:playSound(25)
										mob:sendAnimation(18)
										target.mapRegistry["arhagarhelp"]=0
										target.mapRegistry["arhagarelse"]=0
									else
										if(target.mapRegistry["arhagarelse"]==0) then
											c[z]:talk(0,"Gaorg: It will have to do, I'm swamped here!")
											target.mapRegistry["arhagarelse"]=1
										end
									end
					
								end
							end
						end
					end
				end
			end
		end

		if(ra<=7 and os.time()>=target.mapRegistry["arhagarpillar"]+10) then
			for x=-20,20 do
				for y=-20,20 do
					c=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
					if(#c>0) then
						for z=1,#c do
							if(c[z].state~=1 and c[z].m==mob.m) then
								c[z]:sendAnimation(154)
								c[z]:playSound(69)
								c[z]:addHealth(-c[z].maxHealth/3)
							end
						end		
					end
				end
			end
			target.mapRegistry["arhagarpillar"]=os.time()
			
		end

			if(target.blType==BL_PC and target.state~=1) then
				for x=-20,20 do
					for y=-20,20 do
						c=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_MOB)
						if(#c>0) then
							for z=1,#c do
								if(c[z].name=="Gaorg" and c[z].target==mob.target) then
									if(target.mapRegistry["arhagarfool"]==0) then
										mob:talk(0,"Arhagar: Fool! Attacking both Gaorg and myself at the same time will be your last mistake!")
										target.mapRegistry["arhagarfool"]=1
									end
									local ma=target.maxHealth/7
									target:addHealth(-ma)
									target:sendAnimation(48)
									target:playSound(90)
									w=1
									
								end
							end
						end
					end
				end
			end

			if(w==0) then
				target.mapRegistry["arhagarfool"]=0
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
	
		player.mapRegistry["arhagarhelp"]=0
		player.mapRegistry["arhagarelse"]=0
		player.mapRegistry["arhagarfool"]=0

		local d=math.random(1,5)
		local r=math.random(1,100)
		local gold=math.random(1000,1500)

			if(r<=45) then
				mob:dropItem("focusing_ring",1)
			elseif(r>45 and r<=50) then
				mob:dropItem("recipe_golden_helm",1)
			elseif(r>50 and r<=60) then
				if(d==1) then
					mob:dropItem("recipe_impenetrable_mantle",1)
				elseif(d==2) then
					mob:dropItem("recipe_impenetrable_drapery",1)
				elseif(d==3) then
					mob:dropItem("recipe_impenetrable_clothes",1)
				elseif(d==4) then
					mob:dropItem("recipe_impenetrable_skirt",1)
				elseif(d==5) then
					mob:dropItem("recipe_tigers_eye_trinket",1)
				end
			else
				mob:dropItem(0,gold)
			end

	end
}
