the_gatekeeper = {
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
		for x=-30,30 do
			for y=-30,30 do
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
			mob:addHealth(100000000)
			mob.mapRegistry["gatekeeperengage"]=0
			mob.mapRegistry["gatekeeperengagetrigger"]=0			
			mob.mapRegistry["gatekeeperspeech"]=0			
			mob.mapRegistry["gatekeeperspeech2"]=0
			mob.mapRegistry["gatekeeperfrenzy"]=0
			mob.mapRegistry["gatekeepersummon"]=0
			mob.mapRegistry["gatekeeperaoe"]=0
			mob.mapRegistry["gatekeeperdead"]=0
			mob.mapRegistry["gatekeeperannounce"]=0
			mob.mapRegistry["gatekeepercounter"]=0
			mob.mapRegistry["gatekeeperattack"]=0
			mob.mapRegistry["gatekeeperlasthit"]=0
			local checkmobalive= {}
			checkmobalive=mob:getObjectsInArea(BL_MOB)
			if(#checkmobalive>0) then
				for i=1,#checkmobalive do
					if(checkmobalive[i].name=="Shade" or checkmobalive[i].name=="Lost soul" ) then
						checkmobalive[i].attacker=target.ID
						checkmobalive[i]:removeHealth(100000000)
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

		if(target.mapRegistry["gatekeeperengage"]<=os.time() and target.mapRegistry["gatekeeperengagetrigger"]==0) then
			mob.side=2
			mob:sendSide()
			target.mapRegistry["gatekeeperengage"]=os.time()
			target.mapRegistry["gatekeeperengagetrigger"]=1
			target.mapRegistry["gatekeeperfrenzy"] = os.time()+380
		end
		if(os.time()<target.mapRegistry["gatekeeperengage"]+10 and os.time()>=target.mapRegistry["gatekeeperengage"]+8 and target.mapRegistry["gatekeeperspeech"]==0) then
			mob:talk(0,"300 years protecting this place, and you think you can enter?")
			target.mapRegistry["gatekeeperspeech"]=1
			mob.side=2
			mob:sendSide()
		end
		if(os.time()<target.mapRegistry["gatekeeperengage"]+20 and os.time()>=target.mapRegistry["gatekeeperengage"]+18 and target.mapRegistry["gatekeeperspeech2"]==0) then
			mob:talk(0,"You shall not pass!")
			target.mapRegistry["gatekeeperspeech2"]=1
			mob.side=2
			mob:sendSide()
		end
		if(os.time()<target.mapRegistry["gatekeeperengage"]+20 and os.time()>=target.mapRegistry["gatekeeperengage"]) then
			mob:addHealth(10000000)
			return
		end
		
		if(os.time()>target.mapRegistry["gatekeeperengage"]+20) then
			local check = {}
			check = mob:getObjectsInArea(BL_PC)
			
			if(#check>0) then
				for i=1 , #check do
					if(Player(check[i].ID):hasDuration("gatekeeper_frenzy")==false and Player(check[i].ID).state==0) then
						Player(check[i].ID):sendAnimation(59)
						Player(check[i].ID):setDuration("gatekeeper_frenzy",(target.mapRegistry["gatekeeperfrenzy"]-os.time())*1000)
					end
				end
			end
		end
		
		if(os.time()>target.mapRegistry["gatekeeperengage"]+20) then
			if(target.mapRegistry["shade1time"]>0)then
				if(os.time()<target.mapRegistry["shade1time"]+23) then
					mob:sendAnimationXY(251,target.mapRegistry["shade1x"],target.mapRegistry["shade1y"])
					local check = mob:getObjectsInCell(target.m,target.mapRegistry["shade1x"],target.mapRegistry["shade1y"],BL_PC)
					if(#check>0) then
						for i=1,#check do
							check[i]:setDuration("gatekeeper_shield",15000)
						end
					end
				end
			end
			if(target.mapRegistry["shade2time"]>0)then
				if(os.time()<target.mapRegistry["shade2time"]+23) then
					mob:sendAnimationXY(251,target.mapRegistry["shade2x"],target.mapRegistry["shade2y"])
					local check = mob:getObjectsInCell(target.m,target.mapRegistry["shade2x"],target.mapRegistry["shade2y"],BL_PC)
					if(#check>0) then
						for i=1,#check do
							check[i]:setDuration("gatekeeper_shield",15000)
						end
					end
				end
			end
			if(target.mapRegistry["shade3time"]>0)then
				if(os.time()<target.mapRegistry["shade3time"]+23) then
					mob:sendAnimationXY(251,target.mapRegistry["shade3x"],target.mapRegistry["shade3y"])
					local check = mob:getObjectsInCell(target.m,target.mapRegistry["shade3x"],target.mapRegistry["shade3y"],BL_PC)
					if(#check>0) then
						for i=1,#check do
							check[i]:setDuration("gatekeeper_shield",15000)
						end
					end
				end
			end
			if(target.mapRegistry["shade4time"]>0)then
				if(os.time()<target.mapRegistry["shade4time"]+23) then
					mob:sendAnimationXY(251,target.mapRegistry["shade4x"],target.mapRegistry["shade4y"])
					local check = mob:getObjectsInCell(target.m,target.mapRegistry["shade4x"],target.mapRegistry["shade4y"],BL_PC)
					if(#check>0) then
						for i=1,#check do
							check[i]:setDuration("gatekeeper_shield",15000)
						end
					end
				end
			end
		end
		
		if(target.mapRegistry["gatekeeperattack"]<os.time() and os.time()>target.mapRegistry["gatekeeperengage"]+23) then			
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
				local count=0
				local ra=math.random(1,#ptable)
				while Player(ptable[ra]).state==1 or Player(ptable[ra]).ID==target.mapRegistry["gatekeeperlasthit"] do
					ra=math.random(1,#ptable)
					count=count+1
					if(count==5) then
						break
					end
				end
				mob:sendAction(1,35)
				target:playSound(81)
				Player(ptable[ra]):removeHealthExtend(Player(ptable[ra]).maxHealth*.43, 1, 1, 1, 1, 0)
				Player(ptable[ra]):sendAnimation(51)
				target.mapRegistry["gatekeeperattack"]=os.time()+1
				target.mapRegistry["gatekeeperlasthit"]=Player(ptable[ra]).ID
			end
		end
		
		if(os.time()>=target.mapRegistry["gatekeepersummon"] and os.time()>=target.mapRegistry["gatekeeperengage"]+25) then
			mob:spawn(185,mob.x+2,mob.y,1)
			mob:spawn(189,mob.x-2,mob.y,1)
			mob:spawn(190,mob.x,mob.y-2,1)
			mob:spawn(191,mob.x,mob.y+2,1)
			mob.mapRegistry["gatekeepersummon"]=os.time()+70
		end
		if(os.time()>=target.mapRegistry["gatekeeperannounce"] and os.time()>=target.mapRegistry["gatekeeperengage"]+51) then
			mob:sendAnimation(186)
			target:broadcast(mob.m,"The Gatekeeper begins to channel a large spell!")
			mob.mapRegistry["gatekeeperannounce"]=os.time()+70
		end
		if(os.time()>=target.mapRegistry["gatekeeperaoe"] and os.time()>=target.mapRegistry["gatekeeperengage"]+60) then
			local check = {}
			local check2 = {}
			local anim = 111
			
			check = mob:getObjectsInArea(BL_PC)
			if(#check>0) then
				for i=1, #check do
					if(Player(check[i].ID):hasDuration("gatekeeper_shield")==false and Player(check[i].ID).state~=1)then
						Player(check[i].ID):sendAnimation(anim)
						Player(check[i].ID):removeHealth(10000000)
						mob:spawn(186,Player(check[i].ID).x,Player(check[i].ID).y,1)
					elseif(Player(check[i].ID):hasDuration("gatekeeper_shield")==true and Player(check[i].ID).state~=1) then
						Player(check[i].ID):sendAnimation(87)
						Player(check[i].ID):sendMinitext("The shield protects you from the damage")
					end
				end
			end
			check2 = mob:getObjectsInArea(BL_MOB)
			if(#check2>0) then
				for i=1,#check2 do
					if(check2[i].name=="Shade") then
						check2[i]:sendAnimation(304)
						check2[i].attacker=target.ID
						check2[i]:removeHealth(100000000)
						mob.mapRegistry["shade1time"]=0
						mob.mapRegistry["shade2time"]=0
						mob.mapRegistry["shade3time"]=0
						mob.mapRegistry["shade4time"]=0
					end
				end
			end
			mob.mapRegistry["gatekeeperaoe"]=os.time()+70
		end
								

	end,

	on_death=function(mob,player)
		player:broadcast(-1,"The Gatekeeper has been slain, and the rift to the void begins to glow")
		mob.mapRegistry["gatekeeperengage"]=0
		mob.mapRegistry["gatekeeperengagetrigger"]=0			
		mob.mapRegistry["gatekeeperspeech"]=0			
		mob.mapRegistry["gatekeeperspeech2"]=0
		mob.mapRegistry["gatekeeperfrenzy"]=0
		mob.mapRegistry["gatekeeperstun"]=0
		mob.mapRegistry["gatekeeperaoe"]=0
		mob.mapRegistry["gatekeeperdead"]=1
		mob.mapRegistry["gatekeeperannounce"]=0
		mob.mapRegistry["gatekeepercounter"]=0
		mob.mapRegistry["gatekeeperattack"]=0
		mob.mapRegistry["gatekeeperlasthit"]=0
		local check = {}
		check = mob:getObjectsInArea(BL_PC)			
		if(#check>0) then
			for i=1 , #check do
				Player(check[i].ID):setDuration("gatekeeper_frenzy",0)
				Player(check[i].ID).registry["gatekeepervictory"]=1
			end
		end
		local checkmobalive= {}
		checkmobalive=mob:getObjectsInArea(BL_MOB)
		if(#checkmobalive>0) then
			for i=1,#checkmobalive do
				if(checkmobalive[i].name=="Shade" or checkmobalive[i].name=="Lost soul" ) then
					checkmobalive[i].attacker=player.ID
					checkmobalive[i]:removeHealth(100000000)
				end
			end
		end
		
		local lootchoice=math.random(1,100)		
		if(lootchoice<=35) then
			mob:dropItem("ancient_warden",1)
		elseif(lootchoice>35 and lootchoice<=55) then
			mob:dropItem("silver_ring",1)
		elseif(lootchoice>55 and lootchoice<=60) then
			mob:dropItem("recipe_runic_robes",1)
		elseif(lootchoice>60 and lootchoice<=65) then
			mob:dropItem("recipe_runic_gown",1)
		elseif(lootchoice>60 and lootchoice<=100) then			
			mob:dropItem("scholars_cloak",1)
		end
		mob:dropItem("tourmaline",1)
		mob:dropItem("runic_pendant",30)
	end	
}