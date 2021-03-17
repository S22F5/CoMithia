shadow_fighter = {
	move = function(mob,target)
		local moved=true	
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
			local lootchoice=math.random(1,3000)
			if(lootchoice==1) then
				mob:dropItem("sword_of_healing",1)
			end


		if(player.group~=nil) then
			for x=1,#player.group do
				if((Player(player.group[x]).state~=1 and (Player(player.group[x]).m==40001 or Player(player.group[x]).m==40002 or Player(player.group[x]).m==40003 or Player(player.group[x]).m==17)) and Player(player.group[x]).m==player.m) then
					Player(player.group[x]):giveXP(math.floor(((math.pow(Player(player.group[x]).level,4)/30)/2)*(1+Player(player.group[x]).registry["currenttier"]/5)))
					Player(player.group[x]):sendStatus()
				end
			end
		else
			player:giveXP(math.floor(((math.pow(player.level,4)/30)/2)*(1+player.registry["currenttier"]/5)))
			player:sendStatus()
		end
			
	end
	
}

shadow_lurker = {
	move = function(mob,target)
		local moved=true	
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
			local lootchoice=math.random(1,3000)
			if(lootchoice==1) then
				mob:dropItem("sword_of_healing",1)
			end


		if(player.group~=nil) then
			for x=1,#player.group do
				if((Player(player.group[x]).state~=1 and (Player(player.group[x]).m==40001 or Player(player.group[x]).m==40002 or Player(player.group[x]).m==40003 or Player(player.group[x]).m==17)) and Player(player.group[x]).m==player.m) then
					Player(player.group[x]):giveXP(math.floor(((math.pow(Player(player.group[x]).level,4)/30)/2)*(1+Player(player.group[x]).registry["currenttier"]/5)))
					Player(player.group[x]):sendStatus()
				end
			end
		else
			player:giveXP(math.floor(((math.pow(player.level,4)/30)/2)*(1+player.registry["currenttier"]/5)))
			player:sendStatus()
		end
			
	end
	
}

headless = {
	move = function(mob,target)
		local moved=true	
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

		local chance=math.random(1,100)
		if(chance<=30) then
			local scroll=math.random(1,6)
			if(scroll==1) then
				mob:dropItem("scroll_of_power",1)
			elseif(scroll==2) then
				mob:dropItem("scroll_of_quickness",1)
			elseif(scroll==3) then
				mob:dropItem("scroll_of_replenishment",1)
			elseif(scroll==4) then
				mob:dropItem("scroll_of_curse",1)
			elseif(scroll==5) then
				mob:dropItem("scroll_of_vitality",1)
			elseif(scroll==6) then
				mob:dropItem("scroll_of_wrath",1)
			end
		end

		if(player.group~=nil) then
			for x=1,#player.group do
				if((Player(player.group[x]).state~=1 and (Player(player.group[x]).m==40001 or Player(player.group[x]).m==40002 or Player(player.group[x]).m==40003 or Player(player.group[x]).m==17)) and Player(player.group[x]).m==player.m) then
					Player(player.group[x]):giveXP(math.floor((math.pow(Player(player.group[x]).level,4)/30)/2)*3)
					Player(player.group[x]):sendStatus()
				end
			end
		else
			player:giveXP(math.floor((math.pow(player.level,4)/30)/2)*3)
			player:sendStatus()
		end
			
	end
	
}

ghost_of_harmsorgi = {
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
			mob.mapRegistry["harmsorgighost"]=0			
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


		
		
			local check = {}		
			local anim = 55

			if(mob.mapRegistry["harmsorgighost"]%11==1) then
				check = mob:getObjectsInArea(BL_PC)
				if(#check>0) then
					for i=1,#check do
						if(Player(check[i].ID).state==0) then
							Player(check[i].ID):sendAnimation(anim)
							Player(check[i].ID):removeHealth(1000)			
						end
					end
				end
			end		
			mob.mapRegistry["harmsorgighost"]=1+mob.mapRegistry["harmsorgighost"] 				
		
		local moved=true	
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
		mob.mapRegistry["ghostharmsorgiaoe"]=0
		local chance=math.random(1,100)
		if(chance<=30) then
			local scroll=math.random(1,6)
			if(scroll==1) then
				mob:dropItem("scroll_of_power",1)
			elseif(scroll==2) then
				mob:dropItem("scroll_of_quickness",1)
			elseif(scroll==3) then
				mob:dropItem("scroll_of_replenishment",1)
			elseif(scroll==4) then
				mob:dropItem("scroll_of_curse",1)
			elseif(scroll==5) then
				mob:dropItem("scroll_of_vitality",1)
			elseif(scroll==6) then
				mob:dropItem("scroll_of_wrath",1)
			end
		end

		if(player.group~=nil) then
			for x=1,#player.group do
				if((Player(player.group[x]).state~=1 and (Player(player.group[x]).m==40001 or Player(player.group[x]).m==40002 or Player(player.group[x]).m==40003 or Player(player.group[x]).m==17)) and Player(player.group[x]).m==player.m) then
					Player(player.group[x]):giveXP(math.floor((math.pow(Player(player.group[x]).level,4)/30)/2)*320)
					Player(player.group[x]):sendStatus()
				end
			end
		else
			player:giveXP(math.floor((math.pow(player.level,4)/30)/2)*320)
			player:sendStatus()
		end
			
	end
	
}