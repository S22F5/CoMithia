gruzar_phase_one = {
	move = function(mob,target)
		local checkplayeralive = {}
		local checkmobalive = {}
		local checkalive=0
		local countmob=0
		
		for x=-8,8 do
			for y=-8,8 do
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
			for x=-8,8 do
				for y=-8,8 do
					checkmobalive=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_MOB)
					if(#checkmobalive>0) then
						for z=1,#checkmobalive do
							if(checkmobalive[z].name=="Shade of pain") then
								checkmobalive[z].attacker=target.ID
								checkmobalive[z]:removeHealth(10000000000)
							end
							if(checkmobalive[z].name=="Shade of agony") then
								checkmobalive[z].attacker=target.ID
								checkmobalive[z]:removeHealth(10000000000)
							end
							if(checkmobalive[z].name=="Shade of misery") then
								checkmobalive[z].attacker=target.ID
								checkmobalive[z]:removeHealth(10000000000)
							end
							if(checkmobalive[z].name=="Shade of suffering") then
								checkmobalive[z].attacker=target.ID
								checkmobalive[z]:removeHealth(10000000000)
							end
							if(checkmobalive[z].name=="Plasma ball") then
								checkmobalive[z].attacker=target.ID
								checkmobalive[z]:removeHealth(10000000000)
							end

						end
					end
				end
			end
							
					
			mob:addHealth(1000000000)
			mob.mapRegistry["p1summon"]=0
			mob.mapRegistry["gruzarp1engage"]=0
			mob.mapRegistry["gruzarspeech"]=0
			mob.mapRegistry["gruzarp1engagetrigger"]=0
			return
		end

		if(target.mapRegistry["gruzarp1engage"]<=os.time() and target.mapRegistry["gruzarp1engagetrigger"]==0) then
				mob.side=2
				mob:sendSide()
				target.mapRegistry["gruzarp1engage"]=os.time()
				target.mapRegistry["gruzarp1engagetrigger"]=1
		end
		if(os.time()<target.mapRegistry["gruzarp1engage"]+30 and os.time()>=target.mapRegistry["gruzarp1engage"]+10 and target.mapRegistry["gruzarspeech"]==0) then
				mob:talk(0,"Gruzar: Ah, new adventurers taking a chance at me.")
				target.mapRegistry["gruzarspeech"]=1
		end
		if(os.time()<target.mapRegistry["gruzarp1engage"]+30 and os.time()>=target.mapRegistry["gruzarp1engage"]+14 and target.mapRegistry["gruzarspeech"]==1) then
				mob:talk(0,"Gruzar: I am flattered.")
				target.mapRegistry["gruzarspeech"]=2
		end
		if(os.time()<target.mapRegistry["gruzarp1engage"]+30 and os.time()>=target.mapRegistry["gruzarp1engage"]+18 and target.mapRegistry["gruzarspeech"]==2) then
				mob:talk(0,"Gruzar: But you should know that there is nothing you can do to stop me now.")
				target.mapRegistry["gruzarspeech"]=3
		end
		if(os.time()<target.mapRegistry["gruzarp1engage"]+30 and os.time()>=target.mapRegistry["gruzarp1engage"]+22 and target.mapRegistry["gruzarspeech"]==3) then
				mob:talk(0,"Gruzar: Your lives will soon be mine and you will join the ranks of my army.")
				target.mapRegistry["gruzarspeech"]=4
		end
		if(os.time()<target.mapRegistry["gruzarp1engage"]+30 and os.time()>=target.mapRegistry["gruzarp1engage"]+26 and target.mapRegistry["gruzarspeech"]==4) then
				mob:talk(0,"Gruzar: Now come... Come closer... embrace your new Master.")
				target.mapRegistry["gruzarspeech"]=5
		end
		if(os.time()<target.mapRegistry["gruzarp1engage"]+30 and os.time()>=target.mapRegistry["gruzarp1engage"]) then
				mob:addHealth(1000000000)
				return
		end






		if(target.mapRegistry["phase1rangedattack"]<os.time() and os.time()>target.mapRegistry["gruzarp1engage"]+30) then
			
			local find={}
			local ptable = {}
			for x=-8,8 do
				for y=-8,8 do
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
				while Player(ptable[ra]).state==1 or Player(ptable[ra]).ID==target.mapRegistry["phase1lasthit"] do
					ra=math.random(1,#ptable)
					count=count+1
					if(count==5) then
						break
					end
				end
				mob:sendAction(1,35)
				target:playSound(81)
				Player(ptable[ra]):removeHealthExtend(20000, 1, 1, 1, 1, 0)
				Player(ptable[ra]):sendAnimation(198)
				target.mapRegistry["phase1rangedattack"]=os.time()+3
				target.mapRegistry["phase1lasthit"]=Player(ptable[ra]).ID
			end
		end

		if(os.time()>target.mapRegistry["gruzarp1engage"]+30 and os.time()>=target.mapRegistry["gruzaraoedot"]+60) then
			target.mapRegistry["gruzaraoedot"]=os.time()
			local aoefind = {}
			mob:sendAction(1,35)
			mob:talk(0,"Gruzar: Darkness comes... closer!")
			for x=-8,8 do
				for y=-8,8 do
					aoefind=target:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
					if(#aoefind>0) then
						for z=1,#aoefind do
							if(aoefind[z].state~=1) then
								aoefind[z]:setDuration("darken_soul",30000)
							end
						end
					end
				end
			end
		end

		if(mob.health<(mob.maxHealth*0.66) and mob.mapRegistry["p1summon"]==0) then
			mob.mapRegistry["p1summon"]=1
			mob:talk(0,"Gruzar: My minions have failed to protect me... But this time they won't.")
			mob:spawn(139,12,4,1)
			mob:spawn(140,12,12,1)
			mob:spawn(141,4,12,1)
			mob:spawn(142,4,4,1)
		end
		if(mob.health<(mob.maxHealth*0.33) and mob.mapRegistry["p1summon"]==1) then
			mob.mapRegistry["p1summon"]=2
			mob:talk(0,"Gruzar: My Magic grows weaker, come and protect your Master, minions.")
			mob:spawn(139,12,4,1)
			mob:spawn(140,12,12,1)
			mob:spawn(141,4,12,1)
			mob:spawn(142,4,4,1)
		end
	

					
	end,
	on_death=function(mob,player)
		--player:broadcast(mob.m,"-Angered, Gruzar now assumes his true form!-")
		mob.mapRegistry["p1summon"]=0
		mob.mapRegistry["gruzarp2drop"]=0
		mob.mapRegistry["gruzarp2engage"]=os.time()
		mob.mapRegistry["gruzarp2intro"]=0
		mob.mapRegistry["gruzarp1engage"]=0
		mob.mapRegistry["gruzarspeech"]=0
		mob.mapRegistry["gruzarp1engagetrigger"]=0
		mob:spawn(138,mob.x,mob.y,1)
	end
	
}
