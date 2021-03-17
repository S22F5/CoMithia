avatar_of_suffering = {
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
			mob.mapRegistry["sufferingengage"]=0
			mob.mapRegistry["sufferingengagetrigger"]=0
			mob.mapRegistry["sufferingbomb"]=0
			mob.mapRegistry["sufferingspeech"]=0
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

		if(mob.target>0) then
			threat.calcHighestThreat(mob)
			local block = mob:getBlock(mob.target)
			if (block.blType == BL_PC) then
				target = Player(mob.target)
			elseif (block.blType == BL_MOB) then
				target = Mob(mob.target)
			else
				mob:talk(2, "I have an invalid target, report me to a GM. (ID: "..mob.ID.." Target ID: "..mob.target)
			end
		end

		if(target.mapRegistry["sufferingengage"]<=os.time() and target.mapRegistry["sufferingengagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				target.mapRegistry["sufferingengage"]=os.time()
				target.mapRegistry["sufferingengagetrigger"]=1
		end
		if(os.time()<target.mapRegistry["sufferingengage"]+20 and os.time()>=target.mapRegistry["sufferingengage"]+10 and target.mapRegistry["sufferingspeech"]==0) then
				mob:talk(0,"Avatar of Suffering: You dare trespass into our fortress!...")
				target.mapRegistry["sufferingspeech"]=1
		end
		if(os.time()<target.mapRegistry["sufferingengage"]+20 and os.time()>=target.mapRegistry["sufferingengage"]+14 and target.mapRegistry["sufferingspeech"]==1) then
				mob:talk(0,"Avatar of Suffering: Now you will understand the true meaning of Suffering!")
				target.mapRegistry["sufferingspeech"]=2
		end
		if(os.time()<target.mapRegistry["sufferingengage"]+20 and os.time()>=target.mapRegistry["sufferingengage"]) then
				mob:addHealth(10000000)
				return
		end
		if(os.time()>=target.mapRegistry["sufferingbomb"] and os.time()>=target.mapRegistry["sufferingengage"]+20) then
			local find={}
			local ptable = {}
			for x=-10,10 do
				for y=-10,10 do
					find=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
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
				while Player(ptable[ra]).state==1 or Player(ptable[ra]).ID==target.mapRegistry["bomblasthit"] do
					ra=math.random(1,#ptable)
					count=count+1
					if(count==5) then
						break
					end
				end
				mob:sendAction(1,35)
				mob:talk(0,"Avatar of Suffering: Here, Hold this for me "..Player(ptable[ra]).name..".")
				target:broadcast(mob.m,""..Player(ptable[ra]).name.." has the bomb!!")
				Player(ptable[ra]):setDuration("bomb_spell",12000)
				target.mapRegistry["sufferingbomb"]=os.time()+20
				target.mapRegistry["bomblasthit"]=Player(ptable[ra]).ID
			end
		end
		if(os.time()>=target.mapRegistry["sufferingengage"]+20) then
			target:removeHealthExtend(10000, 1, 1, 1, 1, 0)
			if(#e>0) then
				for a=1,#e do
					if(e[a].state~=1) then
						e[a]:sendAnimation(301)
						e[a].attacker=mob.ID
						e[a]:removeHealthExtend(5000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#f>0) then
				for a=1,#f do
					if(f[a].state~=1) then
						f[a]:sendAnimation(301)
						f[a].attacker=mob.ID
						f[a]:removeHealthExtend(5000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#g>0) then
				for a=1,#g do
					if(g[a].state~=1) then
						g[a]:sendAnimation(301)
						g[a].attacker=mob.ID
						g[a]:removeHealthExtend(5000, 1, 1, 1, 1, 0)
					end
				end
			end
			if(#h>0) then
				for a=1,#h do
					if(h[a].state~=1) then
						h[a]:sendAnimation(301)
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
		mob.mapRegistry["sufferingengage"]=0
		mob.mapRegistry["sufferingengagetrigger"]=0
		mob.mapRegistry["sufferingbomb"]=0
		mob.mapRegistry["sufferingspeech"]=0



			local craftdrop=math.random(1,100)
			if(craftdrop<=20) then
				mob:dropItem("recipe_reinforced_axe",1)
			end

			mob:dropItem("soulstone",math.random(75,150))
			local lootchoice=math.random(1,100)
			if(lootchoice<=10) then
				if(math.random(1,2)==1) then
					mob:dropItem("recipe_dark_armor",1)
				else
					mob:dropItem("recipe_dark_armor_dress",1)
				end
			elseif(lootchoice>10 and lootchoice<=15) then
				mob:dropItem("recipe_barbed_choker",1)
			elseif(lootchoice>15 and lootchoice<=30) then
				mob:dropItem("light_shield",1)
			elseif(lootchoice>30 and lootchoice<=55) then
				mob:dropItem("magicians_cape",1)
			elseif(lootchoice>55 and lootchoice<=75) then
				mob:dropItem("natures_guide",1)
			elseif(lootchoice>75 and lootchoice<=100) then
				mob:dropItem("battle_horn",1)
			end


	end
	
}
