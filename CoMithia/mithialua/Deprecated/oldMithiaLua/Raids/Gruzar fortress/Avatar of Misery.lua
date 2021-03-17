avatar_of_misery = {
	move = function(mob,target)
		local moved=true
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y


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
			local checkmobalive= {}
			mob:addHealth(1000000000)
			checkmobalive=mob:getObjectsInArea(BL_MOB)
			if(#checkmobalive>0) then
				for z=1,#checkmobalive do
					if(checkmobalive[z].name=="Plasma ball") then
						checkmobalive[z].attacker=target.ID
						checkmobalive[z]:removeHealth(50000)
					end
				end
			end
			mob.mapRegistry["miseryengage"]=0
			mob.mapRegistry["miseryengagetrigger"]=0
			mob.mapRegistry["miseryspeech"]=0
		end

		local e= {}
		local f= {}
		local g= {}
		local h= {}
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

		if(target.mapRegistry["miseryengage"]<=os.time() and target.mapRegistry["miseryengagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				target.mapRegistry["miseryengage"]=os.time()
				target.mapRegistry["miseryengagetrigger"]=1
		end
		if(os.time()<target.mapRegistry["miseryengage"]+20 and os.time()>=target.mapRegistry["miseryengage"]+10 and target.mapRegistry["miseryspeech"]==0) then
				mob:talk(0,"Avatar of Misery: Have you come to defeat me ?")
				target.mapRegistry["miseryspeech"]=1
		end
		if(os.time()<target.mapRegistry["miseryengage"]+20 and os.time()>=target.mapRegistry["miseryengage"]+14 and target.mapRegistry["miseryspeech"]==1) then
				mob:talk(0,"Avatar of Misery: Hah, I wish you luck!")
				target.mapRegistry["miseryspeech"]=2
		end
		if(os.time()<target.mapRegistry["miseryengage"]+20 and os.time()>=target.mapRegistry["miseryengage"]) then
				mob:addHealth(10000000)
				return
		end
		
		if(os.time()>=target.mapRegistry["miseryengage"]+30 and os.time()>=target.mapRegistry["miseryaoe"]+4) then
				target.mapRegistry["miseryaoe"]=os.time()
				local aoe=mob:getObjectsInArea(BL_PC)
				if(#aoe>0) then
					for z=1,#aoe do
						if(aoe[z].state~=1) then
							aoe[z]:sendAnimation(349)
							aoe[z].attacker=0
							aoe[z]:removeHealthExtend(4000, 1, 1, 1, 1, 0)
						end
					end
				end
		end
		if(os.time()>=target.mapRegistry["miseryengage"]+30 and os.time()>=target.mapRegistry["miserysummon"]+30) then
				target.mapRegistry["miserysummon"]=os.time()
				local check=mob:getObjectsInArea(BL_MOB)
				local checkplasma=0
				if(#check>0) then
					for z=1,#check do
						if(check[z].name=="Plasma ball") then
							checkplasma=checkplasma+1
						end
					end
				end
				if(checkplasma==0) then	
					local aoe=mob:getObjectsInArea(BL_PC)
					local xmin=0
					local xmax=0
					local ymin=0
					local ymax=0
					if(#aoe>0) then
						xmin=aoe[1].x
						xmax=aoe[1].x
						ymin=aoe[1].y
						ymax=aoe[1].y
						for z=1,#aoe do
							if(aoe[z].x>xmax) then
								xmax=aoe[z].x
							end
							if(aoe[z].x<xmin) then
								xmin=aoe[z].x
							end
							if(aoe[z].y>ymax) then
								ymax=aoe[z].y
							end
							if(aoe[z].y<ymin) then
								ymin=aoe[z].y
							end
						end
					end
					for z=1,2 do
						destx=math.random(xmin,xmax)
						desty=math.random(ymin,ymax)
						mob:spawn(103,destx,desty,1)
					end
					target:broadcast(mob.m,"~Energy pulses around the room~")
				end
		end
		if(os.time()>=target.mapRegistry["miserysummon"]+15 and os.time()>=target.mapRegistry["miserysplit"]+25) then
				target.mapRegistry["miserysplit"]=os.time()
				local aoe=mob:getObjectsInArea(BL_MOB)
				if(#aoe>=33) then
					return
				end
				if(#aoe>0) then
					for z=1,#aoe do
						if(aoe[z].name=="Plasma ball") then
							mob:spawn(103,aoe[z].x,aoe[z].y,1)
						end
					end
				end
				target:broadcast(mob.m,"~The plasma balls split!~")

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
			mob.mapRegistry["miseryengage"]=0
			mob.mapRegistry["miseryengagetrigger"]=0
			mob.mapRegistry["miseryspeech"]=0
			local checkmobalive= {}
			checkmobalive=mob:getObjectsInArea(BL_MOB)
			if(#checkmobalive>0) then
				for z=1,#checkmobalive do
					if(checkmobalive[z].name=="Plasma ball") then
						checkmobalive[z].attacker=player.ID
						checkmobalive[z]:removeHealth(50000)
					end
				end
			end


			local craftdrop=math.random(1,100)
			if(craftdrop<=20) then
				mob:dropItem("recipe_reinforced_shears",1)
			end

			mob:dropItem("soulstone",math.random(75,150))
			local lootchoice=math.random(1,100)
			if(lootchoice<=10) then
				if(math.random(1,2)==1) then
					mob:dropItem("recipe_dark_mantle",1)
				else
					mob:dropItem("recipe_dark_drapery",1)
				end
			elseif(lootchoice>10 and lootchoice<=15) then
				mob:dropItem("recipe_black_pendant",1)
			elseif(lootchoice>15 and lootchoice<=30) then
				mob:dropItem("ancient_texts",1)
			elseif(lootchoice>30 and lootchoice<=55) then
				mob:dropItem("protectors_cape",1)
			elseif(lootchoice>55 and lootchoice<=75) then
				mob:dropItem("bandit_cover",1)
			elseif(lootchoice>75 and lootchoice<=100) then
				mob:dropItem("third_eye",1)
			end
	end
	
}
