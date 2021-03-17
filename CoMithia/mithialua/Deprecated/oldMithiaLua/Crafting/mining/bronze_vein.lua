bronze_vein = {
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
		
		if(not player:hasEquipped({"basic_mining_pick"})) then
			if(not player:hasEquipped({"sturdy_mining_pick"})) then
				if(not player:hasEquipped({"reinforced_mining_pick"})) then
					player:sendMinitext("You can not mine without proper mining tools.")
					return
				end
			end
		end

	player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
	player:sendStatus()

	if(m>85) then 
		m=85
	end

	if(m>r) then
		if(l/k>0.33) then b=1 end
		if(l/k>0.66) then b=2 end
		if(l/k>0.85) then b=3 end
		s=s+b
		if(gem>=50) then
			player:addItem("amethyst",t)
		end
		player:addItem("bronze_ore",s)
		player:playSound(45)
			if(t>1) then
				player.registry["miner"]=player.registry["miner"]+(s*2)
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
		player:addItem("bronze_ore",1)
		player:playSound(45)
	end			
	end,

	on_spawn=function(mob)
	local g1=0
	local t=0
	local u=0
	local v=0
	local p=0
	local obj=0
	local l = { }
	local m=mob.m
	   if(m==40) then
		if(mob.x>=30) then
			while t==0 do
				g1=math.random(1,354)
				if(g1<=336) then
					u=math.random(36,59)
					v=math.random(21,34)
					--l=getObjectsInCell(m,u,v,BL_MOB)
					--if(#l==0) then
						obj=getObject(m,u,v)
						if(obj==0) then
							mob.x=u
							mob.y=v
							break
						end
					--end
				else
					u=math.random(33,35)
					v=math.random(29,34)
					--l=getObjectsInCell(m,u,v,BL_MOB)
					--if(#l==0) then
						obj=getObject(m,u,v)
						if(obj==0) then
							mob.x=u
							mob.y=v
							break
						end
					--end
				end
			end
		else
			while t==0 do
				g1=math.random(1,349)
				if(g1<=204) then
					u=math.random(0,17)
					v=math.random(33,44)
					--l=getObjectsInCell(m,u,v,BL_MOB)
					--if(not #l>0) then
						obj=getObject(m,u,v)
						if(obj==0) then
							mob.x=u
							mob.y=v
							break
						end
					--end
				elseif(g1>204 and g1<=222) then
					u=math.random(0,8)
					v=math.random(30,32)
					--l=getObjectsInCell(m,u,v,BL_MOB)
					--if(#l==0) then
						obj=getObject(m,u,v)
						if(obj==0) then
							mob.x=u
							mob.y=v
							break
						end
					--end
				elseif(g1>222 and g1<=312) then
					u=math.random(0,8)
					v=math.random(45,54)
					--l=getObjectsInCell(m,u,v,BL_MOB)
					--if(#l==0) then
						obj=getObject(m,u,v)
						if(obj==0) then
							mob.x=u
							mob.y=v
							break
						end
					--end
				elseif(g1>312) then
					u=math.random(0,4)
					v=math.random(55,58)
					--l=getObjectsInCell(m,u,v,BL_MOB)
					--if(#l==0) then
						obj=getObject(m,u,v)
						if(obj==0) then
							mob.x=u
							mob.y=v
							break
						end
					--end
				end
			end
		end
	   end
   end
	
}
