Necrosis = {
	move = function(mob,target)
		local xcoord=mob.x
		local ycoord=mob.y
		local m=mob.m
	        local gMember
		local finding = { }
		local cho
		local ra=math.random(1,25)
		local calc=0
		local ran=0


		if(target.group~=nil) then	
		if(target.blType==BL_PC and #target.group>1 and ra==1) then
			cho=math.random(1,#target.group)
				while(Player(target.group[cho]).m~=mob.m or Player(target.group[cho]).state==1) do
					cho=math.random(1,#target.group)
					ran=ran+1
					if(ran>100) then break end
				end
				necromancer_curse.cast(mob,Player(target.group[cho]))
		end
                else
			if(ra==1 and target.m==mob.m) then
				necromancer_curse.cast(mob,target)
			end				

		end		
		


		if(mob.health<(mob.maxHealth/4)) then
			if(target.blType==BL_PC) then
			for x=1,30 do
				for y=1,30 do
					finding=target:getObjectsInCell(m,x,y,BL_MOB)
					if(#finding>0) then
						for z=1,#finding do
							if(finding[z].name=="Broken bones") then
								target.mapRegistry["bonescount"]=0
								finding[z]:sendAnimation(31)
								mob:talk(0,"Necrosis: I shall sacrifice for the greater good, Broken bones!")
								finding[z]:talk(0,"Arrrrg!")
								finding[z].attacker=target.ID
								finding[z]:removeHealth(500000)
								mob:sendAnimation(11)
								mob:addHealth(1000000)
								break
							end
						end
					end
				end
			end
			end
		end


		if(mob.health<(mob.maxHealth/2) and target.mapRegistry["bonescount"]<=1) then
			local count=0
			if(target.blType==BL_PC and target.m==mob.m) then
				local check=mob:getObjectsInArea(BL_MOB)
				if(#check>0) then
					for z=1,#check do
						if(check[z].name=="Broken bones") then
							count=count+1
						end
					end
				end
				if(count==0) then
					mob:talk(0,"Necrosis: Rise and protect your Master, Broken bones!")
				end
				if(count<=1) then
					target.mapRegistry["bonescount"]=target.mapRegistry["bonescount"]+1
					mob:spawn(67,mob.x,mob.y,1)
				end
			end	
		end
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

	on_spawn=function(mob)
		mob.mapRegistry["bonescount"]=0
		mob.mapRegistry["necroskellspawn"]=0
		mob.mapRegistry["necrobosscheck"]=0
	end,

	on_death=function(mob,player)
	local ra=math.random(1,100)
	local ran=math.random(1,2)
	local d=math.random(1,9)
	local e=math.random(500,800)
	local gMember
		player.mapRegistry["bonescount"]=0
		player.mapRegistry["necroskellspawn"]=0
		player.mapRegistry["necrobosscheck"]=0
		if(ra>=1 and ra<=10) then
			mob:dropItem("safety_token",5)
		elseif(ra>10 and ra<=15) then
			if(ran==1) then
				mob:dropItem("recipe_bloodsoaked_claymore",1)
			else
				mob:dropItem("recipe_cursed_spire",1)
			end
		elseif(ra>15 and ra<=20) then
			if(d==1) then
				mob:dropItem("recipe_durable_armor",1)
			elseif(d==2) then
				mob:dropItem("recipe_durable_armor_dress",1)
			elseif(d==3) then
				mob:dropItem("recipe_durable_platemail",1)
			elseif(d==4) then
				mob:dropItem("recipe_durable_plate_dress",1)
			elseif(d==5) then
				mob:dropItem("recipe_durable_mantle",1)
			elseif(d==6) then
				mob:dropItem("recipe_durable_drapery",1)
			elseif(d==7) then
				mob:dropItem("recipe_durable_clothes",1)
			elseif(d==8) then
				mob:dropItem("recipe_durable_skirt",1)
			elseif(d==9) then
				mob:dropItem("recipe_chrysocolla_trinket",1)
			end
		elseif(ra>20 and ra<=40) then
			mob:dropItem("light_crossbow",1)
		elseif(ra>40) then
			mob:dropItem(0,e)
		end
				
	end


	
}
