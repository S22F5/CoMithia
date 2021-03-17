tails = {
	move = function(mob,target)
		local moved=true
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
		local ra=math.random(1,20)
		local countsides=0		
		local e= {}
		local f= {}
		local g= {}
		local h= {}
		local check = {}
		local check2 = {}
		

		local checkplayeralive = {}
		local checkalive=0
		for x=-20,20 do
			for y=-20,20 do
				checkplayeralive=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
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
			mob.mapRegistry["tailsengage"]=0
			mob.mapRegistry["tailsengagetrigger"]=0			
			mob.mapRegistry["tailsspeech"]=0
			mob.mapRegistry["tailsspecial"]=0
			mob.mapRegistry["tailsbroadcast"]=0
			mob.mapRegistry["tailsspawn"]=0
			local checkmobalive= {}
			checkmobalive=mob:getObjectsInArea(BL_MOB)
			if(#checkmobalive>0) then
				for z=1,#checkmobalive do
					if(checkmobalive[z].name=="Fox avenger") then
						checkmobalive[z].attacker=target.ID
						checkmobalive[z]:removeHealth(1000000)
					end
				end
			end
			return
		end


		e=mob:getObjectsInCell(mmob,xmob+1,ymob,BL_PC)
		f=mob:getObjectsInCell(mmob,xmob,ymob-1,BL_PC)
		g=mob:getObjectsInCell(mmob,xmob-1,ymob,BL_PC)
		h=mob:getObjectsInCell(mmob,xmob,ymob+1,BL_PC)

		if(#e>0) then
			for a=1,#e do
				if(e[a].state==1) then
					e[a]:warp(mob.m,mob.x,mob.y)
				end
			end
		end
		if(#f>0) then
			for a=1,#f do
				if(f[a].state==1) then
					f[a]:warp(mob.m,mob.x,mob.y)
				end
			end
		end
		if(#g>0) then
			for a=1,#g do
				if(g[a].state==1) then
					g[a]:warp(mob.m,mob.x,mob.y)
				end
			end
		end
		if(#h>0) then
			for a=1,#h do
				if(h[a].state==1) then
					h[a]:warp(mob.m,mob.x,mob.y)
				end
			end
		end

		if(target.mapRegistry["tailsengage"]<=os.time() and target.mapRegistry["tailsengagetrigger"]==0) then
			mob.side=2
			mob:sendSide()
			target.mapRegistry["tailsengage"]=os.time()
			target.mapRegistry["tailsengagetrigger"]=1
		end
		if(os.time()<target.mapRegistry["tailsengage"]+10 and os.time()>=target.mapRegistry["tailsengage"]+5 and target.mapRegistry["tailsspeech"]==0) then
			mob:talk(0,"You...human.. should not be here ")
			target.mapRegistry["tailsspeech"]=1
		end
		if(os.time()<target.mapRegistry["tailsengage"]+10 and os.time()>=target.mapRegistry["tailsengage"]) then
			mob:addHealth(10000000)
			return
		end
		if(os.time()>=target.mapRegistry["tailsspecial"] and os.time()>=target.mapRegistry["tailsengage"]+15 and mob.health > mob.maxHealth*.10) then
			local check = {}
			if(mob.side == 1) then				
				check = mob:getObjectsInCell(mob.m,mob.x+1,mob.y,BL_PC)
			end
			if(mob.side == 2) then				
				check = mob:getObjectsInCell(mob.m,mob.x,mob.y+1,BL_PC)
			end
			if(mob.side == 3) then				
				check = mob:getObjectsInCell(mob.m,mob.x-1,mob.y,BL_PC)
			end
			if(mob.side == 0) then				
				check = mob:getObjectsInCell(mob.m,mob.x,mob.y-1,BL_PC)
			end
			
			if(#check < 1) then
				check = mob:getObjectsInArea(BL_PC)
			end
				
			if(#check>0) then
				for i=1,#check do
					if(Player(check[i].ID).state~=1)then
						if(Player(check[i].ID):hasDuration("fox_spell")==true) then
							Player(check[i].ID):setDuration("fox_spell",0)
							Player(check[i].ID):setDuration("fox_spell2",40000)
						elseif(Player(check[i].ID):hasDuration("fox_spell2")==true) then
							Player(check[i].ID):setDuration("fox_spell2",0)
							Player(check[i].ID):setDuration("fox_spell3",40000)
						elseif(Player(check[i].ID):hasDuration("fox_spell3")==true) then							
							Player(check[i].ID):setDuration("fox_spell3",40000)
						else
							Player(check[i].ID):setDuration("fox_spell",40000)
						end
						mob:talk(2,"Unleashes energy")
					end					
				end
			end			
			target.mapRegistry["tailsspecial"]=os.time()+14
		end
		if(mob.mapRegistry["tailsspawn"]==0 and mob.health < mob.maxHealth*.5)then
			mob:talk(1,"Tails! Foxes of the land, aid me.. I am dying!")
			target:broadcast(mob.m,"Wild foxes enter to the room to help tails ")
			mob:spawn(177,4,19,2)
			mob:spawn(177,4,18,2)
			mob:spawn(177,5,19,2)
			mob:spawn(177,5,18,2)
			mob.mapRegistry["tailsspawn"]=1
		end
		if(os.time()>=target.mapRegistry["tailsspecial"] and os.time()>=target.mapRegistry["tailsengage"]+15 and mob.health < mob.maxHealth*.10) then
			if(mob.mapRegistry["tailsbroadcast"]==0) then
				target:broadcast(mob.m,"Tails enters a furious rage damaging everyone around him wildly")
				mob.mapRegistry["tailsbroadcast"]=1
			end
			check = mob:getObjectsInArea(BL_PC)
			check2 = mob:getObjectsInArea(BL_MOB)				
			if(#check>0) then
				for i=1,#check do
					if(Player(check[i].ID).state~=1)then
						if(Player(check[i].ID):hasDuration("fox_spell")==true) then
							Player(check[i].ID):setDuration("fox_spell",0)
							Player(check[i].ID):setDuration("fox_spell2",40000)
						elseif(Player(check[i].ID):hasDuration("fox_spell2")==true) then
							Player(check[i].ID):setDuration("fox_spell2",0)
							Player(check[i].ID):setDuration("fox_spell3",40000)
						elseif(Player(check[i].ID):hasDuration("fox_spell3")==true) then							
							Player(check[i].ID):setDuration("fox_spell3",40000)
						else
							Player(check[i].ID):setDuration("fox_spell",40000)
						end
						mob:talk(2,"Unleashes energy")
					end					
				end
			end
			if(#check2>0)then
				for k=1,#check do
					check2[k].attacker=target.ID
					check2[k]:removeHealth(1000000)
					check2[k]:sendAnimation(9)
				end
			end
			target.mapRegistry["tailsspecial"]=os.time()+14
		end
		
		
		
		
		if(os.time()>=target.mapRegistry["tailsengage"]+10) then
			target:removeHealthExtend(10000, 1, 1, 1, 1, 0)
			if(#e>0) then
				for a=1,#e do
					if(e[a].state~=1) then
						e[a]:sendAnimation(302)
						e[a].attacker=mob.ID
						e[a]:removeHealthExtend(5000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#f>0) then
				for a=1,#f do
					if(f[a].state~=1) then
						f[a]:sendAnimation(302)
						f[a].attacker=mob.ID
						f[a]:removeHealthExtend(5000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#g>0) then
				for a=1,#g do
					if(g[a].state~=1) then
						g[a]:sendAnimation(302)
						g[a].attacker=mob.ID
						g[a]:removeHealthExtend(5000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#h>0) then
				for a=1,#h do
					if(h[a].state~=1) then
						h[a]:sendAnimation(302)
						h[a].attacker=mob.ID
						h[a]:removeHealthExtend(5000, 1, 1, 1, 1, 0)
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
		player:broadcast(-1,"The mysterious fox, Tails, has been slain...")
		mob.mapRegistry["tailsengage"]=0
		mob.mapRegistry["tailsengagetrigger"]=0
		mob.mapRegistry["tailsspecial"]=0
		mob.mapRegistry["tailsspeech"]=0
		mob.mapRegistry["tailsbroadcast"]=0
		mob.mapRegistry["tailsspawn"]=0
		
		mob:talk(0,"This is not..... over...")
		
		local checkmobaliveb= {}
		checkmobaliveb=mob:getObjectsInArea(BL_MOB)
		if(#checkmobaliveb>0) then
			for z=1,#checkmobaliveb do
				if(checkmobaliveb[z].name=="Fox avenger") then
					checkmobaliveb[z].attacker=player.ID
					checkmobaliveb[z]:removeHealth(1000000)
				end
			end
		end
		
		local lootchoice=math.random(1,100)
		--todo: add recipes for jewelcrafting
		if(lootchoice<=25) then
			mob:dropItem("lucky_fox_charm",1)
		elseif(lootchoice>25 and lootchoice<=100) then
			mob:dropItem("tourmaline",1)
		end
	end
	
}

