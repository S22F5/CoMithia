harmsorgi = {
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
			mob.mapRegistry["harmsorgiengage"]=0
			mob.mapRegistry["harmsorgiengagetrigger"]=0
			mob.mapRegistry["harmsorgispeech"]=0
			mob.mapRegistry["harmsorgienragetimer"]=0
			mob.mapRegistry["harmsorgiempowerment"]=0
			mob.mapRegistry["harmsorgiaoe"]=0
			mob.mapRegistry["harmsorgiwarp"]=0
			mob.mapRegistry["harmsorgienrageticks"]=3
			local checkstone=mob:getObjectsInArea(BL_MOB)
			if(#checkstone>0) then
				for x=1,#checkstone do
					if(checkstone[x].name=="Stone of Empowerment") then
						checkstone[x].attacker=target.ID
						checkstone[x]:removeHealth(1000000000)
						
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

		
		if(mob.mapRegistry["harmsorgiengage"]<=os.time() and mob.mapRegistry["harmsorgiengagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				mob.mapRegistry["harmsorgiengage"]=os.time()
				mob.mapRegistry["harmsorgiengagetrigger"]=1
				mob:talk(0,"Harmsorgi: I have been trapped down here for many years...")
				target.mapRegistry["harmsorgienrageticks"]=3
		end
		if(os.time()<target.mapRegistry["harmsorgiengage"]+20 and os.time()>=target.mapRegistry["harmsorgiengage"]+10 and target.mapRegistry["harmsorgispeech"]==0) then
				mob:talk(0,"Harmsorgi: Nobody came to rescue to me...")
				mob.mapRegistry["harmsorgispeech"]=1
		end
		if(os.time()<target.mapRegistry["harmsorgiengage"]+20 and os.time()>=target.mapRegistry["harmsorgiengage"]+14 and target.mapRegistry["harmsorgispeech"]==1) then
				mob.mapRegistry["harmsorgienragetimer"]=os.time()+(60*6)
				mob:talk(0,"Harmsorgi: NOW, I WILL ESCAPE!")
				target:broadcast(mmob,"-6 minutes left before enrage-")
				mob.mapRegistry["harmsorgispeech"]=2
		end
		if(os.time()<target.mapRegistry["harmsorgiengage"]+14 and os.time()>=target.mapRegistry["harmsorgiengage"]) then
				mob:addHealth(10000000)
				return
		end

		if(target.mapRegistry["harmsorgienrageticks"]==3 and os.time()>=(target.mapRegistry["harmsorgienragetimer"]-(60*3))) then
					target.mapRegistry["harmsorgienrageticks"]=2
					target:broadcast(mmob,"-3 minutes left before enrage-")
		end

		if(target.mapRegistry["harmsorgienrageticks"]==2 and os.time()>=(target.mapRegistry["harmsorgienragetimer"]-(60*1))) then
					target.mapRegistry["harmsorgienrageticks"]=1
					target:broadcast(mmob,"-1 minute left before enrage-")
		end

		if(target.mapRegistry["harmsorgienrageticks"]==1 and os.time()>=target.mapRegistry["harmsorgienragetimer"]) then
					target.mapRegistry["harmsorgienrageticks"]=0
					mob:talk(0,"Harmsorgi: Pathetic Weaklings, enough of you!")
					target:broadcast(mmob,"-Harmsorgi enrages!-")
		end

		if(target.mapRegistry["harmsorgienrageticks"]==0 and target.state~=1) then
				target:removeHealth(target.maxHealth)
		end

		if(os.time()>target.mapRegistry["harmsorgiengage"]+30) then
			if(os.time()>target.mapRegistry["harmsorgiempowerment"]+15) then
				target.mapRegistry["harmsorgiempowerment"]=os.time()
				local checkspawnx=math.random(1,14)
				local checkspawny=math.random(3,12)
				mob:spawn(168,checkspawnx,checkspawny,1)
				mob:talk(0,"Harmsorgi: I will gather energy from those stones!")
			end
		end



		local checkstonesnumber=0
		local checkstones = mob:getObjectsInArea(BL_MOB)
		if(#checkstones>0) then
			for x=1,#checkstones do
				if(checkstones[x].name=="Stone of Empowerment") then
					checkstonesnumber=checkstonesnumber+1
				end
			end
		end

		if(os.time()>mob.mapRegistry["harmsorgiengage"]+20) then
			if(os.time()>mob.mapRegistry["harmsorgiaoe"]+10) then
				mob.mapRegistry["harmsorgiaoe"]=os.time()
				local aoecheck = mob:getObjectsInArea(BL_PC)
				if(#aoecheck>0) then
					for x=1,#aoecheck do
						if(aoecheck[x].state~=1) then
							aoecheck[x]:sendAnimation(136)
							aoecheck[x]:playSound(24)
							aoecheck[x]:removeHealth(aoecheck[x].maxHealth*(0.03+(0.05*checkstonesnumber)))
						end
					end
				end
							
			end
		end

		if(os.time()>mob.mapRegistry["harmsorgiengage"]+30 and mob.health>1400000) then
			if(os.time()>mob.mapRegistry["harmsorgiwarp"]+60) then
				mob.mapRegistry["harmsorgiwarp"]=os.time()
				local aoecheck = mob:getObjectsInArea(BL_PC)
				local warriortable = {}
				local roguetable = {}
				local magetable = {}
				local poettable = {}
				if(#aoecheck>0) then
					for x=1,#aoecheck do
						if(aoecheck[x].state~=1 and aoecheck[x].classBase==1) then
							table.insert(warriortable,""..aoecheck[x].ID.."")
						elseif(aoecheck[x].state~=1 and aoecheck[x].classBase==2) then
							table.insert(roguetable,""..aoecheck[x].ID.."")
						elseif(aoecheck[x].state~=1 and aoecheck[x].classBase==3) then
							table.insert(magetable,""..aoecheck[x].ID.."")
						elseif(aoecheck[x].state~=1 and aoecheck[x].classBase==4) then
							table.insert(poettable,""..aoecheck[x].ID.."")
						end
					end
				end
				if(#warriortable>1) then
					local chance=math.random(1,#warriortable)
					Player(warriortable[chance]):warp(40003,math.random(3,14),math.random(3,12))
					Player(warriortable[chance]):sendMinitext("Harmsorgi sends you flying down through a rift on the ground!")
				end
				if(#roguetable>1) then
					local chance=math.random(1,#roguetable)
					Player(roguetable[chance]):warp(40003,math.random(3,14),math.random(3,12))
					Player(roguetable[chance]):sendMinitext("Harmsorgi sends you flying down through a rift on the ground!")
				end
				if(#magetable>1) then
					local chance=math.random(1,#magetable)
					Player(magetable[chance]):warp(40003,math.random(3,14),math.random(3,12))
					Player(magetable[chance]):sendMinitext("Harmsorgi sends you flying down through a rift on the ground!")
				end
				if(#poettable>1) then
					local chance=math.random(1,#poettable)
					Player(poettable[chance]):warp(40003,math.random(3,14),math.random(3,12))
					Player(poettable[chance]):sendMinitext("Harmsorgi sends you flying down through a rift on the ground!")
				end
				local checkplayer= {}
				for x=0,15 do
					for y=0,13 do
						checkplayer=mob:getObjectsInCell(40003,x,y,BL_PC)
						if(#checkplayer>0) then
							local checkmob=checkplayer[1]:getObjectsInArea(BL_MOB)
							if(#checkmob<2) then
								for z=#checkmob+1,2 do
									checkplayer[1]:spawn(170,math.random(3,14),math.random(3,12),1)
								end
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

			local moved=FindCoords(mob,target,1)
			if(moved) then
				--We are right next to them, so attack!		
				mob:attackIT(target,mob.might*(checkstonesnumber+1),mob.might*(checkstonesnumber+1)/2)
			else
				target.attacker=mob.ID
				target:removeHealthExtend(math.random((mob.might*(checkstonesnumber+1)/2),(mob.might*(checkstonesnumber+1))), 1, 1, 1, 1, 0)
			end
		end
		

		
	end,

	on_death=function(mob,player)
			mob:addHealth(1000000000)
			mob.mapRegistry["harmsorgiengage"]=0
			mob.mapRegistry["harmsorgiengagetrigger"]=0
			mob.mapRegistry["harmsorgispeech"]=0
			mob.mapRegistry["harmsorgienragetimer"]=0
			mob.mapRegistry["harmsorgiempowerment"]=0
			mob.mapRegistry["harmsorgiaoe"]=0
			mob.mapRegistry["harmsorgiwarp"]=0
			mob.mapRegistry["harmsorgienrageticks"]=3
			mob:dropItem(0,math.random(10000,50000))
			local checkdrop=math.random(1,2)

			local checkstone=mob:getObjectsInArea(BL_MOB)
			if(#checkstone>0) then
				for x=1,#checkstone do
					if(checkstone[x].name=="Stone of Empowerment") then
						checkstone[x].attacker=player.ID
						checkstone[x]:removeHealth(1000000000)
						
					end
				end
			end

			local dropcheck=mob:getObjectsInArea(BL_PC)
			if(#dropcheck>0) then
				for x=1,#dropcheck do
					dropcheck[x]:giveXP(math.pow(dropcheck[x].level,4))
					dropcheck[x]:sendStatus()
					if(checkdrop==1) then
						dropcheck[x]:addItem("scroll_of_immortals",math.random(1,5))
					else
						dropcheck[x]:addItem("scroll_of_mithia",math.random(1,5))
					end
				end
			end
					
	end
	
}
