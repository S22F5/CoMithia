gruzar_phase_two = {
	move = function(mob,target)
		local checkplayeralive = {}
		local checkmobalive = {}
		local checkalive=0
		local countmob=0
		local fireball = {}
		local aoedot = {}

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
			mob.mapRegistry["p1summon"]=0
			mob.mapRegistry["gruzarp2aoeisactive"]=0
			mob.mapRegistry["gruzarp2engage"]=0
			mob.mapRegistry["gruzarp2intro"]=0
			mob.mapRegistry["redcrystal"]=1
			mob.mapRegistry["bluecrystal"]=1
			mob.mapRegistry["greencrystal"]=1
			mob.mapRegistry["yellowcrystal"]=1
			mob.attacker=target.ID
			mob:respawn()
			mob:removeHealth(1000000000)
			return
		end

		if(target.mapRegistry["gruzarp2aoeisactive"]==1) then
			mob.side=14
		else
			mob.side=2
		end
		mob:sendSide()

		if(target.mapRegistry["gruzarp2engage"]+5<=os.time() and target.mapRegistry["gruzarp2intro"]==0) then
			mob:talk(0,"Gruzar: Fools! Enough of those games!")
			target.mapRegistry["gruzarp2intro"]=1
		end
		if(target.mapRegistry["gruzarp2engage"]+8<=os.time() and target.mapRegistry["gruzarp2intro"]==1) then
			mob:talk(0,"Gruzar: Now... You will experience the Wrath of the Lord of Darkness!")
			target.mapRegistry["gruzarp2intro"]=2
			mob.light=20
		end



		--


		if(target.mapRegistry["phase2rangedattack"]<(os.time()) and target.mapRegistry["gruzarp2engage"]+10<=os.time()) then
			
			local find={}
			local ptable = {}
			for x=-10,10 do
				for y=-10,10 do
					find=target:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
					if(#find>0) then
						for z=1,#find do
							--find[z]:sendSide()
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
				while Player(ptable[ra]).state==1 or Player(ptable[ra]).ID==target.mapRegistry["phase2lasthit"] do
					ra=math.random(1,#ptable)
					count=count+1
					if(count==5) then
						break
					end
				end
				mob:sendAction(1,35)
				target:playSound(81)
				Player(ptable[ra]):removeHealthExtend(25000, 1, 1, 1, 1, 0)
				Player(ptable[ra]):sendAnimation(198)
				target.mapRegistry["phase2rangedattack"]=os.time()+6
				target.mapRegistry["phase2lasthit"]=Player(ptable[ra]).ID
			end
		end
		
		--
		if(target.mapRegistry["phase2flames"]<=(os.time()) and target.mapRegistry["gruzarp2engage"]+7<=os.time()) then
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
				while Player(ptable[ra]).state==1 or Player(ptable[ra]).ID==target.mapRegistry["phase2lasthit"] do
					ra=math.random(1,#ptable)
					count=count+1
					if(count==5) then
						break
					end
				end
				mob:sendAction(2,35)
				Player(ptable[ra]):sendAnimation(419)
				for x=-1,1 do
					for y=-1,1 do
						fireball=mob:getObjectsInCell(mob.m,Player(ptable[ra]).x+x,Player(ptable[ra]).y+y,BL_PC)
						if(#fireball>0) then
							for z=1,#fireball do
								if(fireball[z].state~=1) then
									fireball[z]:removeHealthExtend(7000, 1, 1, 1, 1, 0)
								end
							end
						end
					end
				end
				target:playSound(118)		
				Player(ptable[ra]):removeHealthExtend(7000, 1, 1, 1, 1, 0)
				target.mapRegistry["phase2flames"]=os.time()+3
				target.mapRegistry["phase2lasthit"]=Player(ptable[ra]).ID
			end
		end

		if(target.mapRegistry["phase2rangedattack3"]<(os.time()) and target.mapRegistry["gruzarp2engage"]+12<=os.time()) then
			
			local find={}
			local ptable = {}
			for x=-10,10 do
				for y=-10,10 do
					find=target:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
					if(#find>0) then
						for z=1,#find do
							--find[z]:sendSide()
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
				while Player(ptable[ra]).state==1 or Player(ptable[ra]).ID==target.mapRegistry["phase2lasthit2"] do
					ra=math.random(1,#ptable)
					count=count+1
					if(count==5) then
						break
					end
				end
				mob:sendAction(2,35)
				Player(ptable[ra]):setDuration("magic_siphon",10000)
				target.mapRegistry["phase2rangedattack3"]=os.time()+12
				target.mapRegistry["phase2lasthit2"]=Player(ptable[ra]).ID
			end
		end

		if(os.time()>=target.mapRegistry["gruzar2aoedot"]+60 and target.mapRegistry["gruzarp2engage"]+10<=os.time()) then
			target.mapRegistry["gruzar2aoedot"]=os.time()
			aoedot=mob:getObjectsInArea(BL_PC)
			if(#aoedot>0) then
				for z=1,#aoedot do
					if(aoedot[z].state~=1) then
						aoedot[z]:setDuration("darken_soul",40000)
					end
				end
			end			
		end

		--

		if(os.time()>target.mapRegistry["gruzarp2engage"]+30 and os.time()>=target.mapRegistry["gruzarp2aoe"]+30 and target.mapRegistry["gruzarp2aoeisactive"]==0) then
			target.mapRegistry["redcrystal"]=0
			target.mapRegistry["bluecrystal"]=0
			target.mapRegistry["greencrystal"]=0
			target.mapRegistry["yellowcrystal"]=0
			target.mapRegistry["gruzarp2aoeisactive"]=1
			target.mapRegistry["gruzarp2aoestartincant"]=os.time()
			mob:talk(0,"Gruzar: This will not be over so soon.")
			target:broadcast(mob.m,"-Gruzar starts drawing power from the stones and enters a frenzy-")
		end
		if(target.mapRegistry["bluecrystal"]==1 and target.mapRegistry["yellowcrystal"]==1 and target.mapRegistry["greencrystal"]==1 and target.mapRegistry["redcrystal"]==1 and target.mapRegistry["gruzarp2aoeisactive"]==1) then
			mob:talk(0,"Gruzar: Urgh...")
			target:broadcast(mob.m,"-The combined power of the Crystals manages to stop Gruzar!-")
			target.mapRegistry["gruzarp2aoeisactive"]=0
			target.mapRegistry["gruzarp2aoe"]=os.time()
		end

		if(target.mapRegistry["gruzarp2aoeisactive"]==1) then
			if(target.mapRegistry["gruzarp2aoestartincant"]+2<=os.time()) then
				mob:sendAnimation(85)
				local aoefind = {}
				for x=-10,10 do
					for y=-10,10 do
						aoefind=target:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
						if(#aoefind>0) then
							for z=1,#aoefind do
								if(aoefind[z].state~=1) then
									aoefind[z]:removeHealth(3000)
								end
							end
						end
					end
				end
			end
		end




	

					
	end,
	on_death=function(mob,player)
		mob.light=0
		player.mapRegistry["p1summon"]=0
		player.mapRegistry["gruzarp2aoeisactive"]=0
		player.mapRegistry["gruzarp2engage"]=0
		player.mapRegistry["gruzarp2intro"]=0
		player.mapRegistry["redcrystal"]=1
		player.mapRegistry["bluecrystal"]=1
		player.mapRegistry["greencrystal"]=1
		player.mapRegistry["yellowcrystal"]=1
		local checkplayeralive = {}
		local checkmobalive = {}
		local checkalive=0
		local countmob=0

		for x=-10,10 do
			for y=-10,10 do
				checkplayeralive=mob:getObjectsInCell(mob.m,mob.x+x,mob.y+y,BL_PC)
				if(#checkplayeralive>0) then
					for z=1,#checkplayeralive do
						--checkplayeralive[z]:sendSide()
						if(checkplayeralive[z].state~=1) then
							checkalive=checkalive+1
						end
					end
				end
			end
		end


		player.mapRegistry["gruzarp2engage"]=0


		if(checkalive~=0) then
			--blabla drops
			player:broadcast(-1,"-The earth shakes violently while you hear a distant murmur... Gruzar is no more-")
			local lootchoice=math.random(1,1000)
			local recipechoice=math.random(1,4)
			local crystalchoice=math.random(1,4)
			local ringchoice=math.random(1,4)
			local twohander=math.random(1,2)
			local steeddrop=math.random(1,100)

			mob:dropItem(0,math.random(25000,35000))
			mob:dropItem("soulstone",200)
			mob:dropItem("amethyst",math.random(20,50))
			mob:dropItem("chrysocolla",math.random(10,20))
			mob:dropItem("tigers_eye",math.random(1,10))


			if(lootchoice<=200) then
				if(recipechoice==1) then
					mob:dropItem("recipe_face_smasher",1)
				elseif(recipechoice==2) then
					mob:dropItem("recipe_quickblade",1)
				elseif(recipechoice==3) then
					mob:dropItem("recipe_crystalheart",1)
				elseif(recipechoice==4) then
					mob:dropItem("recipe_twilight",1)
				end
			elseif(lootchoice>200 and lootchoice<=700) then
				if(crystalchoice==1) then
					mob:dropItem("yellow_crystal_shard",1)
				elseif(crystalchoice==2) then
					mob:dropItem("red_crystal_shard",1)
				elseif(crystalchoice==3) then
					mob:dropItem("green_crystal_shard",1)
				elseif(crystalchoice==4) then
					mob:dropItem("blue_crystal_shard",1)
				end
			elseif(lootchoice>700 and lootchoice<=999) then
				if(ringchoice==1) then
					mob:dropItem("gold_plated_band",1)
				elseif(ringchoice==2) then
					mob:dropItem("gladiator_glove",1)
				elseif(ringchoice==3) then
					mob:dropItem("trapped_soul",1)
				elseif(ringchoice==4) then
					mob:dropItem("eternal_binding",1)
				end
			elseif(lootchoice==1000) then
				if(twohander==1) then
					mob:dropItem("chaos",1)
				elseif(twohander==2) then
					mob:dropItem("shadow",1)
				end
			end
			if(steeddrop==1) then
				mob:dropItem("collar_gruzars_steed",1)
			end
			
			

			local rewardgruzar=mob:getObjectsInArea(BL_PC)
				if(#rewardgruzar>0) then
					for z=1,#rewardgruzar do
						if(rewardgruzar[z].registry["gruzaraccessquest"]==2) then
							rewardgruzar[z].registry["gruzaraccessquest"]=3
						end
					end
				end
		end
		if(player.mapRegistry["gruzarp2drop"]==1) then
			player.mapRegistry["gruzarp2drop"]=0
		end
		
	end
	
}
