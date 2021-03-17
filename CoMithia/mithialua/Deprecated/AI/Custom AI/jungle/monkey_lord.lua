monkey_lord = {
	move = function(mob,target)
		local moved=true
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
		local ra=math.random(1,20)
		local e= {}
		local f= {}
		local g= {}
		local h= {}


		local checkplayeralive = {}
		local checkalive=0
		for x=-25,25 do
			for y=-25,25 do
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
			mob.mapRegistry["monkeyengage"]=0
			mob.mapRegistry["monkeyengagetrigger"]=0
			mob:addHealth(1000000000)
		end


		e=target:getObjectsInCell(mmob,xmob+1,ymob,BL_PC)
		f=target:getObjectsInCell(mmob,xmob,ymob-1,BL_PC)
		g=target:getObjectsInCell(mmob,xmob-1,ymob,BL_PC)
		h=target:getObjectsInCell(mmob,xmob,ymob+1,BL_PC)

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


	

		if(mob.mapRegistry["monkeyengage"]<=os.time() and mob.mapRegistry["monkeyengagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				mob.mapRegistry["monkeyengage"]=os.time()
				mob.mapRegistry["monkeyengagetrigger"]=1
		end
		if(os.time()<mob.mapRegistry["monkeyengage"]+5 and os.time()>=mob.mapRegistry["monkeyengage"]) then
				return
		end
		if(os.time()>mob.mapRegistry["monkeyengage"]+30 and os.time()>=mob.mapRegistry["monkeyattack"]) then
			local find={}
			local ptable = {}
			for x=-10,10 do
				for y=-10,10 do
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
				mob:sendAction(1,35)
				Player(ptable[ra]):sendAnimation(346)
				Player(ptable[ra]):setDuration("banana_power",15000)
				Player(ptable[ra]).registry["bananapowertick"]=0
				mob.mapRegistry["monkeyattack"]=os.time()+30
				mob:talk(0,"Monkey lord: The Power of the Banana compels you!")
			end
		end
		target:removeHealthExtend(target.maxHealth/2, 1, 1, 1, 1, 0)



		
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
		mob.mapRegistry["monkeyengage"]=0
		mob.mapRegistry["monkeyengagetrigger"]=0

		local ra=math.random(1,100)
		local a=math.random(20000,25000)
		local c=math.random(5,15)
		if(ra<=15) then
			mob:dropItem("banana_sword",1)
		elseif(ra>15 and ra<=60) then
			mob:dropItem("tigers_eye",c)
		elseif(ra>60 and ra<=75) then
			mob:dropItem("tourmaline",1)
		else
			mob:dropItem(0,a)
		end

	end
	
}
