lost_soul = {
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
		if(mob.mapRegistry["gatekeeperdead"]==0) then
			check = mob:getObjectsInArea(BL_PC)
			if(#check > 0) then
				for i=1,#check do
					if(player.state~=1) then
						check[i]:sendAnimation(145)
						check[i]:sendMinitext("You are afflicted by dark matter!")
						check[i]:removeHealthExtend(Player(check[i].ID).maxHealth*.20, 1, 1, 1, 1, 0)
					end
				end
			end
		end
	end	
}