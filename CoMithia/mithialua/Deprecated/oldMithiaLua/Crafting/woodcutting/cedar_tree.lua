cedar_tree = {
	move = function(mob,target)
		mob:flushDuration()
	end,

	on_death=function(mob,player)
		local r=math.random(1,100)
		local s=math.random(2,3)
		local t=math.random(1,4)
		local b=0
		local l=math.random(0,player.registry["woodcutter"]+1)
		local k=player.registry["woodcutter"]+1
		local m=((player.registry["woodcutter"]/40)+50)		

		if(player:hasEquipped({"basic_woodcutting_axe"})) then
				player:sendMinitext("Your axe is not good enough for wood of that quality.")
				return
		end
		if(not player:hasEquipped({"sturdy_woodcutting_axe"})) then
			if(not player:hasEquipped({"reinforced_woodcutting_axe"})) then
				player:sendMinitext("You can not woodcut without a proper axe.")
				return
			end
		end


	player:giveXP(math.floor(5+(((math.pow(player.level,4)/30)/17)/2)*(1+(player.registry["currenttier"]*0.15))))
	player:sendStatus()

	if(m>70) then 
		m=70
	end

	if(m>r) then
		if(l/k>0.33) then b=1 end
		if(l/k>0.66) then b=2 end
		if(l/k>0.85) then b=3 end
		s=s+b
		player:addItem("cedar_log",s)
			if(t>2) then
				player.registry["woodcutter"]=player.registry["woodcutter"]+(s*2)
			end

		local craftlevel="Beginner"
		if(player.registry["woodcutter"]>=1 and player.registry["woodcutter"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["woodcutter"]>=25 and player.registry["woodcutter"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["woodcutter"]>=220 and player.registry["woodcutter"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["woodcutter"]>=840 and player.registry["woodcutter"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["woodcutter"]>=2200 and player.registry["woodcutter"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["woodcutter"]>=6400 and player.registry["woodcutter"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["woodcutter"]>=18000 and player.registry["woodcutter"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["woodcutter"]>=50000 and player.registry["woodcutter"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["woodcutter"]>=124000 and player.registry["woodcutter"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["woodcutter"]>=237000 and player.registry["woodcutter"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["woodcutter"]>=400000 and player.registry["woodcutter"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["woodcutter"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("woodcutter")
		player:addLegend(""..craftlevel.." lumberjack","woodcutter",130,128)
		
	else
		player:addItem("cedar_log",1)
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
	   if(m==60) then
			while t==0 do
					u=math.random(1,23)
					v=math.random(1,23)
					obj=getObject(m,u,v)
					l=mob:getObjectsInCell(m,u,v,BL_MOB)
					if(obj==0 and #l==0) then
						mob.x=u
						mob.y=v
						t=1
						break
					end
	
			end
	   elseif(m==59) then
			while t==0 do
					u=math.random(1,23)
					v=math.random(1,23)
					obj=getObject(m,u,v)
					l=mob:getObjectsInCell(m,u,v,BL_MOB)
					if(obj==0 and #l==0) then
						mob.x=u
						mob.y=v
						t=1
						break
					end
	
			end
	   end
        end
	
}
