queen_bee = {
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
			mob.mapRegistry["queenbeeengage"]=0
			mob.mapRegistry["queenbeeengagetrigger"]=0			
			mob.mapRegistry["queenbeespeech"]=0			
			mob.mapRegistry["queenbeespeech2"]=0
			mob.mapRegistry["queenbeefrenzy"]=0
			mob.mapRegistry["queenbeestun"]=0
			mob.mapRegistry["queenbeeaoe"]=0
			mob.mapRegistry["queenbeedead"]=0
			mob.mapRegistry["queenbeeannounce"]=0
			mob.mapRegistry["queenbeecounter"]=0
			local checkmobalive= {}
			checkmobalive=mob:getObjectsInArea(BL_MOB)
			
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

		if(target.mapRegistry["queenbeeengage"]<=os.time() and target.mapRegistry["queenbeeengagetrigger"]==0) then
			mob.side=math.random(0,3)
			mob:sendSide()
			target.mapRegistry["queenbeeengage"]=os.time()
			target.mapRegistry["queenbeeengagetrigger"]=1
			target.mapRegistry["queenbeefrenzy"] = os.time()+200
		end
		if(os.time()<target.mapRegistry["queenbeeengage"]+10 and os.time()>=target.mapRegistry["queenbeeengage"]+5 and target.mapRegistry["queenbeespeech"]==0) then
			mob:talk(0,"How fortunate... I usually must leave my hive to feast")
			target.mapRegistry["queenbeespeech"]=1
			mob.side=math.random(0,3)
			mob:sendSide()
		end
		if(os.time()<target.mapRegistry["queenbeeengage"]+20 and os.time()>=target.mapRegistry["queenbeeengage"]+14 and target.mapRegistry["queenbeespeech2"]==0) then
			mob:talk(0,"Now watch as the poison slowly destroys your body")
			target.mapRegistry["queenbeespeech2"]=1
			mob.side=math.random(0,3)
			mob:sendSide()
		end
		if(os.time()<target.mapRegistry["queenbeeengage"]+20 and os.time()>=target.mapRegistry["queenbeeengage"]) then
			mob:addHealth(10000000)
			return
		end
		
		if(os.time()>target.mapRegistry["queenbeeengage"]+20) then
			local check = {}
			check = mob:getObjectsInArea(BL_PC)
			
			if(#check>0) then
				for i=1 , #check do
					if(Player(check[i].ID):hasDuration("queen_bee_frenzy")==false and Player(check[i].ID).state==0) then
						Player(check[i].ID):sendAnimation(59)
						Player(check[i].ID):setDuration("queen_bee_frenzy",(target.mapRegistry["queenbeefrenzy"]-os.time())*1000)
					end
				end
			end
		end
		if(os.time()>=target.mapRegistry["queenbeestun"] and os.time()>=target.mapRegistry["queenbeeengage"]+25 and mob.health > mob.maxHealth*.30) then
			local check = {}			
			check = mob:getObjectsInArea(BL_PC)					
			if(#check>0) then
				for x=1,#check/2 do
					local r = math.random(1,#check)
					if(Player(check[r].ID).state==0)then
						if(Player(check[r].ID):hasDuration("queen_bee_stun")==false)then
							Player(check[r].ID).registry["pollinatecounter"]=0
							Player(check[r].ID):setDuration("queen_bee_stun",5000)
						else
							x=x-1
						end
					else
						x=x-1
					end					
				end				
			end
			mob.mapRegistry["queenbeestun"]=os.time()+15			
		end
		
		if(os.time()>=target.mapRegistry["queenbeeaoe"] and os.time()>=target.mapRegistry["queenbeeengage"]+31 and mob.health > mob.maxHealth*.30) then
			local check = {}		
			local anim = 1
				
			for x=-20,20 do
				for y=-20,20 do
					check = mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
					local r = math.random(0,3)
					if(r==1)then
						mob:sendAnimationXY(anim,mob.x+x,mob.y+y)
						if(#check>0) then
							if(Player(check[1].ID).state==0)then
								Player(check[1].ID):setDuration("queen_bee_dot",10000)
							end
						end						
					end
				end
			end
			mob.mapRegistry["queenbeeaoe"]=os.time()+15						
		end
		
		if(mob.health <= mob.maxHealth*.30) then
			local check = {}		
			local anim = 189
			if(mob.mapRegistry["queenbeeannounce"]==0) then
				target:broadcast(mob.m,"The queen bee enters a bersekers rage")
				mob.mapRegistry["queenbeeannounce"]=1
			end
			if(mob.mapRegistry["queenbeecounter"]%3==1) then
				check = mob:getObjectsInArea(BL_PC)
				if(#check>0) then
					for i=1,#check do
						if(Player(check[i].ID).state==0) then
							Player(check[i].ID):sendAnimation(anim)
							Player(check[i].ID):removeHealth(1500)
							Player(check[i].ID):setDuration("queen_bee_dot",10000)
						end
					end
				end
			end		
			mob.mapRegistry["queenbeecounter"]=1+mob.mapRegistry["queenbeecounter"] 				
		end
		
		
		
		
		if(os.time()>=target.mapRegistry["queenbeeengage"]+21) then
			target:removeHealthExtend(10000, 1, 1, 1, 1, 0)
			if(#e>0) then
				for a=1,#e do
					if(e[a].state~=1) then
						e[a]:sendAnimation(302)
						e[a].attacker=mob.ID
						e[a]:removeHealthExtend(3000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#f>0) then
				for a=1,#f do
					if(f[a].state~=1) then
						f[a]:sendAnimation(302)
						f[a].attacker=mob.ID
						f[a]:removeHealthExtend(3000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#g>0) then
				for a=1,#g do
					if(g[a].state~=1) then
						g[a]:sendAnimation(302)
						g[a].attacker=mob.ID
						g[a]:removeHealthExtend(3000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#h>0) then
				for a=1,#h do
					if(h[a].state~=1) then
						h[a]:sendAnimation(302)
						h[a].attacker=mob.ID
						h[a]:removeHealthExtend(3000, 1, 1, 1, 1, 0)
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
		player:broadcast(-1,"The Queen Bee has fallen in battle")
			mob.mapRegistry["queenbeeengage"]=0
			mob.mapRegistry["queenbeeengagetrigger"]=0			
			mob.mapRegistry["queenbeespeech"]=0			
			mob.mapRegistry["queenbeespeech2"]=0
			mob.mapRegistry["queenbeefrenzy"]=0
			mob.mapRegistry["queenbeestun"]=0
			mob.mapRegistry["queenbeeaoe"]=0
			mob.mapRegistry["queenbeedead"]=1
			mob.mapRegistry["queenbeeannounce"]=0
			mob.mapRegistry["queenbeecounter"]=0
		local check = {}
		check = mob:getObjectsInArea(BL_PC)
			
		if(#check>0) then
			for i=1 , #check do
				Player(check[i].ID):setDuration("queen_bee_frenzy",0)
			end
		end
		
		
		local lootchoice=math.random(1,100)
		--todo: add recipes for jewelcrafting
		if(lootchoice<=25) then
			mob:dropItem("queen_staff",1)
		elseif(lootchoice>25 and lootchoice<=100) then
			mob:dropItem("tourmaline",1)
		end
		
	end
	
}