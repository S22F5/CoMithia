bow = {
	thrown = function(player)

	--[[	if(check~=nil and check[1].blType~=BL_PC and check[1].blType~=BL_NPC) then
			if(check[1].state~=1) then
			local bowrange=6
			if(player.side==0) then
				player:throw(player.x,player.y-bowrange,6,0,1)
			elseif(player.side==1) then
				player:throw(player.x+bowrange,player.y,7,0,1)
			elseif(player.side==2) then
				player:throw(player.x,player.y+bowrange,8,0,1)
			elseif(player.side==3) then
				player:throw(player.x-bowrange,player.y,9,0,1)
			end
				check[1].attacker=player.ID
				check[1]:removeHealth(5000)
			end
		else
			player:minitext("no target")
		end		
]]--		
			
		local bowrange=8
		
		local check={}
		check=player:getObjectsInArea(BL_MOB)
		
		if(#check>0) then
			local r = math.random(1,#check)
			if(player.side==0) then
				player:throw(check[r].x,check[r].y,1268,0,1)
			elseif(player.side==1) then
				player:throw(check[r].x,check[r].y,1268,0,1)
			elseif(player.side==2) then
				player:throw(check[r].x,check[r].y,1268,0,1)
			elseif(player.side==3) then
				player:throw(check[r].x,check[r].y,1268,0,1)
			end
			
			if(player.magic > 600) then
				player:addMana(-600)
				player:sendMinitext("Fireball thrown")
				check[r].attacker=player.ID
				check[r]:sendAnimation(8)
				check[r]:removeHealth(7500)
			else
				player:sendMinitext("You do not have enough mana!")
			end

		else	
			if(player.side==0) then
				player:throw(player.x,player.y-bowrange,1268,0,1)
			elseif(player.side==1) then
				player:throw(player.x+bowrange,player.y,1268,0,1)
			elseif(player.side==2) then
				player:throw(player.x,player.y+bowrange,1268,0,1)
			elseif(player.side==3) then
				player:throw(player.x-bowrange,player.y,1268,0,1)
			end
			player:sendMinitext("You didn't hit anything.")
		end
		
		player:sendAction(1,30)
	end
}


