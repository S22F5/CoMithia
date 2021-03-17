mithian = {
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
		local calcThreat = {}
		local check = {}
		local check2 = {}

		threat.calcHighestThreat(mob,target)



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
			mob.mapRegistry["mithianengage"]=0
			mob.mapRegistry["mithianengagetrigger"]=0			
			mob.mapRegistry["mithianspeech"]=0
			mob.mapRegistry["mithianspeech2"]=0
			mob.mapRegistry["mithianfrenzy"]=0
			mob.mapRegistry["mithiandebuff"]=0
			mob.mapRegistry["mithian25"]=0
			mob.mapRegistry["mithian50"]=0
			mob.mapRegistry["mithian75"]=0
			mob.mapRegistry["mithiandead"]=0
			mob.mapRegistry["mithianannounce"]=0
			mob.mapRegistry["mithianstun"]=0
			mob.mapRegistry["mithianstuntime"]=0
			mob.mapRegistry["mithianstuntalk"]=0
			mob.mapRegistry["mithianspawnboulder"]=0
			mob.mapRegistry["mithianaoe"]=0
			mob.mapRegistry["mithianaoe2"]=0
			mob.mapRegistry["mithianaoespot1x"]=0
			mob.mapRegistry["mithianaoespot1y"]=0
			mob.mapRegistry["mithianaoespot2x"]=0
			mob.mapRegistry["mithianaoespot2y"]=0
			mob.mapRegistry["mithianaoespot3x"]=0
			mob.mapRegistry["mithianaoespot3y"]=0
			mob.mapRegistry["mithianlasthit"]=0
			mob.mapRegistry["mithianaoe3"]=0
			mob.mapRegistry["mithianaoecast"]=0
			mob.mapRegistry["mithianrage"]=0
			local checkmobalive= {}
			checkmobalive=mob:getObjectsInArea(BL_MOB)
			mob.paralyzed = false
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

		if(target.mapRegistry["mithianengage"]<=os.time() and target.mapRegistry["mithianengagetrigger"]==0) then
			mob.side=math.random(0,3)
			mob:sendSide()
			target.mapRegistry["mithianengage"]=os.time()
			target.mapRegistry["mithianengagetrigger"]=1
			target.mapRegistry["mithianfrenzy"] = os.time()+320
		end
		if(os.time()<target.mapRegistry["mithianengage"]+10 and os.time()>=target.mapRegistry["mithianengage"]+5 and target.mapRegistry["mithianspeech"]==0) then
			mob:talk(0,"How fortunate... I usually must leave my hive to feast")
			target.mapRegistry["mithianspeech"]=1
			mob.side=math.random(0,3)
			mob:sendSide()
		end
		if(os.time()<target.mapRegistry["mithianengage"]+20 and os.time()>=target.mapRegistry["mithianengage"]+14 and target.mapRegistry["mithianspeech2"]==0) then
			mob:talk(0,"Now watch as the poison slowly destroys your body")
			target.mapRegistry["mithianspeech2"]=1
			mob.side=math.random(0,3)
			mob:sendSide()
		end
		if(os.time()<target.mapRegistry["mithianengage"]+20 and os.time()>=target.mapRegistry["mithianengage"]) then
			mob:addHealth(10000000)
			return
		end
		
		if(os.time()>target.mapRegistry["mithianengage"]+20) then
			local check = {}
			check = mob:getObjectsInArea(BL_PC)
			
			if(#check>0) then
				for i=1 , #check do
					if(Player(check[i].ID):hasDuration("mithian_frenzy")==false and Player(check[i].ID).state==0) then
						Player(check[i].ID):sendAnimation(40)
						Player(check[i].ID):setDuration("mithian_frenzy",(target.mapRegistry["mithianfrenzy"]-os.time())*1000)
					end
				end
			end
		end
		
		if(os.time()>=target.mapRegistry["mithiandebuff"] and os.time()>=target.mapRegistry["mithianengage"]+20 and mob.mapRegistry["mithianstun"]==0) then
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
				if(#check>0) then
					for i=1,#check do
						if(Player(check[i].ID).state~=1)then
							Player(check[i].ID):removeHealthExtend(Player(check[i].ID).maxHealth, 1, 1, 1, 1, 0)
				
						end
					end
				end
			end
				
			if(#check>0) then
				for i=1,#check do
					if(Player(check[i].ID).state~=1)then
						
						if(Player(check[i].ID):hasDuration("mithian_debuff")==true) then
							Player(check[i].ID):setDuration("mithian_debuff",0)
							mithian_debuff2.cast(Player(check[i].ID))
						elseif(Player(check[i].ID):hasDuration("mithian_debuff2")==true) then
							Player(check[i].ID):setDuration("mithian_debuff2",0)
							mithian_debuff3.cast(Player(check[i].ID))
						elseif(Player(check[i].ID):hasDuration("mithian_debuff3")==true) then
							Player(check[i].ID):setDuration("mithian_debuff3",0)
							mithian_debuff4.cast(Player(check[i].ID))
						elseif(Player(check[i].ID):hasDuration("mithian_debuff4")==true) then
							Player(check[i].ID):setDuration("mithian_debuff4",0)
							mithian_debuff5.cast(Player(check[i].ID))
						elseif(Player(check[i].ID):hasDuration("mithian_debuff5")==true) then							
							Player(check[i].ID):setDuration("mithian_debuff5",30000,0,1)
						else
							mithian_debuff.cast(Player(check[i].ID))
						end
						Player(check[i].ID):sendAnimation(31)
					end					
				end
			end		
			mob.mapRegistry["mithiandebuff"]=os.time()+10			
		end
		if(os.time()>=target.mapRegistry["mithianaoe"] and os.time()>=target.mapRegistry["mithianengage"]+30 and mob.mapRegistry["mithianstun"]==0) then
			local find={}
			local ptable = {}
			for x=-30,30 do
				for y=-30,30 do
					find=target:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
					if(#find>0) then
						for z=1,#find do
							if(find[z].state~=1) then
								table.insert(ptable,""..find[z].ID.."")
							end
						end
					end
				end
			end
			if(#ptable)>0 then
				if(#ptable)>=3 then
					local ra = math.random(1,#ptable)
					local rb = math.random(1,#ptable)
					local rc = math.random(1,#ptable)
					while(ra==rb or ra==rc or rb==rc) do
						while(ra==rb) do
							ra = math.random(1,#ptable)
							rb = math.random(1,#ptable)
						end
						while(ra==rc) do
							ra = math.random(1,#ptable)
							rc = math.random(1,#ptable)
						end
						while(rb==rc) do
							rb = math.random(1,#ptable)
							rc = math.random(1,#ptable)
						end
					end
					mob.mapRegistry["mithianaoespot1x"]=Player(ptable[ra]).x
					mob.mapRegistry["mithianaoespot1y"]=Player(ptable[ra]).y
					mob.mapRegistry["mithianaoespot2x"]=Player(ptable[rb]).x
					mob.mapRegistry["mithianaoespot2y"]=Player(ptable[rb]).y
					mob.mapRegistry["mithianaoespot3x"]=Player(ptable[rc]).x
					mob.mapRegistry["mithianaoespot3y"]=Player(ptable[rc]).y
				end
			end
			mob.mapRegistry["mithianaoe"]=os.time()+30	
			mob.mapRegistry["mithianaoe2"]=os.time()
			
			mob.mapRegistry["mithianaoecast"]=0
		end
		if(os.time()<target.mapRegistry["mithianaoe2"]+10 and os.time()>=target.mapRegistry["mithianengage"]+30 and mob.mapRegistry["mithianstun"]==0) then
			mob:sendAnimationXY(363,mob.mapRegistry["mithianaoespot1x"],mob.mapRegistry["mithianaoespot1y"])
			mob:sendAnimationXY(363,mob.mapRegistry["mithianaoespot2x"],mob.mapRegistry["mithianaoespot2y"])
			mob:sendAnimationXY(363,mob.mapRegistry["mithianaoespot3x"],mob.mapRegistry["mithianaoespot3y"])
		end
		if(os.time()>=target.mapRegistry["mithianaoe3"] and os.time()>=target.mapRegistry["mithianengage"]+40 and mob.mapRegistry["mithianstun"]==0 and mob.mapRegistry["mithianaoecast"]==0) then
			mob:sendAnimationXY(153,mob.mapRegistry["mithianaoespot1x"],mob.mapRegistry["mithianaoespot1y"])
			mob:sendAnimationXY(153,mob.mapRegistry["mithianaoespot2x"],mob.mapRegistry["mithianaoespot2y"])
			mob:sendAnimationXY(153,mob.mapRegistry["mithianaoespot3x"],mob.mapRegistry["mithianaoespot3y"])
			local area1 = {}
			local area2 = {}
			local area3 = {}
			area1 = mob:getObjectsInCell(mob.m,mob.mapRegistry["mithianaoespot1x"],mob.mapRegistry["mithianaoespot1y"],BL_PC)
			area2 = mob:getObjectsInCell(mob.m,mob.mapRegistry["mithianaoespot2x"],mob.mapRegistry["mithianaoespot2y"],BL_PC)
			area3 = mob:getObjectsInCell(mob.m,mob.mapRegistry["mithianaoespot3x"],mob.mapRegistry["mithianaoespot3y"],BL_PC)
			if(#area1>0) then
				for z=1,#area1 do
					if(area1[z].state~=1) then
						area1[z]:removeHealth(10000000000)
						mob.mapRegistry["mithianrage"]=mob.mapRegistry["mithianrage"]+5
						target:broadcast(mob.m,"Mithian generates rage off the dead! (Current rage is at: "..mob.mapRegistry["mithianrage"].."%)")
						mob:talk(1,"Mithian: I'M RAGING BRO")
					end
				end
			end
			if(#area2>0) then
				for z=1,#area2 do
					if(area2[z].state~=1) then
						area2[z]:removeHealth(10000000000)
						mob.mapRegistry["mithianrage"]=mob.mapRegistry["mithianrage"]+5
						target:broadcast(mob.m,"Mithian generates rage off the dead! (Current rage is at: "..mob.mapRegistry["mithianrage"].."%)")
						mob:talk(1,"Mithian: I'M RAGING BRO")
					end
				end
			end
			if(#area3>0) then
				for z=1,#area3 do
					if(area3[z].state~=1) then
						area3[z]:removeHealth(10000000000)
						mob.mapRegistry["mithianrage"]=mob.mapRegistry["mithianrage"]+5
						target:broadcast(mob.m,"Mithian generates rage off the dead! (Current rage is at: "..mob.mapRegistry["mithianrage"].."%)")
						mob:talk(1,"Mithian: I'M RAGING BRO")
					end
				end
			end
			mob.mapRegistry["mithianaoe3"]=os.time()+30
			mob.mapRegistry["mithianaoecast"]=1
		end
					



			
					
		if(mob.health < mob.maxHealth * .75 and mob.mapRegistry["mithian75"]==0) then
			mob.mapRegistry["mithian75"]=1
			mob.mapRegistry["mithianstun"]=1
			mob.mapRegistry["mithianstuntalk"]=0
			mob.mapRegistry["mithianspawnboulder"]=0			
			mob.mapRegistry["mithianstuntime"]=os.time()
		end
		if(mob.health < mob.maxHealth * .50 and mob.mapRegistry["mithian50"]==0) then
			mob.mapRegistry["mithian50"]=1
			mob.mapRegistry["mithianstun"]=1
			mob.mapRegistry["mithianstuntalk"]=0
			mob.mapRegistry["mithianspawnboulder"]=0
			mob.mapRegistry["mithianstuntime"]=os.time()
		end
		if(mob.health < mob.maxHealth * .25 and mob.mapRegistry["mithian25"]==0) then
			mob.mapRegistry["mithian25"]=1
			mob.mapRegistry["mithianstun"]=1
			mob.mapRegistry["mithianstuntalk"]=0
			mob.mapRegistry["mithianspawnboulder"]=0
			mob.mapRegistry["mithianstuntime"]=os.time()
		end
		if(target.mapRegistry["mithianstuntime"] > 0) then
			mob:sendAction(2,35)		
			if(target.mapRegistry["mithianstuntalk"]==0) then
				mob:talk(1,"Mithian: Rahh let'see you out run this!")
				mob.paralyzed=true
				mob.mapRegistry["mithianstuntalk"]=1
			end
			if(os.time() > target.mapRegistry["mithianstuntime"]+2 and mob.mapRegistry["mithianspawnboulder"]==0) then
				mob:spawn(193,mob.x,mob.y,1)
				mob.mapRegistry["mithianspawnboulder"]=1
			end
			if(os.time() > target.mapRegistry["mithianstuntime"]+10 and target.mapRegistry["mithianstuntalk"]==1 and mob.mapRegistry["mithianspawnboulder"]==1) then
				mob:talk(1,"Mithian: Ahahaha. Now I'll get you!")
				mob.paralyzed = false
				mob.mapRegistry["mithianstuntalk"]=0
				mob.mapRegistry["mithianstuntime"]=0
				mob.mapRegistry["mithianstun"]=0
			end
		end

--[[
		if(mob.mapRegistry["mithianstuntime"] > 0) then
			if(os.time() > mob.mapRegistry["mithianstuntime"]+12 and mob.mapRegistry["mithianspawnboulder"]==1 and mob.mapRegistry["mithianstuntalk"]==1) then
				mob:talk(0,"Mithian: Ahahaha. Now I'll get you!")
				calcThreat = mob:getObjectsInArea(BL_PC)
				if(#calcThreat>0) then
					for i=1 , #calcThreat do
						calcThreat[i].threat=0
					end
				end				
				mob.paralyzed = false
				mob.mapRegistry["mithianstuntime"]=0
				mob.mapRegistry["mithianstun"]=0
				mob.mapRegistry["mithianstuntalk"]=0
				mob.mapRegistry["mithianspawnboulder"]=0
			end
			if(os.time() > mob.mapRegistry["mithianstuntime"]+5 and mob.mapRegistry["mithianspawnboulder"]==0 and mob.mapRegistry["mithianstuntalk"]==1) then
				mob:spawn(193,mob.x,mob.y,1)
				mob.mapRegistry["mithianstuntspawnboulder"]=1
			end
			if(mob.mapRegistry["mithianstuntalk"]==0) then
				mob:talk(0,"Mithian: Rahh let'see you out run this!")
				mob:sendAction(2,35)				
				calcThreat = mob:getObjectsInArea(BL_PC)
				if(#calcThreat>0) then
					for i=1 , #calcThreat do
						calcThreat[i].threat=0
					end
				end
				local boulder_target=math.random(1,#calcThreat)
				calcThreat[boulder_target].threat=1000000000
				mob.paralyzed=true
				mob.mapRegistry["mithianstuntalk"]=1
			end
		end
]]--
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

			-- mobAIbasic.move_hit(mob,target)
			mithian.move_hit(mob,target)
		
		end		
	end,
	move_hit=function(mob,target)	
		if target then
			local moved=FindCoords(mob,target,1)
			local threatid = 0
			if(moved) then
				--We are right next to them, so attack!	
				
				-- mob:attackNoCrit(target,target.maxHealth*.75,target.maxHealth*.75)

				
				
				-- mob:attackNoCrit(target,target.maxHealth*2.1,target.maxHealth*2.1)
				mob:attackNoCrit(target,target.maxHealth*2.1*(1+(mob.mapRegistry["mithianrage"]/100)),target.maxHealth*2.1*(1+(mob.mapRegistry["mithianrage"]/100)))

			end			
			-- mob:spawn(1,mob.x+1,mob.y,1,5)			
		end		
	end,

	on_death=function(mob,player)
		--player:broadcast(-1,"The mithian has fallen and leaves behind a key.")
			mob.mapRegistry["mithianengage"]=0
			mob.mapRegistry["mithianengagetrigger"]=0			
			mob.mapRegistry["mithianspeech"]=0			
			mob.mapRegistry["mithianspeech2"]=0
			mob.mapRegistry["mithianfrenzy"]=0
			mob.mapRegistry["mithiandebuff"]=0
			mob.mapRegistry["mithian25"]=0
			mob.mapRegistry["mithian50"]=0
			mob.mapRegistry["mithian75"]=0
			mob.mapRegistry["mithiandead"]=1
			mob.mapRegistry["mithianannounce"]=0
			mob.mapRegistry["mithianstun"]=0
			mob.mapRegistry["mithianstuntime"]=0
			mob.mapRegistry["mithianstun"]=0
			mob.mapRegistry["mithianstuntalk"]=0
			mob.mapRegistry["mithianspawnboulder"]=0
			mob.mapRegistry["mithianaoe"]=0
			mob.mapRegistry["mithianaoe2"]=0
			mob.mapRegistry["mithianaoespot1x"]=0
			mob.mapRegistry["mithianaoespot1y"]=0
			mob.mapRegistry["mithianaoespot2x"]=0
			mob.mapRegistry["mithianaoespot2y"]=0
			mob.mapRegistry["mithianaoespot3x"]=0
			mob.mapRegistry["mithianaoespot3y"]=0
			mob.mapRegistry["mithianlasthit"]=0
			mob.mapRegistry["mithianaoe3"]=0
			mob.mapRegistry["mithianaoecast"]=0
			mob.mapRegistry["mithianrage"]=0
			
			
		local check = {}
		check = mob:getObjectsInArea(BL_PC)
			
		if(#check>0) then
			for i=1 , #check do
				Player(check[i].ID):setDuration("mithian_frenzy",0)
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

boulder = {
	move = function(mob,target)
		local moved=true
		local e = {}
		local f = {}
		local g = {}
		local h = {}
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
		threat.calcHighestThreat(mob,target)
		e=mob:getObjectsInCell(mmob,xmob+1,ymob,BL_PC)
		f=mob:getObjectsInCell(mmob,xmob,ymob-1,BL_PC)
		g=mob:getObjectsInCell(mmob,xmob-1,ymob,BL_PC)
		h=mob:getObjectsInCell(mmob,xmob,ymob+1,BL_PC)

		target:sendAnimation(247)
		if(#e>0) then
			for a=1,#e do
				if(e[a].state==0) then
					local center = {}
					center=mob:getObjectsInArea(BL_PC)
					if(#center>0) then
						for x=1,#center do
							local xcheck=math.abs(center[x].x-mob.x)
							local ycheck=math.abs(center[x].y-mob.y)
							if((xcheck+ycheck)<=4) then
								center[x]:sendAnimation(138)									
								center[x]:removeHealth(center[x].maxHealth*.95)
								center[x]:setDuration("mithian_stun",5000)
							end
						end
					end
					checkmobalive=mob:getObjectsInArea(BL_MOB)
					if(#checkmobalive>0) then
						for i=1,#checkmobalive do
							if(checkmobalive[i].name=="Boulder" ) then
								checkmobalive[i].attacker=target.ID
								checkmobalive[i]:removeHealth(100000000)
							end
						end
					end
				end
			end
		end
		if(#f>0) then
			for a=1,#f do
				if(f[a].state==0) then
					local center = {}
					center=mob:getObjectsInArea(BL_PC)
					if(#center>0) then
						for x=1,#center do
							local xcheck=math.abs(center[x].x-mob.x)
							local ycheck=math.abs(center[x].y-mob.y)
							if((xcheck+ycheck)<=4) then
								center[x]:sendAnimation(138)									
								center[x]:removeHealth(center[x].maxHealth*.95)
								center[x]:setDuration("mithian_stun",5000)
							end
						end
					end
					checkmobalive=mob:getObjectsInArea(BL_MOB)
					if(#checkmobalive>0) then
						for i=1,#checkmobalive do
							if(checkmobalive[i].name=="Boulder" ) then
								checkmobalive[i].attacker=target.ID
								checkmobalive[i]:removeHealth(100000000)
							end
						end
					end
				end
			end
		end
		if(#g>0) then
			for a=1,#g do
				if(g[a].state==0) then
					local center = {}
					center=mob:getObjectsInArea(BL_PC)
					if(#center>0) then
						for x=1,#center do
							local xcheck=math.abs(center[x].x-mob.x)
							local ycheck=math.abs(center[x].y-mob.y)
							if((xcheck+ycheck)<=4) then
								center[x]:sendAnimation(138)								
								center[x]:removeHealth(center[x].maxHealth*.95)
								center[x]:setDuration("mithian_stun",5000)
							end
						end
					end
					local checkmobalive= {}
					checkmobalive=mob:getObjectsInArea(BL_MOB)
					if(#checkmobalive>0) then
						for i=1,#checkmobalive do
							if(checkmobalive[i].name=="Boulder" ) then
								checkmobalive[i].attacker=target.ID
								checkmobalive[i]:removeHealth(100000000)
							end
						end
					end
				end
			end
		end
		if(#h>0) then
			for a=1,#h do
				if(h[a].state==0) then
					local center = {}
					center=mob:getObjectsInArea(BL_PC)
					if(#center>0) then
						for x=1,#center do
							local xcheck=math.abs(center[x].x-mob.x)
							local ycheck=math.abs(center[x].y-mob.y)
							if((xcheck+ycheck)<=4) then
								center[x]:sendAnimation(138)									
								center[x]:removeHealth(center[x].maxHealth*.95)
								center[x]:setDuration("mithian_stun",5000)
							end
						end
					end
					checkmobalive=mob:getObjectsInArea(BL_MOB)
					if(#checkmobalive>0) then
						for i=1,#checkmobalive do
							if(checkmobalive[i].name=="Boulder" ) then
								checkmobalive[i].attacker=target.ID
								checkmobalive[i]:removeHealth(100000000)
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
}