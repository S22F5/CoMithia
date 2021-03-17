avatar_of_pain = {
	move = function(mob,target)
		local moved=true
		local mmob=mob.m
		local xmob=mob.x
		local ymob=mob.y
		local ra=math.random(1,20)
		local rand=0
		local check = {}
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
			mob.mapRegistry["painengage"]=0
			mob.mapRegistry["painengagetrigger"]=0
			mob.mapRegistry["painspeech"]=0
			mob.mapRegistry["painwarp"]=0
			mob.mapRegistry["painattack"]=0
			mob:addHealth(1000000000)
			return
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

		if(target.mapRegistry["painengage"]<=os.time() and target.mapRegistry["painengagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				target.mapRegistry["painengage"]=os.time()
				target.mapRegistry["painengagetrigger"]=1
		end
		if(os.time()<target.mapRegistry["painengage"]+20 and os.time()>=target.mapRegistry["painengage"]+10 and target.mapRegistry["painspeech"]==0) then
				mob:talk(0,"Avatar of Pain: So many lives wasted...")
				target.mapRegistry["painspeech"]=1
		end
		if(os.time()<target.mapRegistry["painengage"]+20 and os.time()>=target.mapRegistry["painengage"]+14 and target.mapRegistry["painspeech"]==1) then
				mob:talk(0,"Avatar of Pain: And yet your kind keeps on coming!")
				target.mapRegistry["painspeech"]=2
		end
		if(os.time()<target.mapRegistry["painengage"]+20 and os.time()>=target.mapRegistry["painengage"]) then
				mob:addHealth(10000000)
				return
		end


		if(os.time()>=target.mapRegistry["painattack"] and os.time()>=target.mapRegistry["painwarp"]+10) then
			target.mapRegistry["painattack"]=os.time()+2


			local find={}
			local ptable = {}
					find=target:getObjectsInArea(BL_PC)
					if(#find>0) then
						for z=1,#find do
							if(find[z].state~=1) then
								table.insert(ptable,""..find[z].ID.."")
							end
						end
					end
			if(#ptable)>0 then
				local ra=math.random(1,#ptable)
				local checkplayer={}
				for x=-1,1 do
					for y=-1,1 do
						checkplayer=mob:getObjectsInCell(mob.m,Player(ptable[ra]).x+x,Player(ptable[ra]).y+y,BL_PC)
						if(#checkplayer>0) then
							for z=1,#checkplayer do
								if(checkplayer[z].state~=1) then
									checkplayer[z]:sendAnimation(43)
									checkplayer[z].attacker=mob.ID
									checkplayer[z]:removeHealthExtend(15000, 1, 1, 1, 1, 0)
								end
							end
						end
					end
				end
			end
			target:playSound(116)
		end

		if(os.time()>=mob.mapRegistry["painengage"] and os.time()<=target.mapRegistry["painwarp"]+2) then
					return
		end

		if(os.time()>=target.mapRegistry["painwarp"]+45) then
			target.mapRegistry["painwarp"]=os.time()
			for x=-20,20 do
				for y=-20,20 do
					check=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
					if(#check>0) then
						for z=1,#check do
							if(check[z].state~=1 and check[z].m==mob.m) then
								check[z]:warp(mob.m,mob.x,mob.y)
								confusion_mob.cast(mob,check[z])
							end
						end
					end
				end
			end
			mob:talk(0,"Avatar of Pain: Come to me, little minions!")
		end
		target:removeHealthExtend(target.maxHealth*0.4, 1, 1, 1, 1, 0)			
								
					
						






		
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
		mob.mapRegistry["painengage"]=0
		mob.mapRegistry["painengagetrigger"]=0
		mob.mapRegistry["painspeech"]=0
		mob.mapRegistry["painwarp"]=0
		mob.mapRegistry["painattack"]=0


			local craftdrop=math.random(1,100)
			if(craftdrop<=20) then
				mob:dropItem("recipe_reinforced_mining_pick",1)
			end

			mob:dropItem("soulstone",math.random(75,150))
			local lootchoice=math.random(1,100)
			if(lootchoice<=10) then
				if(math.random(1,2)==1) then
					mob:dropItem("recipe_dark_platemail",1)
				else
					mob:dropItem("recipe_dark_plate_dress",1)
				end
			elseif(lootchoice>10 and lootchoice<=15) then
				mob:dropItem("recipe_archaic_necklace",1)
			elseif(lootchoice>15 and lootchoice<=30) then
				mob:dropItem("spell_book",1)
			elseif(lootchoice>30 and lootchoice<=55) then
				mob:dropItem("healers_cape",1)
			elseif(lootchoice>55 and lootchoice<=75) then
				mob:dropItem("battleguard",1)
			elseif(lootchoice>75 and lootchoice<=100) then
				mob:dropItem("thugs_headband",1)
			end

	end
	
}
