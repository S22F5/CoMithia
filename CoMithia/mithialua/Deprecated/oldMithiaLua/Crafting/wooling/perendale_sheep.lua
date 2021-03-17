perendale_sheep = {
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
		local r=math.random(1,100)
		local s=math.random(2,3)
		local t=math.random(1,4)
		local b=0
		local l=math.random(0,player.registry["shepherd"]+1)
		local k=player.registry["shepherd"]+1
		local m=((player.registry["shepherd"]/40)+50)		
		
		if(player:hasEquipped({"basic_shears"})==true) then
			player:sendMinitext("Your shears are not good enough for wool of that quality.")
			return
		end
		if(not player:hasEquipped({"sturdy_shears"})) then
			if(not player:hasEquipped({"reinforced_shears"})) then
				player:sendMinitext("You can not shear wool without proper tools.")
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
		player:addItem("perendale_wool",s)
		--Skill bonus from Tier2
		s=s*2
		--Skill bonus from Tier2
			if(t>1) then
				player.registry["shepherd"]=player.registry["shepherd"]+s
			end

		local craftlevel="Beginner"
		if(player.registry["shepherd"]>=1 and player.registry["shepherd"]<25) then
			craftlevel="Beginner"
		end
		if(player.registry["shepherd"]>=25 and player.registry["shepherd"]<220) then
			craftlevel="Novice"
		end
		if(player.registry["shepherd"]>=220 and player.registry["shepherd"]<840) then
			craftlevel="Apprentice"
		end
		if(player.registry["shepherd"]>=840 and player.registry["shepherd"]<2200) then
			craftlevel="Accomplished"
		end
		if(player.registry["shepherd"]>=2200 and player.registry["shepherd"]<6400) then
			craftlevel="Adept"
		end
		if(player.registry["shepherd"]>=6400 and player.registry["shepherd"]<18000) then
			craftlevel="Talented"
		end
		if(player.registry["shepherd"]>=18000 and player.registry["shepherd"]<50000) then
			craftlevel="Skilled"
		end
		if(player.registry["shepherd"]>=50000 and player.registry["shepherd"]<124000) then
			craftlevel="Expert"
		end
		if(player.registry["shepherd"]>=124000 and player.registry["shepherd"]<237000) then
			craftlevel="Master"
		end
		if(player.registry["shepherd"]>=237000 and player.registry["shepherd"]<400000) then
			craftlevel="Grand Master"
		end
		if(player.registry["shepherd"]>=400000 and player.registry["shepherd"]<680000) then
			craftlevel="Champion"
		end
		if(player.registry["shepherd"]>=680000) then
			craftlevel="Legendary"
		end
		player:removeLegendbyName("shepherd")
		player:addLegend(""..craftlevel.." shepherd","shepherd",137,128)
		
	else
		player:addItem("perendale_wool",1)
	end			
	end
	
}
