avatar_of_agony = {
	move = function(mob,target)
		local moved=true
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
		local ra=math.random(1,20)
		local countsides=0
		local stompdamage=150000
		local e= {}
		local f= {}
		local g= {}
		local h= {}
		local check = {}


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
			mob:addHealth(1000000000)
			mob.mapRegistry["agonyengage"]=0
			mob.mapRegistry["agonyengagetrigger"]=0
			mob.mapRegistry["agonyspeech"]=0
			mob.mapRegistry["agonywarp"]=0
			mob.mapRegistry["agonyattack"]=0
			mob.mapRegistry["agonyenragetimer"]=0
			mob.mapRegistry["agonyattack"]=0
			mob.mapRegistry["agonyenrageticks"]=0
			mob.mapRegistry["agonymulti"]=0
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


		if(mob.mapRegistry["agonyengage"]<=os.time() and mob.mapRegistry["agonyengagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				mob.mapRegistry["agonyengage"]=os.time()
				mob.mapRegistry["agonyengagetrigger"]=1
				mob:talk(0,"Avatar of Agony: Ah! Some new adventurers to crush!")
				target.mapRegistry["agonyenrageticks"]=3
		end
		if(os.time()<target.mapRegistry["agonyengage"]+20 and os.time()>=target.mapRegistry["agonyengage"]+10 and target.mapRegistry["agonyspeech"]==0) then
				mob:talk(0,"Avatar of Agony: It's time to play ball...")
				mob.mapRegistry["agonyspeech"]=1
		end
		if(os.time()<target.mapRegistry["agonyengage"]+20 and os.time()>=target.mapRegistry["agonyengage"]+14 and target.mapRegistry["agonyspeech"]==1) then
				mob.mapRegistry["agonyenragetimer"]=os.time()+(60*15)
				target:broadcast(mmob,"-10 minutes left before enrage-")
				mob:talk(0,"Avatar of Agony: With all of your heads!")
				mob.mapRegistry["agonyspeech"]=2
		end
		if(os.time()<target.mapRegistry["agonyengage"]+20 and os.time()>=target.mapRegistry["agonyengage"]) then
				mob:addHealth(10000000)
				return
		end

		if(target.mapRegistry["agonyenrageticks"]==3 and os.time()>=(target.mapRegistry["agonyenragetimer"]-(60*10))) then
					target.mapRegistry["agonyenrageticks"]=2
					target:broadcast(mmob,"-5 minutes left before enrage-")
		end

		if(target.mapRegistry["agonyenrageticks"]==2 and os.time()>=(target.mapRegistry["agonyenragetimer"]-(60*6))) then
					target.mapRegistry["agonyenrageticks"]=1
					target:broadcast(mmob,"-1 minute left before enrage-")
		end

		if(target.mapRegistry["agonyenrageticks"]==1 and os.time()>=(target.mapRegistry["agonyenragetimer"]-(60*5))) then
					target.mapRegistry["agonyenrageticks"]=0
					mob:talk(0,"Avatar of Agony: I am tired of you now, fools!")
					target:broadcast(mmob,"-Avatar of Agony enrages!-")
		end

		if(os.time()>=(target.mapRegistry["agonyenragetimer"]-(60*5)) and target.state~=1) then
				target:removeHealth(target.maxHealth/2)
		end

		if(target.mapRegistry["agonyattack"]<=os.time() and os.time()>=(target.mapRegistry["agonyenragetimer"]-885) and os.time()>=target.mapRegistry["agonywarp"]+10) then
			if(#e>0) then
				if(e[1].state~=1) then
					countsides=countsides+1
				end
			end
			if(#f>0) then
				if(f[1].state~=1) then
					countsides=countsides+1
				end
			end
			if(#g>0) then
				if(g[1].state~=1) then
					countsides=countsides+1
				end
			end
			if(#h>0) then
				if(h[1].state~=1) then
					countsides=countsides+1
				end
			end
		
			if(mob.mapRegistry["agonymulti"]==4) then
				mob.mapRegistry["agonymulti"]=0
			end
			local grpdam=0
			if(mob.mapRegistry["agonymulti"]==0) then
				grpdam=8000
			elseif(mob.mapRegistry["agonymulti"]==1) then
				grpdam=12000
			elseif(mob.mapRegistry["agonymulti"]==2) then
				grpdam=16000
			elseif(mob.mapRegistry["agonymulti"]==3) then
				grpdam=20000
			end
			if(countsides==0) then
				for x=-30,30 do
					for y=-30,30 do
						check=target:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
						if(#check>0) then
							for z=1,#check do
								if(check[z].state~=1 and check[z].m==mob.m) then
									check[z]:sendAnimation(287)
									check[z].attacker=mob.ID
									check[z]:removeHealth(grpdam)
								end
							end
						end
					end
				end
				mob.mapRegistry["agonymulti"]=mob.mapRegistry["agonymulti"]+1
			end
			if(countsides~=0) then
				stompdamage=stompdamage/countsides
			end

			target:playSound(727)



			if(#e>0) then
				if(e[1].state~=1) then
					e[1]:sendAnimation(287)
					e[1].attacker=mob.ID
					e[1]:removeHealthExtend(stompdamage, 1, 1, 1, 1, 0)
				end
			end
			if(#f>0) then
				if(f[1].state~=1) then
					f[1]:sendAnimation(287)
					f[1].attacker=mob.ID
					f[1]:removeHealthExtend(stompdamage, 1, 1, 1, 1, 0)
				end
			end
			if(#g>0) then
				if(g[1].state~=1) then
					g[1]:sendAnimation(287)
					g[1].attacker=mob.ID
					g[1]:removeHealthExtend(stompdamage, 1, 1, 1, 1, 0)
				end
			end
			if(#h>0) then
				if(h[1].state~=1) then
					h[1]:sendAnimation(287)
					h[1].attacker=mob.ID
					h[1]:removeHealthExtend(stompdamage, 1, 1, 1, 1, 0)
				end
			end

			mob:talk(2,"STOMP~~!")
			mob:sendAnimation(61)
			target.mapRegistry["agonyattack"]=os.time()+4
		end


		if(target.mapRegistry["agonywarp"]+30<=os.time() and os.time()>=(target.mapRegistry["agonyenragetimer"]-870)) then
				local xmin=0
				local xmax=0
				local ymin=0
				local ymax=0

				target.mapRegistry["agonywarp"]=os.time()
				local check=mob:getObjectsInArea(BL_PC)
				if(#check>0) then
					xmin=check[1].x
					xmax=check[1].x
					ymin=check[1].y
					ymax=check[1].y
					for z=1,#check do

						if(check[z].x>xmax) then
							xmax=check[z].x
						end
						if(check[z].x<xmin) then
							xmin=check[z].x
						end
						if(check[z].y>ymax) then
							ymax=check[z].y
						end
						if(check[z].y<ymin) then
							ymin=check[z].y
						end
						--mob:talk(0,""..xmax.."")
					end
					for z=1,#check do
						local breakcheck=0
						local destx=math.random(xmin,xmax)
						local desty=math.random(ymin,ymax)
						while getObject(mob.m,destx,desty)~=0 do
							destx=math.random(xmin,xmax)
							desty=math.random(ymin,ymax)
							breakcheck=breakcheck+1
							if(breakcheck==5) then
								break
							end
						end
							
						check[z]:warp(mob.m,destx,desty)
					end	
					mob:talk(0,"Avatar of Agony: The Agony falls upon you now!")
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
			mob.mapRegistry["agonyengage"]=0
			mob.mapRegistry["agonyengagetrigger"]=0
			mob.mapRegistry["agonyspeech"]=0
			mob.mapRegistry["agonywarp"]=0
			mob.mapRegistry["agonyattack"]=0
			mob.mapRegistry["agonyenragetimer"]=0
			mob.mapRegistry["agonyattack"]=0
			mob.mapRegistry["agonyenrageticks"]=0
			mob.mapRegistry["agonymulti"]=0

			--local craftdrop=math.random(1,100)
			--if(craftdrop<=20) then
			--	mob:dropItem("recipe_reinforced_scythe",1)
			--end

			mob:dropItem("soulstone",math.random(75,150))
			local lootchoice=math.random(1,100)
			if(lootchoice<=10) then
				if(math.random(1,2)==1) then
					mob:dropItem("recipe_dark_clothes",1)
				else
					mob:dropItem("recipe_dark_skirt",1)
				end
			elseif(lootchoice>10 and lootchoice<=15) then
				mob:dropItem("recipe_mallys_desire",1)
			elseif(lootchoice>15 and lootchoice<=30) then
				mob:dropItem("holy_barrier",1)
			elseif(lootchoice>30 and lootchoice<=55) then
				mob:dropItem("swift_cape",1)
			elseif(lootchoice>55 and lootchoice<=75) then
				mob:dropItem("dark_command",1)
			elseif(lootchoice>75 and lootchoice<=100) then
				mob:dropItem("wisdom_of_gods",1)
			end
			
			
			
			
			



	end
	
}
