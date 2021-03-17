silver_vein = {
	move = function(mob,target)
		mob.target=0
		mob:flushDuration()
	end,

	on_death=function(mob,player)
		local r=math.random(1,100)
		local gem=math.random(1,100)
		local s=math.random(2,3)
		local t=math.random(1,4)
		local b=0
		local l=math.random(0,player.registry["miner"]+1)
		local k=player.registry["miner"]+1
		local m=((player.registry["miner"]/30)+50)		


		if(player:hasEquipped({"basic_mining_pick"})) then
			player:sendMinitext("You can not mine ore of that quality with this pick.")
			return
		end		

		if(not player:hasEquipped({"sturdy_mining_pick"})) then
			if(not player:hasEquipped({"reinforced_mining_pick"})) then
				player:sendMinitext("You can not mine without proper mining tools.")
				return
			end
		end

	player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
	player:sendStatus()


	if(m>=85) then
		m=85
	end

	if(m>r) then
		if(l/k>0.33) then b=1 end
		if(l/k>0.66) then b=2 end
		if(l/k>0.85) then b=3 end
		if(gem>=50) then
			player:addItem("chrysocolla",t)
		end
		player:addItem("silver_ore",s+b)

		--This is a bonus skill up from Silver
		b=b*2
		s=s*2
		--This is a bonus skill up from Silver

		s=s+b
		player:playSound(45)
			if(t>1) then
				player.registry["miner"]=player.registry["miner"]+s
			end

		local craftlevel="Beginner"
		if(player.registry["miner"]>=1 and player.registry["miner"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["miner"]>=25 and player.registry["miner"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["miner"]>=220 and player.registry["miner"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["miner"]>=840 and player.registry["miner"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["miner"]>=2200 and player.registry["miner"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["miner"]>=6400 and player.registry["miner"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["miner"]>=18000 and player.registry["miner"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["miner"]>=50000 and player.registry["miner"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["miner"]>=124000 and player.registry["miner"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["miner"]>=237000 and player.registry["miner"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["miner"]>=400000 and player.registry["miner"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["miner"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("miner")
		player:addLegend(""..craftlevel.." miner","miner",93,128)

		
	else
		player:addItem("silver_ore",1)
		player:playSound(45)
	end			
	end,

	on_spawn=function(mob)
	local t=0
	local u=0
	local v=0
	local p=0
	local obj=0
	local l = { }
	local m=mob.m
		if(m==58) then
			while t==0 do
					u=math.random(1,33)
					v=math.random(3,54)
					obj=getObject(m,u,v)
					l=mob:getObjectsInCell(m,u,v,BL_MOB)
					if(obj==0 and #l==0) then
						mob.x=u
						mob.y=v
						t=1
						break
					end
	
		end	end
	
	end
}
