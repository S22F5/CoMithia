gredinch = {
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
			mob.mapRegistry["gredinchengage"]=0
			mob.mapRegistry["gredinchannounce"]=0
			mob.mapRegistry["gredinchengagetrigger"]=0			
			mob.mapRegistry["gredinchspeech"]=0			
			mob.mapRegistry["gredinchspeech2"]=0
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

		if(target.mapRegistry["gredinchengage"]<=os.time() and target.mapRegistry["gredinchengagetrigger"]==0) then
			target.mapRegistry["gredinchengage"]=os.time()
			target.mapRegistry["gredinchengagetrigger"]=1
		end
		if(os.time()<target.mapRegistry["gredinchengage"]+10) then
			mob.side=2
			mob:sendSide()
			return
		end
		if(os.time()>=target.mapRegistry["gredinchengage"]+10 and os.time()<target.mapRegistry["gredinchengage"]+15 and target.mapRegistry["gredinchspeech"]==0) then
			mob:talk(0,"Gredinch: What are you mortals doing here...")
			target.mapRegistry["gredinchspeech"]=1
		end
		if(os.time()>=target.mapRegistry["gredinchengage"]+15 and os.time()<target.mapRegistry["gredinchengage"]+20 and target.mapRegistry["gredinchspeech2"]==0) then
			mob:talk(0,"Gredinch: Pathetic fools, Christmas will be mine!!")
			target.mapRegistry["gredinchspeech2"]=1
		end
		if(os.time()>=target.mapRegistry["gredinchengage"]+10 and os.time()<target.mapRegistry["gredinchengage"]+20) then
			mob:addHealth(10000000000)
			mob.side=18
			mob:sendSide()
			return
		end
		
		if(os.time()>=target.mapRegistry["gredinchaoe"] and os.time()>=target.mapRegistry["gredinchengage"]+30 and mob.health >= mob.maxHealth*0.05) then
			local check = {}		
			local anim = 187
			mob:sendAction(2,5)
			mob:talk(1,"Gredinch: Dozastamus!!")	
			for x=-15,15 do
				for y=-15,15 do
					check = mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
					if(not(x==0 and y==0)) then
						mob:sendAnimationXY(anim,mob.x+x,mob.y+y)
					end
						if(#check>0) then
							if(Player(check[1].ID).state==0)then
								Player(check[1].ID):removeHealth(check[1].maxHealth*0.33)
							end
						end						
				end
			end
			mob.mapRegistry["gredinchaoe"]=os.time()+30
			return
		end
		
		if(mob.health <= mob.maxHealth*0.05) then	
			if(mob.mapRegistry["gredinchannounce"]==0) then
				target:broadcast(mob.m,"Gredinch enters a bersekers rage")
				mob.mapRegistry["gredinchannounce"]=1
			end
			target:removeHealth(target.maxHealth*0.15)
		end
		
		
		
		
		if(os.time()>=target.mapRegistry["gredinchengage"]+20) then
			target:removeHealthExtend(27500, 1, 1, 1, 1, 0)
			if(#e>0) then
				for a=1,#e do
					if(e[a].state~=1) then
						e[a]:sendAnimation(46)
						e[a].attacker=mob.ID
						e[a]:removeHealthExtend(8000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#f>0) then
				for a=1,#f do
					if(f[a].state~=1) then
						f[a]:sendAnimation(46)
						f[a].attacker=mob.ID
						f[a]:removeHealthExtend(8000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#g>0) then
				for a=1,#g do
					if(g[a].state~=1) then
						g[a]:sendAnimation(46)
						g[a].attacker=mob.ID
						g[a]:removeHealthExtend(8000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#h>0) then
				for a=1,#h do
					if(h[a].state~=1) then
						h[a]:sendAnimation(46)
						h[a].attacker=mob.ID
						h[a]:removeHealthExtend(8000, 1, 1, 1, 1, 0)
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
		player:broadcast(-1,"Gredinch has been slain, and Christmas is saved!")
			mob.mapRegistry["gredinchengage"]=0
			mob.mapRegistry["gredinchengagetrigger"]=0			
			mob.mapRegistry["gredinchspeech"]=0			
			mob.mapRegistry["gredinchspeech2"]=0

			local dropcheck=mob:getObjectsInArea(BL_PC)
			if(#dropcheck>0) then
				for x=1,#dropcheck do
					
						dropcheck[x]:giveXP(math.pow(dropcheck[x].level,4))
						dropcheck[x].registry["gredinchkill"]=2
						dropcheck[x]:sendStatus()
					
				end
			end
		local lootchoice=math.random(1,100)
		if(lootchoice<=50) then
			mob:dropItem("santa_coat",1)
		elseif(lootchoice>50 and lootchoice<=100) then
			mob:dropItem("santa_hat",1)
		end
		
	end
	
}