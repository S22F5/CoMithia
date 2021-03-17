test = {
	move = function(mob,target)
		local moved=true
		if(mob.paralyzed) then
               return
            end
		--mob:talk(1,""..mob.side.."")
		mob.x=math.random(0,18)
		mob.y=math.random(0,18)
		mob:sendSide()
		mob:talk(1,""..mob.x..","..mob.y.."")
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


	on_death=function(mob,player)

	local gMember
	local calc=0
	local rand=0
	local cho=0
	local calc2=0

	for _,gID in pairs(player.group) do
		calc2=calc2+1
	end
	
	player:sendMinitext("Debug calc 2 : " ..calc2)

	for _,gID in pairs(player.group) do
	gMember=Player(gID)
		if(gMember.class==1) then
			calc=calc+1
			break
		end
	end

	for _,gID in pairs(player.group) do
	gMember=Player(gID)
		if(gMember.class==2) then
			calc=calc+1
			break
		end
	end

	for _,gID in pairs(player.group) do
	gMember=Player(gID)
		if(gMember.class==3) then
			calc=calc+1
			break
		end
	end
	
	for _,gID in pairs(player.group) do
	gMember=Player(gID)
		if(gMember.class==4) then
			calc=calc+1
			break
		end
	end
	player:sendMinitext("Debug calc " ..calc)

	if(calc>=1) then
		rand=math.random(1,2)
		player:sendMinitext("Debug rand " ..rand)
		if(rand==1) then
			cho=math.random(1,calc2)
			player:sendMinitext("Debug cho " ..cho)
			Player(player.group[cho]):addItem(161,1)
			for _,gID in pairs(player.group) do
				gMember=Player(gID)
				gMember:sendMinitext(Player(player.group[cho]).name .. " received a recipe.")
			end
		end
	end

	end
}
