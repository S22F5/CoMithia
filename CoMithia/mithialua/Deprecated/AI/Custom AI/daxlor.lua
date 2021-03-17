daxlor = {
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



	if(target.state~=1 and target.blType==BL_PC) then
		if(not target:hasDuration("daxlor_mark")) then
				target:sendMinitext("Daxlor starts focusing you and brands you with his mark!")
				target.registry["daxlormarkcount"]=0
				target:setDuration("daxlor_mark",40000)
				mob:talk(0,"Daxlor: Let's play, "..target.name.." !")
		elseif(target:hasDuration("daxlor_mark")) then
				target.registry["daxlormarkcount"]=target.registry["daxlormarkcount"]+5
				local dam=target.maxHealth*target.registry["daxlormarkcount"]/100
				if(target.registry["daxlormarkcount"]==25) then
					mob:talk(0,"Daxlor: Why you hit Daxlor? You be my new toy!")
				elseif(target.registry["daxlormarkcount"]==50) then
					mob:talk(0,"Daxlor: You not very good toy")
				elseif(target.registry["daxlormarkcount"]==75) then
					mob:talk(0,"Daxlor: Daxlor wants new toy now")
				elseif(target.registry["daxlormarkcount"]==100) then
					mob:talk(0,"Daxlor: You stop hit Daxlor, bad toy!")
				end
				target:sendAnimation(120)
				target:playSound(27)
				target:addHealth(-dam)
		end
	end

		if(ra==1 and os.time()>=target.mapRegistry["daxlorattack"]+5) then
			if(target.group~=nil) then	
				if(target.blType==BL_PC and #target.group>1 and ra==1) then
					local cho=math.random(1,#target.group)
						if(Player(target.group[cho]).state~=1 and Player(target.group[cho]).m==target.m and target.name~=Player(target.group[cho]).name) then
							local corner=math.random(1,4)
								mob:talk(0,"Daxlor: You go away now "..Player(target.group[cho]).name.." !")
								if(corner==1) then
									Player(target.group[cho]):warp(4008,2,10)
								elseif(corner==2) then
									Player(target.group[cho]):warp(4008,43,9)
								elseif(corner==3) then
									Player(target.group[cho]):warp(4008,46,44)
								elseif(corner==4) then
									Player(target.group[cho]):warp(4008,3,47)
								end
								local teledam=Player(target.group[cho]).maxHealth/3
								Player(target.group[cho]):addHealth(-teledam)
								
						end
					target.mapRegistry["daxlorattack"]=os.time()
				end
                	else
				if(ra==1 and target.state~=1) then
							local corner=math.random(1,4)
							mob:talk(0,"Daxlor: You go away now "..target.name.." !")
								if(corner==1) then
									target:warp(4008,2,10)
								elseif(corner==2) then
									target:warp(4008,43,9)
								elseif(corner==3) then
									target:warp(4008,46,44)
								elseif(corner==4) then
									target:warp(4008,3,47)
								end
								local teledam=target.maxHealth/3
								target:addHealth(-teledam)

						target.mapRegistry["daxlorattack"]=os.time()
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
		local gold=math.random(1700,2200)
		local rand=math.random(1,100)
		if(rand<=35) then
			mob:dropItem("shackles",1)
		elseif(rand>35 and rand<=55) then
			mob:dropItem("magic_rune",1)
		elseif(rand>55 and rand<=90) then
			mob:dropItem("runic_sword",1)
		else
			mob:dropItem(0,gold)
		end
		local item
		local invcheck=0
		local secondpiece=mob:getObjectsInArea(BL_PC)
			if(#secondpiece>0) then
				for z=1,#secondpiece do
					if(secondpiece[z].registry["gruzaraccessquest"]==1 and secondpiece[z].registry["runesecondpiecedrop"]==0) then
						for x=0,25 do
							item=secondpiece[z]:getInventoryItem(x)
							if(item==nil) then
								invcheck=invcheck+1
							end
						end
						if(invcheck>0) then
							secondpiece[z]:addItem("rune_second_piece",1)
							secondpiece[z]:sendMinitext("You defeat Daxlor and retrieve his Broken rune part!")
							secondpiece[z].registry["runesecondpiecedrop"]=1
						else
							secondpiece[z]:sendMinitext("You try to grab Daxlor's Broken rune part but have no room in your inventory!")
						end
					end
				end
			end


	end
	
}
